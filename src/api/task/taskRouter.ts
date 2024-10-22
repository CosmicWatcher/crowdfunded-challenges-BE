import express, { type Router } from "express";
import { validateRequest, validateUser } from "@/common/utils/httpHandlers";
import { z } from "zod";
import { FORM_LIMITS } from "@/common/configs/constants";
import { commonValidations } from "@/common/utils/commonValidation";
import { Task } from "@/api/task/taskModel";
import {
  createTask,
  getTaskById,
  getTaskList,
} from "@/api/task/taskController";

export const taskRouter: Router = express.Router();

const getTaskSchema = z.object({
  params: z.object({ id: commonValidations.id }),
});
const getTaskListSchema = z.object({
  query: z.object({ page: commonValidations.page }),
});
const createTaskSchema = z.object({
  body: z.object({
    kind: z.enum([Task.TYPES.COMMUNITY, Task.TYPES.PERSONAL]),
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
  }),
});

taskRouter.get("/", validateRequest(getTaskListSchema), getTaskList);
taskRouter.get("/:id", validateRequest(getTaskSchema), getTaskById);
taskRouter.post(
  "/create",
  validateRequest(createTaskSchema),
  validateUser(),
  createTask,
);
