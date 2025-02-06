import express, { type Router } from "express";

import {
  createLoginIntent,
  getVerifier,
  verifyLogin,
} from "@/api/codeLogin/codeLogin.controller";

export const codeLoginRouter: Router = express.Router();

codeLoginRouter.get("/verifier", getVerifier);
codeLoginRouter.post("/create-intent", createLoginIntent);
codeLoginRouter.get("/success/:id", verifyLogin);
