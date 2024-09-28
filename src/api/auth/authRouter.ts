import { type EmailOtpType, isAuthApiError, isAuthWeakPasswordError } from "@supabase/supabase-js";
import express, { type NextFunction, type Request, type Response, type Router } from "express";

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
      res.redirect(303, `/${next.slice(1)}`);
    }
  }

  // return the user to an error page with some instructions
  res.redirect(303, "/auth/auth-code-error");
});

authRouter.get("/signup", async (req: Request, res: Response, next: NextFunction) => {
  const email = req.query.email;
  const password = req.query.password;

  const supabase = createClient(req, res);
  const { data, error } = await supabase.auth.signUp({
    email: email as string,
    password: password as string,
  });

  if (!error) {
    const serviceResponse = ServiceResponse.success("Account Created", data);
    handleServiceResponse(serviceResponse, res);
  } else {
    const serviceResponse = ServiceResponse.failure(error.message, null, error.status);
    handleServiceResponse(serviceResponse, res);
  }
});

authRouter.get("/auth-code-error", (_req: Request, res: Response) => {
  res.send("<h2>auth-code-error</h2>");
});
