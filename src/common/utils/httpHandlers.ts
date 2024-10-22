import type { NextFunction, Request, Response } from "express";
import { StatusCodes } from "http-status-codes";
import type { ZodError, ZodSchema } from "zod";

import { ServiceResponse } from "@/common/models/serviceResponse";
import { supabase } from "@/common/utils/supabase";

export const handleServiceResponse = (
  serviceResponse: ServiceResponse<unknown>,
  response: Response,
) => {
  return response.status(serviceResponse.statusCode).send(serviceResponse);
};

export function getPaginationJson(
  itemCount: number,
  currentPage: number,
  returnCount: number,
) {
  const totalPages = Math.ceil(itemCount / returnCount);
  return {
    total_records: itemCount,
    total_pages: totalPages,
    current_page: currentPage,
    prev_page: currentPage === 1 ? null : currentPage - 1,
    next_page: currentPage === totalPages ? null : currentPage + 1,
  };
}

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
    req.authUser = authRes.data.user;

    next();
  };
