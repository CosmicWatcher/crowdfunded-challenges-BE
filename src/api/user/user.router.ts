import { Keypair } from "@solana/web3.js";
import express, { Request, Response, Router } from "express";

import { User } from "@/api/user/user.model";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { handleServiceResponse } from "@/common/utils/helpers";
import { supabase } from "@/common/utils/supabase";

export const userRouter: Router = express.Router();

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
