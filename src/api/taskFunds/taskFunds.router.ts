import { isValidCurrency } from "@code-wallet/currency";
import bodyParser from "body-parser";
import express, { Router } from "express";
import { z } from "zod";

import {
  createIntent,
  mockRecordContribution,
  recordContribution,
} from "@/api/taskFunds/taskFunds.controller";
import { validateRequest } from "@/common/middleware/validators";
import { validateUser } from "@/common/middleware/validators";
import { commonValidations } from "@/common/middleware/validators";

export const taskFundsRouter: Router = express.Router();

const createIntentSchema = z.object({
  params: z.object({ id: commonValidations.id }),
  body: z.object({
    amount: z.number().positive(),
    currency: z.string().refine((val) => isValidCurrency(val), {
      message: "Invalid currency code",
    }),
  }),
});

taskFundsRouter.post(
  "/create-intent/:id",
  validateRequest(createIntentSchema),
  validateUser(),
  createIntent,
);

taskFundsRouter.post("/post", validateUser(), mockRecordContribution);
taskFundsRouter.post(
  "/record-contribution",
  bodyParser.text({ type: "application/jwt" }),
  recordContribution,
);
