import { NextFunction, Request, Response } from "express";
import { StatusCodes } from "http-status-codes";
import { ZodError, ZodSchema, z } from "zod";

import { CRON_USER_ID } from "@/common/configs/constants";
import { env } from "@/common/configs/env";
import { ServiceResponse } from "@/common/models/serviceResponse";
import {
  AuthenticatedRequest,
  ValidatedQuery,
} from "@/common/types/custom.types";
import { getJwtToken, handleServiceResponse } from "@/common/utils/helpers";
import { supabase } from "@/common/utils/supabase";

export const commonValidations = {
  id: z.string().uuid({ message: "Invalid ID" }),
  page: z
    .string()
    .optional()
    .default("1")
    .refine(
      (data) => !Number.isNaN(Number(data)),
      "page must be a numeric value",
    )
    .transform(Number)
    .refine((num) => num > 0, "page must be a positive number"),
};

export const validateRequest =
  (schema: ZodSchema) => (req: Request, res: Response, next: NextFunction) => {
    try {
      const result = schema.parse({
        body: req.body,
        query: req.query,
        params: req.params,
      });
      req.body = result.body;
      (req as ValidatedQuery).queryParams = result.query;
      req.params = result.params;
      next();
    } catch (err) {
      const errorMessage = `Invalid input: ${(err as ZodError).errors.map((e) => e.message).join(", ")}`;
      const statusCode = StatusCodes.BAD_REQUEST;
      const serviceResponse = ServiceResponse.failure(
        errorMessage,
        null,
        statusCode,
      );
      return handleServiceResponse(serviceResponse, res);
    }
  };

export const validateUser =
  () => async (req: Request, res: Response, next: NextFunction) => {
    // Check if already authenticated as a cron job
    if ((req as AuthenticatedRequest).authUser?.id === CRON_USER_ID) {
      return next();
    }

    const jwt = getJwtToken(req);
    if (!jwt) {
      const serviceResponse = ServiceResponse.failure(
        "A valid bearer JWT token must be present in the authorization header",
        null,
        StatusCodes.UNAUTHORIZED,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    const { data, error } = await supabase.auth.getUser(jwt);
    if (error) {
      const serviceResponse = ServiceResponse.failure(
        error.message,
        null,
        error.status !== undefined && error.status in StatusCodes
          ? error.status
          : StatusCodes.INTERNAL_SERVER_ERROR,
      );
      return handleServiceResponse(serviceResponse, res);
    }
    (req as AuthenticatedRequest).authUser = data.user;

    next();
  };

export const validateCron =
  () => (req: Request, _res: Response, next: NextFunction) => {
    const cronSecret = req.headers["cron-secret"];

    // If cron secret is present, the request is coming from a cron job
    if (cronSecret === env.CRON_SECRET) {
      (req as AuthenticatedRequest).authUser = {
        id: CRON_USER_ID,
      };
    }

    next();
  };
