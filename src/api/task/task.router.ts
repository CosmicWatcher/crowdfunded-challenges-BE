import express, { type Router } from "express";
import { z } from "zod";

import {
  createTask,
  endTask,
  getFeaturedTasks,
  getTaskById,
  getTaskList,
  settleTask,
} from "@/api/task/task.controller";
import { TaskKind, TaskStatus } from "@/api/task/task.model";
import { FORM_LIMITS } from "@/common/configs/constants";
import {
  commonValidations,
  validateRequest,
  validateUser,
} from "@/common/middleware/validators";

export const taskRouter: Router = express.Router();

const getTaskSchema = z.object({
  params: z.object({ id: commonValidations.id }),
});

const status: z.ZodType<TaskStatus> = z.enum([
  "active",
  "successful",
  "failed",
]);
const getTaskListSchema = z.object({
  query: z.object({
    page: commonValidations.page,
    status: status.optional(),
  }),
});

const kinds: z.ZodType<TaskKind> = z.enum(["community", "personal"]);
const createTaskSchema = z.object({
  body: z.object({
    kind: kinds,
    title: z
      .string()
      .min(FORM_LIMITS.TASK_CREATION.TITLE.MIN, {
        message: `Title must be at least ${FORM_LIMITS.TASK_CREATION.TITLE.MIN} characters`,
      })
      .max(FORM_LIMITS.TASK_CREATION.TITLE.MAX, {
        message: `Title must be less than ${FORM_LIMITS.TASK_CREATION.TITLE.MAX} characters`,
      }),
    description: z.string().max(FORM_LIMITS.TASK_CREATION.DESCRIPTION.MAX, {
      message: `Description must be less than ${FORM_LIMITS.TASK_CREATION.DESCRIPTION.MAX} characters`,
    }),
    maxWinners: z
      .number()
      .min(FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MIN, {
        message: `Max winners must be at least ${FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MIN}`,
      })
      .max(FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MAX, {
        message: `Max winners must be less than ${FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MAX}`,
      }),
    endedAt: z.string().datetime(),
  }),
});

taskRouter.get("/", validateRequest(getTaskListSchema), getTaskList);
taskRouter.get(
  "/featured",
  validateRequest(getTaskListSchema),
  getFeaturedTasks,
);
taskRouter.post("/:id/end", validateRequest(getTaskSchema), endTask);
taskRouter.post(
  "/:id/success",
  validateRequest(getTaskSchema),
  validateUser(),
  settleTask(true),
);
taskRouter.post(
  "/:id/fail",
  validateRequest(getTaskSchema),
  validateUser(),
  settleTask(false),
);
taskRouter.get("/:id", validateRequest(getTaskSchema), getTaskById);
// taskRouter.delete(
//   "/:id",
//   validateRequest(getTaskSchema),
//   validateUser(),
//   deleteTask,
// );
taskRouter.post(
  "/create",
  validateRequest(createTaskSchema),
  validateUser(),
  createTask,
);
