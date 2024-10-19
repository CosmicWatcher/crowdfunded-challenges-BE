import { paymentIntents } from "@code-wallet/client";
import express, {
  NextFunction,
  type Request,
  type Response,
  type Router,
} from "express";

import { ServiceResponse } from "@/common/models/serviceResponse";
import { env } from "@/common/configs/env";
import { handleServiceResponse } from "@/common/utils/httpHandlers";

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
