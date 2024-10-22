import { Request } from "express";

export interface AuthenticatedRequest extends Request {
  authUser: { id: string };
}
