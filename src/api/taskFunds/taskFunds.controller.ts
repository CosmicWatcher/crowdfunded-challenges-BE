import { Kin } from "@code-wallet/currency";
import { NextFunction, Request, Response } from "express";

import { getTaskJson } from "@/api/task/task.controller";
import { Task } from "@/api/task/task.model";
import { TaskFunds } from "@/api/taskFunds/taskFunds.model";
import { User } from "@/api/user/user.model";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/auth.types";
import {
  TaskFundDetailsResponse,
  TaskResponse,
} from "@/common/types/response.types";
import { handleServiceResponse } from "@/common/utils/helpers";

export async function getFundingDetails(
  taskId: Task["id"],
  userId?: User["id"],
): Promise<TaskFundDetailsResponse> {
  const totalFunds = (await TaskFunds.totalKinByTask(taskId)).toDecimal();
  const totalFundsByUser = userId
    ? (await TaskFunds.totalKinByUser(taskId, userId)).toDecimal()
    : null;
  const userVotingRights =
    taskId && userId
      ? await TaskFunds.getUserVotingRights(taskId, userId)
      : null;

  return {
    totalFunds,
    totalFundsByUser,
    userVotingRights,
  };
}

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
  const authUser = (req as AuthenticatedRequest).authUser;

  await new Promise((resolve) => setTimeout(resolve, 2000));
  const payload = {
    amount: req.body.amount,
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
    const taskFund = await TaskFunds.insert({
      funded_by: authUser.id,
      task_id: req.body.taskId,
      amount_quarks: payload.quarks,
      amount_fiat: payload.amount,
    });
    const task = await taskFund.getTask();
    if (!task) {
      const serviceResponse = ServiceResponse.success(
        "Fund Contribution Recorded",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    const serviceResponse = ServiceResponse.success<TaskResponse>(
      "Fund Contribution Recorded",
      { data: await getTaskJson(task, authUser.id) },
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}
