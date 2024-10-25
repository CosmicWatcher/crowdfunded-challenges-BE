import express, { type Router } from "express";
import { z } from "zod";

import {
  createSubmission,
  getSubmissionList,
} from "@/api/submission/submissionController";
import { FORM_LIMITS } from "@/common/configs/constants";
import {
  commonValidations,
  validateRequest,
  validateUser,
} from "@/common/utils/validators";

export const submissionRouter: Router = express.Router();

const getSubmissionListSchema = z.object({
  params: z.object({ id: commonValidations.id }),
  query: z.object({ page: commonValidations.page }),
});

const createSubmissionSchema = z.object({
  body: z.object({
    taskId: commonValidations.id,
    description: z
      .string()
      .min(FORM_LIMITS.TASK_SUBMISSION.DESCRIPTION.MIN, {
        message: `Description must at least ${FORM_LIMITS.TASK_SUBMISSION.DESCRIPTION.MIN} characters`,
      })
      .max(FORM_LIMITS.TASK_SUBMISSION.DESCRIPTION.MAX, {
        message: `Description must be less than ${FORM_LIMITS.TASK_SUBMISSION.DESCRIPTION.MAX} characters`,
      }),
  }),
});

submissionRouter.get(
  "/:id",
  validateRequest(getSubmissionListSchema),
  getSubmissionList,
);
submissionRouter.post(
  "/create",
  validateRequest(createSubmissionSchema),
  validateUser(),
  createSubmission,
);
