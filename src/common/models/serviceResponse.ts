import { StatusCodes } from "http-status-codes";
import { z } from "zod";

import { ResponseObject } from "@/common/types/response.types";

export class ServiceResponse<T = null> {
  readonly success: boolean;
  readonly message: string;
  readonly responseObject: T extends null ? null : ResponseObject<T>;
  readonly statusCode: number;

  private constructor(
    success: boolean,
    message: string,
    responseObject: T extends null ? null : ResponseObject<T>,
    statusCode: number,
  ) {
    this.success = success;
    this.message = message;
    this.responseObject = responseObject;
    this.statusCode = statusCode;
  }

  static success<T = null>(
    message: string,
    responseObject: T extends null ? null : ResponseObject<T>,
    statusCode: number = StatusCodes.OK,
  ) {
    return new ServiceResponse<T>(true, message, responseObject, statusCode);
  }

  static failure<T = null>(
    message: string,
    responseObject: T extends null ? null : ResponseObject<T>,
    statusCode: number = StatusCodes.BAD_REQUEST,
  ) {
    return new ServiceResponse<T>(false, message, responseObject, statusCode);
  }
}

export const ServiceResponseSchema = <T extends z.ZodTypeAny>(dataSchema: T) =>
  z.object({
    success: z.boolean(),
    message: z.string(),
    responseObject: dataSchema.optional(),
    statusCode: z.number(),
  });
