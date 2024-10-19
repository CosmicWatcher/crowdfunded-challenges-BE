import express, {
  type NextFunction,
  type Request,
  type Response,
  type Router,
} from "express";

import { ServiceResponse } from "@/common/models/serviceResponse";
import {
  handleServiceResponse,
  validateRequest,
  validateUser,
} from "@/common/utils/httpHandlers";
import { createClient } from "@/common/utils/supabase";
import { z } from "zod";
import { FORM_LIMITS, TASK_TYPES } from "@/common/configs/constants";
import { getOrCreateKeypair } from "@/common/utils/solana";

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
        message: `Max winners must be at least ${FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MIN}`,
      })
      .max(FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MAX, {
        message: `Max winners must be less than ${FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MAX}`,
      }),
  }),
});
taskRouter.post(
  "/create",
  validateRequest(createTaskSchema),
  validateUser(),
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const supabase = createClient(req, res);
      const { keypairID } = await getOrCreateKeypair(supabase);

      const { error } = await supabase.from("tasks").insert({
        created_by: req.authUser.id,
        kind: req.body.kind,
        title: req.body.title,
        details: req.body.description,
        max_winners: req.body.maxWinners,
        deposit_address: keypairID,
      });
      if (error) next(JSON.stringify(error));

      const serviceResponse = ServiceResponse.success("Task Created", null);
      return handleServiceResponse(serviceResponse, res);
    } catch (err) {
      next(err);
    }
  },
);
