import { type EmailOtpType } from "@supabase/supabase-js";
import express, { type Request, type Response, type Router } from "express";
import { StatusCodes } from "http-status-codes";

import { ServiceResponse } from "@/common/models/serviceResponse";
import { handleServiceResponse } from "@/common/utils/httpHandlers";
import { createClient } from "@/common/utils/supabase";

export const authRouter: Router = express.Router();

authRouter.get("/confirm", async (req: Request, res: Response) => {
  const token_hash = req.query.token_hash;
  const type = req.query.type;
  const next = req.query.next ?? "/"; // an endpoint to redirect to, for example in password reset

  if (token_hash && type) {
    const supabase = createClient(req, res);
    const { error } = await supabase.auth.verifyOtp({
      type: type as EmailOtpType,
      token_hash: token_hash as string,
    });

    if (!error && typeof next === "string") {
      res.redirect(StatusCodes.SEE_OTHER, `/${next.slice(1)}`);
    }
  }

  // return the user to an error page with some instructions
  res.redirect(StatusCodes.SEE_OTHER, "/auth/auth-code-error");
});

authRouter.post("/signup", async (req: Request, res: Response) => {
  const email = req.body.email;
  const password = req.body.password;

  try {
    const supabase = createClient(req, res);
    const { data, error } = await supabase.auth.signUp({
      email: email as string,
      password: password as string,
    });
    if (!error) {
      const serviceResponse = ServiceResponse.success("Account Created", data);
      return handleServiceResponse(serviceResponse, res);
    } else {
      const serviceResponse = ServiceResponse.failure(
        error.message,
        null,
        error.status !== undefined && error.status in StatusCodes
          ? error.status
          : StatusCodes.INTERNAL_SERVER_ERROR,
      );
      return handleServiceResponse(serviceResponse, res);
    }
  } catch (err) {
    const serviceResponse = ServiceResponse.failure(
      String(err),
      null,
      StatusCodes.INTERNAL_SERVER_ERROR,
    );
    return handleServiceResponse(serviceResponse, res);
  }
});

authRouter.get("/auth-code-error", (_req: Request, res: Response) => {
  res.send("<h2>auth-code-error</h2>");
});
