import { Kin } from "@code-wallet/currency";
import { getOrCreateAssociatedTokenAccount, mintTo } from "@solana/spl-token";
import { NextFunction, Request, Response } from "express";

import { getTaskJson } from "@/api/task/task.controller";
import { Task } from "@/api/task/task.model";
import { TaskFunds } from "@/api/taskFunds/taskFunds.model";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/custom.types";
import { TaskResponse } from "@/common/types/response.types";
import { handleServiceResponse } from "@/common/utils/helpers";
import { createAccountOnChain, kinPubKey } from "@/common/utils/solana";
import { solanaPayer } from "@/common/utils/solana";
import { solanaConn } from "@/common/utils/solana";

// export async function get(req: Request, res: Response, next: NextFunction) {
//   const authUser = (req as AuthenticatedRequest).authUser;

//   try {
//     const serviceResponse =
//       ServiceResponse.success<SolutionVoteDetailsResponse>(
//         "Found Solution Vote Details",
//         {
//           data: await getVoteDetailsJson(req.params.id, authUser.id),
//         },
//       );
//     return handleServiceResponse(serviceResponse, res);
//   } catch (err) {
//     next(err);
//   }
// }

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
