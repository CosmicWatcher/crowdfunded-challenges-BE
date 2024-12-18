import { paymentIntents } from "@code-wallet/client";
import express, {
  NextFunction,
  type Request,
  type Response,
  type Router,
} from "express";

import {
  createLoginIntent,
  getVerifier,
  verifyLogin,
} from "@/api/codeWallet/codeWallet.controller";
import { env } from "@/common/configs/env";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { handleServiceResponse } from "@/common/utils/helpers";

export const codeWalletRouter: Router = express.Router();

codeWalletRouter.post(
  "/create-intent",
  async (_req: Request, res: Response, next: NextFunction) => {
    const amount = 0.05;
    const currency = "usd";
    const destination = env.KIN_DESTINATION;

    try {
      const { clientSecret } = await paymentIntents.create({
        mode: "payment",
        amount,
        currency,
        destination,
      });
      const serviceResponse = ServiceResponse.success("Intent Created", {
        amount,
        currency,
        destination,
        clientSecret,
      });
      return handleServiceResponse(serviceResponse, res);
    } catch (err) {
      next(err);
    }
  },
);

codeWalletRouter.get("/login/verifier", getVerifier);
codeWalletRouter.post("/login/create-intent", createLoginIntent);
codeWalletRouter.get("/login/success/:id", verifyLogin);
