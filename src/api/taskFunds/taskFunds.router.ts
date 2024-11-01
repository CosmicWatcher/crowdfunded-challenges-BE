import express, { Router } from "express";
import { z } from "zod";

import { mockRecordContribution } from "@/api/taskFunds/taskFunds.controller";
import { validateRequest } from "@/common/middleware/validators";
import { validateUser } from "@/common/middleware/validators";
import { commonValidations } from "@/common/middleware/validators";

export const taskFundsRouter: Router = express.Router();

taskFundsRouter.post("/post", validateUser(), mockRecordContribution);
