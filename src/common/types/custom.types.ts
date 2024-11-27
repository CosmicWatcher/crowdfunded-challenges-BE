import { Request } from "express";

export interface AuthenticatedRequest extends Request {
  authUser: { id: string };
}

export interface ValidatedQuery extends Request {
  queryParams: Record<string, unknown>;
}
