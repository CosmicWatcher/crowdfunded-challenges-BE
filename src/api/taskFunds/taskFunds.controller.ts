import { paymentIntents } from "@code-wallet/client";
import { CurrencyCode, Kin } from "@code-wallet/currency";
import { getOrCreateAssociatedTokenAccount, mintTo } from "@solana/spl-token";
import { NextFunction, Request, Response } from "express";

import { getTaskJson } from "@/api/task/task.controller";
import { Task } from "@/api/task/task.model";
import { TaskFunds } from "@/api/taskFunds/taskFunds.model";
import { env } from "@/common/configs/env";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/custom.types";
import { TaskResponse } from "@/common/types/response.types";
import {
  handleServiceResponse,
  verifyCodeWalletWebhookToken,
} from "@/common/utils/helpers";
import { createAccountOnChain, kinPubKey } from "@/common/utils/solana";
import { solanaPayer } from "@/common/utils/solana";
import { solanaConn } from "@/common/utils/solana";

export async function createIntent(req: Request, res: Response) {
  const authUser = (req as AuthenticatedRequest).authUser;
  const taskId = req.params.id;
  const amount: number = req.body.amount;
  const currency: CurrencyCode = req.body.currency;

  const task = await Task.getTaskById(taskId);
  if (!task) {
    const serviceResponse = ServiceResponse.failure("Task not found", null);
    return handleServiceResponse(serviceResponse, res);
  }
  if (task.status !== "active") {
    const serviceResponse = ServiceResponse.failure("Task is not active", null);
    return handleServiceResponse(serviceResponse, res);
  }

  const depositAccount = await task.getSolanaAccount();
  if (!depositAccount) {
    const serviceResponse = ServiceResponse.failure(
      "Task has no deposit address",
      null,
    );
    return handleServiceResponse(serviceResponse, res);
  }

  const tokenAccount = await getOrCreateAssociatedTokenAccount(
    solanaConn,
    solanaPayer,
    kinPubKey,
    depositAccount.keypair.publicKey,
  );
  const destination = tokenAccount.address.toBase58();

  const { clientSecret, id } = await paymentIntents.create({
    mode: "payment",
    amount,
    currency,
    destination,
    webhook: {
      url: `${env.API_URL}/task-funds/record-contribution`,
    },
  });

  await TaskFunds.insert({
    task_id: taskId,
    funded_by: authUser.id,
    intent_id: id,
    amount_fiat: amount,
    currency,
    destination_address: destination,
  });

  const serviceResponse = ServiceResponse.success("Intent Created", {
    data: clientSecret,
  });
  return handleServiceResponse(serviceResponse, res);
}

export async function mockRecordContribution(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const taskId = req.body.taskId as Task["id"];
  const amount = req.body.amount;
  const authUser = (req as AuthenticatedRequest).authUser;

  const payload = {
    amount: amount,
    currency: "USD",
    destination: "",
    exchangeRate: 0.00000893,
    intent: "9joz92rMXnS8NuK9Y3PnukdVi1W7S9cs388CTQxxg6r6",
    quarks: 0,
    state: "SUBMITTED",
  };
  payload.quarks = Math.floor(
    (payload.amount / payload.exchangeRate) * Number(Kin.quarksPerKin),
  );

  try {
    const task = await Task.getTaskById(taskId);
    if (!task) {
      const serviceResponse = ServiceResponse.failure("Task not found", null);
      return handleServiceResponse(serviceResponse, res);
    }
    if (task.status !== "active") {
      const serviceResponse = ServiceResponse.failure(
        "Task is not active",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    const depositAccount = await task.getSolanaAccount();
    if (!depositAccount) {
      const serviceResponse = ServiceResponse.failure(
        "Task has no deposit address",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    await createAccountOnChain(depositAccount.keypair);
    const tokenAccount = await getOrCreateAssociatedTokenAccount(
      solanaConn,
      solanaPayer,
      kinPubKey,
      depositAccount.keypair.publicKey,
    );
    const sig = await mintTo(
      solanaConn,
      solanaPayer,
      kinPubKey,
      tokenAccount.address,
      solanaPayer,
      payload.quarks,
    );

    await TaskFunds.insert({
      funded_by: authUser.id,
      task_id: taskId,
      amount_quarks: payload.quarks,
      amount_fiat: payload.amount,
    });

    const serviceResponse = ServiceResponse.success<TaskResponse>(
      "Fund Contribution Recorded",
      { data: await getTaskJson(task, authUser.id) },
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}

export async function recordContribution(req: Request, res: Response) {
  const token: string = req.body;

  interface Payload {
    amount: number;
    currency: string;
    destination: string;
    exchangeRate: number;
    intent: string;
    quarks: number;
    state: string;
  }

  // Verify the JWT token
  const publicKey = env.CODE_SEQUENCER_PUBLIC_KEY;
  let payloadJSON: Payload;
  try {
    payloadJSON = (await verifyCodeWalletWebhookToken(
      token,
      publicKey,
    )) as unknown as Payload;
  } catch (error) {
    console.warn("Error verifying JWT:", error);
    const serviceResponse = ServiceResponse.failure("Invalid token", null);
    return handleServiceResponse(serviceResponse, res);
  }

  const payment = await TaskFunds.findByIntent(payloadJSON.intent);
  if (!payment) {
    console.error(`Payment with intent ${payloadJSON.intent} not found`);
  } else if (payloadJSON.state !== "SUBMITTED") {
    console.error("Unexpected payment state:", payloadJSON.state);
  } else {
    await payment.update({
      amount_fiat: payloadJSON.amount,
      currency: payloadJSON.currency,
      destination_address: payloadJSON.destination,
      exchange_rate: payloadJSON.exchangeRate,
      intent_id: payloadJSON.intent,
      amount_quarks: payloadJSON.quarks,
      funded_at: new Date().toISOString(),
    });
  }
}
