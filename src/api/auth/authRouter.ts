import { type EmailOtpType } from "@supabase/supabase-js";
import express, { type Request, type Response, type Router } from "express";
import { StatusCodes } from "http-status-codes";
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

authRouter.get("/auth-code-error", (_req: Request, res: Response) => {
  res.send("<h2>auth-code-error</h2>");
});
