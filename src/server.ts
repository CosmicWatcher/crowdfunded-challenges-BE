import { Keypair } from "@code-wallet/keys";
import cors from "cors";
import express, { type Express } from "express";
import helmet from "helmet";
import { pino } from "pino";

import { openAPIRouter } from "@/api-docs/openAPIRouter";
import { codeLoginRouter } from "@/api/codeLogin/codeLogin.router";
import { healthCheckRouter } from "@/api/healthCheck/healthCheck.router";
import { solutionRouter } from "@/api/solution/solution.router";
import { solutionVotesRouter } from "@/api/solutionVotes/solutionVotes.router";
import { taskRouter } from "@/api/task/task.router";
import { taskFundsRouter } from "@/api/taskFunds/taskFunds.router";
import { userRouter } from "@/api/user/user.router";
import { env } from "@/common/configs/env";
import errorHandler from "@/common/middleware/errorHandler";
import requestLogger from "@/common/middleware/requestLogger";
import { validateCron } from "@/common/middleware/validators";

const logger = pino({ name: "server start" });
const app: Express = express();

// Set the application to trust the reverse proxy
app.set("trust proxy", true);

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors({ origin: env.CORS_ORIGIN, credentials: true }));
app.use(helmet());
app.use(validateCron());

// Request logging
app.use(requestLogger);

// This is a JSON file that Code Wallet will look for when verifying our domain. It
// should be publicly accessible at the root of our domain
app.get("/.well-known/code-payments.json", (_req, res) => {
  const verifier = Keypair.fromSecretKey(env.CODE_VERFIER_SECRET);
  res.json({ public_keys: [verifier.getPublicKey().toBase58()] });
});

// Routes
app.use("/health", healthCheckRouter);
app.use("/users", userRouter);
app.use("/tasks", taskRouter);
app.use("/solutions", solutionRouter);
app.use("/solution-votes", solutionVotesRouter);
app.use("/task-funds", taskFundsRouter);
app.use("/code-login", codeLoginRouter);

// Swagger UI
app.use(openAPIRouter);

// Error handlers
app.use(errorHandler());

export { app, logger };
