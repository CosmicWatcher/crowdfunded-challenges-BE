import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/auth.types";
import { handleServiceResponse } from "@/common/utils/helpers";
import { supabase } from "@/common/utils/supabase";
import { Request, Response, NextFunction } from "express";
import { StatusCodes } from "http-status-codes";
import { z, ZodError, ZodSchema } from "zod";

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
      req.query = result.query;
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
    let jwt = req.headers.authorization;
    if (jwt?.startsWith("Bearer ")) {
      jwt = jwt.slice(7);
    } else {
      const serviceResponse = ServiceResponse.failure(
        "A valid bearer JWT token must be present in the authorization header",
        null,
        StatusCodes.UNAUTHORIZED,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    const authRes = await supabase.auth.getUser(jwt);
    if (authRes.error) {
      const serviceResponse = ServiceResponse.failure(
        authRes.error.message,
        null,
        authRes.error.status !== undefined &&
          authRes.error.status in StatusCodes
          ? authRes.error.status
          : StatusCodes.INTERNAL_SERVER_ERROR,
      );
      return handleServiceResponse(serviceResponse, res);
    }
    (req as AuthenticatedRequest).authUser = authRes.data.user;

    next();
  };
