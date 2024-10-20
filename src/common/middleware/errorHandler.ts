import { ServiceResponse } from "@/common/models/serviceResponse";
import { handleServiceResponse } from "@/common/utils/httpHandlers";
import type { ErrorRequestHandler, RequestHandler } from "express";
import { StatusCodes } from "http-status-codes";

const unexpectedRequest: RequestHandler = (_req, res) => {
  res.sendStatus(StatusCodes.NOT_FOUND);
};

const addErrorToRequestLog: ErrorRequestHandler = (err, _req, res, next) => {
  res.locals.err = err;
  if (res.headersSent) {
    return next(err);
  }

  const serviceResponse = ServiceResponse.failure(
    "Unexpected Error!",
    null,
    StatusCodes.INTERNAL_SERVER_ERROR,
  );
  handleServiceResponse(serviceResponse, res);

  next(err);
};

export default () => [unexpectedRequest, addErrorToRequestLog];
