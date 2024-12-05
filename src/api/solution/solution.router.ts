import express, { type Router } from "express";
import { z } from "zod";

import {
  createSolution,
  getSolutionList,
} from "@/api/solution/solution.controller";
import { FORM_LIMITS } from "@/common/configs/constants";
import {
  commonValidations,
  validateRequest,
  validateUser,
} from "@/common/middleware/validators";

export const solutionRouter: Router = express.Router();

const getSolutionListSchema = z.object({
  params: z.object({ id: commonValidations.id }),
  query: z.object({ page: commonValidations.page }),
});

const createSolutionSchema = z.object({
  body: z.object({
    taskId: commonValidations.id,
    title: z
      .string()
      .min(FORM_LIMITS.TASK_SOLUTION.TITLE.MIN, {
        message: `Title must at least ${FORM_LIMITS.TASK_SOLUTION.TITLE.MIN} characters`,
      })
      .max(FORM_LIMITS.TASK_SOLUTION.TITLE.MAX, {
        message: `Title must be less than ${FORM_LIMITS.TASK_SOLUTION.TITLE.MAX} characters`,
      }),
    description: z
      .string()
      .min(FORM_LIMITS.TASK_SOLUTION.DESCRIPTION.MIN, {
        message: `Description must be at least ${FORM_LIMITS.TASK_SOLUTION.DESCRIPTION.MIN} characters`,
      })
      .max(FORM_LIMITS.TASK_SOLUTION.DESCRIPTION.MAX, {
        message: `Description must be less than ${FORM_LIMITS.TASK_SOLUTION.DESCRIPTION.MAX} characters`,
      }),
  }),
});

solutionRouter.get(
  "/:id",
  validateRequest(getSolutionListSchema),
  getSolutionList,
);
solutionRouter.post(
  "/create",
  validateRequest(createSolutionSchema),
  validateUser(),
  createSolution,
);
