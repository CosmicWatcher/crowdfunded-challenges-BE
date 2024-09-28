import { paymentIntents } from "@code-wallet/client";
import express, { type Request, type Response, type Router } from "express";

import { ServiceResponse } from "@/common/models/serviceResponse";
import { env } from "@/common/utils/envConfig";
import { handleServiceResponse } from "@/common/utils/httpHandlers";

export const codeWalletRouter: Router = express.Router();

codeWalletRouter.post("/create-intent", async (req: Request, res: Response) => {
  const amount = 0.05;
  const currency = "usd";
  const destination = env.KIN_DESTINATION;

  const { clientSecret, id } = await paymentIntents.create({
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
  handleServiceResponse(serviceResponse, res);
});
