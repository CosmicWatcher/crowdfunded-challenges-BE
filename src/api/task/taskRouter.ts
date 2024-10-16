import express, { type Request, type Response, type Router } from "express";
import { StatusCodes } from "http-status-codes";

import { ServiceResponse } from "@/common/models/serviceResponse";
import {
  handleServiceResponse,
  validateRequest,
  validateUser,
} from "@/common/utils/httpHandlers";
import { createClient } from "@/common/utils/supabase";
import { z } from "zod";
import { FORM_LIMITS, TASK_TYPES } from "@/common/configs/constants";

export const taskRouter: Router = express.Router();

const createTaskSchema = z.object({
  body: z.object({
    kind: z.enum([TASK_TYPES.COMMUNITY, TASK_TYPES.PERSONAL]),
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
        message: `Max winners must be at least ${FORM_LIMITS.TASK_CREATION.TITLE.MIN}`,
      })
      .max(FORM_LIMITS.TASK_CREATION.TITLE.MAX, {
        message: `Max winners must be less than ${FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MAX}`,
      }),
  }),
});
taskRouter.post(
  "/create",
  validateUser(),
  validateRequest(createTaskSchema),
  async (req: Request, res: Response) => {
    try {
      const supabase = createClient(req, res);

      const { error } = await supabase.from("tasks").insert({
        created_by: req.authUser.id,
        kind: req.body.kind,
        title: req.body.title,
        details: req.body.description,
        max_winners: req.body.maxWinners,
      });
      if (error) throw new Error(JSON.stringify(error));

      const serviceResponse = ServiceResponse.success("Task Created", null);
      return handleServiceResponse(serviceResponse, res);
    } catch (err) {
      res.locals.err = err;
      const serviceResponse = ServiceResponse.failure(
        String(err),
        null,
        StatusCodes.INTERNAL_SERVER_ERROR,
      );
      return handleServiceResponse(serviceResponse, res);
    }
  },
);
