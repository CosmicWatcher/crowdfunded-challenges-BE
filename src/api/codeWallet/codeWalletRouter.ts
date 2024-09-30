import { paymentIntents } from "@code-wallet/client";
import express, { type Request, type Response, type Router } from "express";

import { ServiceResponse } from "@/common/models/serviceResponse";
import { env } from "@/common/utils/envConfig";
import { handleServiceResponse } from "@/common/utils/httpHandlers";

export const codeWalletRouter: Router = express.Router();

codeWalletRouter.post("/create-intent", (_req: Request, res: Response) => {
  const amount = 0.05;
  const currency = "usd";
  const destination = env.KIN_DESTINATION;

  async function create() {
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
  }
  create()
    .then((ret) => {
      return ret;
    })
    .catch((err) => {
      const serviceResponse = ServiceResponse.failure(String(err), null, 500);
      return handleServiceResponse(serviceResponse, res);
    });
});
