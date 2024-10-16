import type { NextFunction, Request, Response } from "express";
import { StatusCodes } from "http-status-codes";
import type { ZodError, ZodSchema } from "zod";

import { ServiceResponse } from "@/common/models/serviceResponse";
import { createClient } from "@/common/utils/supabase";

export const handleServiceResponse = (
  serviceResponse: ServiceResponse<unknown>,
  response: Response,
) => {
  return response.status(serviceResponse.statusCode).send(serviceResponse);
};

export const validateRequest =
  (schema: ZodSchema) => (req: Request, res: Response, next: NextFunction) => {
    try {
      schema.parse({ body: req.body, query: req.query, params: req.params });
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

    const supabase = createClient(req, res);
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
    req.authUser = authRes.data.user;

    next();
  };
