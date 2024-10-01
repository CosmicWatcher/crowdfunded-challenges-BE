/* eslint-disable @typescript-eslint/no-misused-promises */
import { paymentIntents } from "@code-wallet/client";
import express, { type Request, type Response, type Router } from "express";

import { ServiceResponse } from "@/common/models/serviceResponse";
import { env } from "@/common/utils/envConfig";
import { handleServiceResponse } from "@/common/utils/httpHandlers";
import { StatusCodes } from "http-status-codes";

export const codeWalletRouter: Router = express.Router();

codeWalletRouter.post(
  "/create-intent",
  async (_req: Request, res: Response) => {
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
      const serviceResponse = ServiceResponse.failure(
        String(err),
        null,
        StatusCodes.INTERNAL_SERVER_ERROR,
      );
      return handleServiceResponse(serviceResponse, res);
    }
  },
);
