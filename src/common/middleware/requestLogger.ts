/* eslint-disable @typescript-eslint/no-unsafe-enum-comparison */
import type { Request, RequestHandler, Response } from "express";
import { StatusCodes, getReasonPhrase } from "http-status-codes";
import { randomUUID } from "node:crypto";
import type { IncomingMessage, ServerResponse } from "node:http";
import type { LevelWithSilent } from "pino";
import { type CustomAttributeKeys, type Options, pinoHttp } from "pino-http";

import { env } from "@/common/configs/env";

enum LogLevel {
  Fatal = "fatal",
  Error = "error",
  Warn = "warn",
  Info = "info",
  Debug = "debug",
  Trace = "trace",
  Silent = "silent",
}

interface PinoCustomProps {
  request: Request;
  response: Response;
  error: Error;
  responseBody: unknown;
}

const requestLogger = (options?: Options): RequestHandler[] => {
  let pinoOptions: Options = {
    customProps: customProps as unknown as Options["customProps"],
    redact: {
      paths: [
        customAttributeKeys.req ?? "req",
        customAttributeKeys.res ?? "res",
      ],
      remove: true,
    },
    genReqId,
    customLogLevel,
    customReceivedMessage: (req) =>
      `request received: ${req.method} ${req.url}`,
    customErrorMessage: (_req, res) =>
      `request errored with status code: ${res.statusCode}`,
    customAttributeKeys,
    ...options,
  };

  if (env.isProduction) {
    pinoOptions = {
      customProps: customProps as unknown as Options["customProps"],
      redact: [],
      genReqId,
      customLogLevel,
      customSuccessMessage,
      customReceivedMessage: (req) => `request received: ${req.method}`,
      customErrorMessage: (_req, res) =>
        `request errored with status code: ${res.statusCode}`,
      customAttributeKeys,
      ...options,
    };
  }
  return [responseBodyMiddleware, pinoHttp(pinoOptions)];
};

const customAttributeKeys: CustomAttributeKeys = {
  req: "request",
  res: "response",
  err: "error",
  responseTime: "timeTaken",
};

const customProps = (req: Request, res: Response): PinoCustomProps => ({
  request: req,
  response: res,
  error: res.locals.err,
  responseBody:
    !env.isProduction && res.statusCode < StatusCodes.BAD_REQUEST
      ? undefined
      : res.locals.responseBody,
});

const responseBodyMiddleware: RequestHandler = (_req, res, next) => {
  const isNotProduction = !env.isProduction;
  if (isNotProduction) {
    const originalSend = res.send;
    res.send = (content) => {
      res.locals.responseBody = content;
      res.send = originalSend;
      return originalSend.call(res, content);
    };
  }
  next();
};

const customLogLevel = (
  _req: IncomingMessage,
  res: ServerResponse<IncomingMessage>,
  err?: Error,
): LevelWithSilent => {
  if (err || res.statusCode >= StatusCodes.INTERNAL_SERVER_ERROR)
    return LogLevel.Error;
  if (res.statusCode >= StatusCodes.BAD_REQUEST) return LogLevel.Warn;
  if (res.statusCode >= StatusCodes.MULTIPLE_CHOICES) return LogLevel.Silent;
  return LogLevel.Info;
};

const customSuccessMessage = (
  req: IncomingMessage,
  res: ServerResponse<IncomingMessage>,
) => {
  if (res.statusCode === StatusCodes.NOT_FOUND)
    return getReasonPhrase(StatusCodes.NOT_FOUND);
  return `${req.method} completed`;
};

const genReqId = (
  req: IncomingMessage,
  res: ServerResponse<IncomingMessage>,
) => {
  const existingID = req.id ?? req.headers["x-request-id"];
  if (existingID) return existingID;
  const id = randomUUID();
  res.setHeader("X-Request-Id", id);
  return id;
};

export default requestLogger();
