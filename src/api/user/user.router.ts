import { Keypair } from "@solana/web3.js";
import express, { Request, Response, Router } from "express";
import { z } from "zod";

import {
  checkUsernameExists,
  getUserAccountById,
  updateUser,
} from "@/api/user/user.controller";
import { DepositAddressType, User } from "@/api/user/user.model";
import { FORM_LIMITS } from "@/common/configs/constants";
import { validateRequest, validateUser } from "@/common/middleware/validators";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { handleServiceResponse } from "@/common/utils/helpers";
import { createAccountOnChain } from "@/common/utils/solana";
import { supabase } from "@/common/utils/supabase";

export const userRouter: Router = express.Router();

const kinds: z.ZodType<DepositAddressType> = z.enum(["solana", "token"]);
const updateUserSchema = z.object({
  body: z.object({
    username: z
      .string()
      .min(FORM_LIMITS.ACCOUNT.USERNAME.MIN, {
        message: `Username must be at least ${FORM_LIMITS.ACCOUNT.USERNAME.MIN} characters`,
      })
      .max(FORM_LIMITS.ACCOUNT.USERNAME.MAX, {
        message: `Username must be less than ${FORM_LIMITS.ACCOUNT.USERNAME.MAX} characters`,
      })
      .refine((value) => /^[a-zA-Z0-9_.]+$/.test(value), {
        message: "Username can only contain letters, numbers, _ , and .",
      })
      .refine((value) => /^[a-zA-Z].*$/.test(value), {
        message: "Username must start with a letter.",
      })
      .refine((value) => /^.*[a-zA-Z0-9]$/.test(value), {
        message: "Username must end with a letter or number.",
      })
      .optional(),
    depositAddressInfo: z
      .object({
        address: z.string(),
        kind: kinds,
      })
      .optional(),
  }),
});

userRouter.get("/temp-wallet-creator", async (_req: Request, res: Response) => {
  try {
    const { data: userData, error: error1 } = await supabase
      .from(User.TABLE_NAME)
      .select();
    if (error1) throw new Error(JSON.stringify(error1));
    console.log("userData", userData);

    for (const user of userData) {
      const userId = user.id;
      const keypair = Keypair.generate();
      const { error: error2 } = await supabase.from("temp_wallets").insert({
        private_key: JSON.stringify(Array.from(keypair.secretKey)),
        public_key: keypair.publicKey.toBase58(),
        user_id: userId,
      });
      if (error2) throw new Error(JSON.stringify(error2));

      await createAccountOnChain(keypair);

      const { error: error3 } = await supabase
        .from(User.TABLE_NAME)
        .update({ deposit_address: keypair.publicKey.toBase58() })
        .eq("id", userId);
      if (error3) throw new Error(JSON.stringify(error3));
    }
  } catch (error) {
    const serviceResponse = ServiceResponse.failure(String(error), null);
    return handleServiceResponse(serviceResponse, res);
  }
});

userRouter.get("/account", validateUser(), getUserAccountById);
userRouter.put(
  "/",
  validateRequest(updateUserSchema),
  validateUser(),
  updateUser,
);
userRouter.post(
  "/check-username-exists",
  validateRequest(updateUserSchema),
  checkUsernameExists,
);
