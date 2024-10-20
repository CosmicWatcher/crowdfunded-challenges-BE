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
import { supabase } from "@/common/utils/supabase";
import { z } from "zod";
import {
  FORM_LIMITS,
  TASK_STATUS,
  TASK_TYPES,
} from "@/common/configs/constants";
import { getOrCreateKeypair } from "@/common/utils/solana";
import { commonValidations } from "@/common/utils/commonValidation";

export const taskRouter: Router = express.Router();

const getTaskListSchema = z.object({
  query: z.object({ page: commonValidations.page }),
});
taskRouter.get(
  "/",
  validateRequest(getTaskListSchema),
  async (req: Request, res: Response, next: NextFunction) => {
    const RETURN_COUNT = 4;
    const page = Number(req.query.page);
    const rangeStart = (page - 1) * RETURN_COUNT;
    try {
      const { data, error, count } = await supabase
        .from("tasks")
        .select("*", { count: "estimated" })
        .neq("status", TASK_STATUS.DELETED)
        .order("created_at", { ascending: false })
        .range(rangeStart, rangeStart + RETURN_COUNT - 1);
      if (error) {
        if (error.code == "PGRST103") {
          const serviceResponse = ServiceResponse.failure(
            "Requested page is out of range",
            null,
          );
          return handleServiceResponse(serviceResponse, res);
        } else next(error);
      }

      const totalPages = Math.ceil((count ?? 0) / RETURN_COUNT);
      const pagination = {
        pagination: {
          total_records: count ?? 0,
          total_pages: totalPages,
          current_page: page,
          prev_page: page === 1 ? null : page - 1,
          next_page: page === totalPages ? null : page + 1,
        },
      };
      const serviceResponse = ServiceResponse.success(
        "Tasks Found",
        Object.assign({ data }, pagination),
      );
      return handleServiceResponse(serviceResponse, res);
    } catch (e) {
      next(e);
    }
  },
);

const getTaskSchema = z.object({
  params: z.object({ id: commonValidations.id }),
});
taskRouter.get(
  "/:id",
  validateRequest(getTaskSchema),
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { data, error } = await supabase
        .from("tasks")
        .select()
        .eq("id", req.params.id)
        .neq("status", TASK_STATUS.DELETED)
        .maybeSingle();
      if (error) throw new Error(JSON.stringify(error));

      if (!data) {
        const serviceResponse = ServiceResponse.failure("Task not Found", null);
        return handleServiceResponse(serviceResponse, res);
      }

      const serviceResponse = ServiceResponse.success("Task Found", data);
      return handleServiceResponse(serviceResponse, res);
    } catch (e) {
      next(e);
    }
  },
);

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
      const { keypairID } = await getOrCreateKeypair(supabase);

      const { error } = await supabase.from("tasks").insert({
        created_by: req.authUser.id,
        kind: req.body.kind,
        title: req.body.title,
        details: req.body.description,
        max_winners: req.body.maxWinners,
        deposit_address: keypairID,
      });
      if (error) throw new Error(JSON.stringify(error));

      const serviceResponse = ServiceResponse.success("Task Created", null);
      return handleServiceResponse(serviceResponse, res);
    } catch (err) {
      next(err);
    }
  },
);
