import { getOrCreateAssociatedTokenAccount, transfer } from "@solana/spl-token";
import { PublicKey } from "@solana/web3.js";
import { NextFunction, Request, Response } from "express";

import { SolanaAccount } from "@/api/solanaAccount/solanaAccount.model";
import { Solution } from "@/api/solution/solution.model";
import { SolutionVotes } from "@/api/solutionVotes/solutionVotes.model";
import { TaskFundingReturn } from "@/api/task/fundReturn.model";
import { TaskPayout } from "@/api/task/payout.model";
import { Task, TaskStatus } from "@/api/task/task.model";
import { TaskFunds } from "@/api/taskFunds/taskFunds.model";
import { getUserJson } from "@/api/user/user.controller";
import { User } from "@/api/user/user.model";
import { GET_TASKS_LIMIT_PER_PAGE } from "@/common/configs/constants";
import { ServiceResponse } from "@/common/models/serviceResponse";
import {
  AuthenticatedRequest,
  ValidatedQuery,
} from "@/common/types/custom.types";
import { TaskResponse } from "@/common/types/response.types";
import {
  getPaginationJson,
  handleServiceResponse,
} from "@/common/utils/helpers";
import { kinPubKey, solanaConn, solanaPayer } from "@/common/utils/solana";

export async function getTaskJson(
  task: Task,
  userId?: User["id"],
): Promise<TaskResponse> {
  const depositAddress = await task.getSolanaAccount();
  const creator = await task.getCreator();
  const totalFunds = (await TaskFunds.totalKinByTask(task.id)).toDecimal();
  const totalVotes = await SolutionVotes.totalVotesByTask(task.id);

  let userMetrics: TaskResponse["metrics"]["user"] = null;
  if (
    userId &&
    (task.kind === "community" ||
      (task.kind === "personal" && userId === creator?.id))
  ) {
    userMetrics = {
      totalFunds: (await TaskFunds.totalKinByUser(task.id, userId)).toDecimal(),
      totalVotes: await SolutionVotes.totalVotesByUserByTask(task.id, userId),
      votingRights: await getUserVotingRights(task.id, userId),
    };
  }

  return {
    id: task.id,
    createdBy: creator ? getUserJson(creator) : null,
    title: task.title,
    details: task.details,
    kind: task.kind,
    maxWinners: task.maxWinners,
    status: task.status,
    depositAddress: depositAddress ? depositAddress.publicKey : null,
    createdAt: task.createdAt,
    editedAt: task.editedAt,
    endedAt: task.endedAt,
    metrics: {
      overall: { totalFunds, totalVotes },
      user: userMetrics,
    },
  };
}

export async function getUserVotingRights(
  taskId: Task["id"],
  userId: User["id"],
): Promise<number> {
  const bought = await TaskFunds.userBoughtVotingRights(taskId, userId);
  const used = await SolutionVotes.totalVotesByUserByTask(taskId, userId);
  return bought - used;
}

export async function getTaskById(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const taskId = req.params.id;

  let userId: User["id"] | null = null;
  try {
    userId = await User.getIdFromJwt(req);
  } catch (err) {
    res.locals.err = err;
  }

  try {
    let task: Task | null = null;

    task = await Task.getTaskById(taskId);
    if (!task) {
      const serviceResponse = ServiceResponse.failure("Task not Found", null);
      return handleServiceResponse(serviceResponse, res);
    }

    if (!task.solanaAccountId && task.status === "active") {
      try {
        const account = await SolanaAccount.getOrCreateAccount();
        task = await task.update({ deposit_address: account.id });
      } catch (error) {
        // just log the error because it's not critical
        res.locals.err = error;
      }
    }

    const serviceResponse = ServiceResponse.success("Task Found", {
      data: await getTaskJson(task, userId ?? undefined),
    });
    return handleServiceResponse(serviceResponse, res);
  } catch (e) {
    next(e);
  }
}

export async function getTaskList(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const page = (req as ValidatedQuery).queryParams.page as number;
  const status = (req as ValidatedQuery).queryParams.status as
    | TaskStatus
    | undefined;

  const RETURN_COUNT = GET_TASKS_LIMIT_PER_PAGE;
  const rangeStart = (page - 1) * RETURN_COUNT;
  const rangeEnd = rangeStart + RETURN_COUNT - 1;
  let userId: User["id"] | null = null;
  try {
    userId = await User.getIdFromJwt(req);
  } catch (err) {
    res.locals.err = err;
  }

  try {
    const { tasks, totalRecords } = await Task.getTaskList(
      rangeStart,
      rangeEnd,
      false,
      status,
    );
    const pagination = getPaginationJson(totalRecords, page, RETURN_COUNT);
    const returnData: Awaited<ReturnType<typeof getTaskJson>>[] = [];
    for (const item of tasks) {
      returnData.push(await getTaskJson(item, userId ?? undefined));
    }

    const serviceResponse = ServiceResponse.success("Tasks Found", {
      data: returnData,
      pagination,
    });
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    const error = JSON.parse(String(err).slice(7));
    if (error.code == "PGRST103") {
      const serviceResponse = ServiceResponse.failure(
        "Requested page is out of range",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    } else return next(err);
  }
}

export async function getFeaturedTasks(req: Request, res: Response) {
  let userId: User["id"] | null = null;
  try {
    userId = await User.getIdFromJwt(req);
  } catch (err) {
    res.locals.err = err;
  }

  const featuredTasks = await Task.getFeaturedTasks();

  const returnData: Awaited<ReturnType<typeof getTaskJson>>[] = [];
  for (const item of featuredTasks) {
    returnData.push(await getTaskJson(item, userId ?? undefined));
  }

  const serviceResponse = ServiceResponse.success("Featured Tasks Found", {
    data: returnData,
  });
  return handleServiceResponse(serviceResponse, res);
}

export async function createTask(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const authUser = (req as AuthenticatedRequest).authUser;

  let account: SolanaAccount | null = null;
  try {
    account = await SolanaAccount.getOrCreateAccount();
  } catch (error) {
    // just log the error because it's not critical
    res.locals.err = error;
  }
  try {
    await Task.insert({
      created_by: authUser.id,
      kind: req.body.kind,
      title: req.body.title,
      details: req.body.description,
      max_winners: req.body.maxWinners,
      deposit_address: account ? account.id : null,
    });

    const serviceResponse = ServiceResponse.success("Task Created", null);
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}

export function endTask(isSuccessful: boolean) {
  return async (req: Request, res: Response, next: NextFunction) => {
    const taskId = req.params.id;
    const authUser = (req as AuthenticatedRequest).authUser;

    try {
      let task = await Task.getTaskById(taskId);
      if (!task) {
        const serviceResponse = ServiceResponse.failure("Task not Found", null);
        return handleServiceResponse(serviceResponse, res);
      }
      if (task.status !== "active") {
        const serviceResponse = ServiceResponse.failure(
          "Task is not in active status",
          null,
        );
        return handleServiceResponse(serviceResponse, res);
      }

      if (task.createdBy !== authUser.id) {
        const serviceResponse = ServiceResponse.failure(
          "Only the task creator can end the task",
          null,
        );
        return handleServiceResponse(serviceResponse, res);
      }

      let responseMessage: string;
      if (isSuccessful) {
        responseMessage = await payWinners(task);
      } else {
        responseMessage = await returnFunds(task);
      }

      task = await task.update({
        status: isSuccessful ? "successful" : "failed",
        deposit_address: null,
      });

      const serviceResponse = ServiceResponse.success("Task Has Ended", {
        data: await getTaskJson(task, authUser.id),
        message: responseMessage,
      });

      return handleServiceResponse(serviceResponse, res);
    } catch (e) {
      next(e);
    }
  };
}

export async function payWinners(task: Task): Promise<string> {
  // get task deposit address
  const taskSolanaAccount = await task.getSolanaAccount();
  if (!taskSolanaAccount) {
    return "Task has no deposit address";
  }

  // get winning solutions
  const topSolutions = await Solution.getTopSolutionsByVoteCount(task.id);
  if (topSolutions.length === 0) {
    return "No solutions found to distribute funds to";
  }

  // validate all winners
  const validWinners = [];
  for (const { solution } of topSolutions) {
    if (validWinners.length >= task.maxWinners) break;
    const creator = await solution.getCreator();
    if (creator?.depositAddress) {
      validWinners.push({
        creatorId: creator.id,
        depositAddress: creator.depositAddress,
      });
    } else {
      console.error(
        new Date().toLocaleString(),
        `Creator ${creator?.id} has no deposit address for task ${task.id}`,
      );
    }
  }
  if (validWinners.length === 0) {
    return "No valid winners found to distribute funds to";
  }

  // calculate amountPerWinner based on valid winners
  const totalFunds = await TaskFunds.totalKinByTask(task.id);
  let kinPerWinner = totalFunds;
  if (validWinners.length > 1)
    kinPerWinner = totalFunds.divide(validWinners.length);
  const quarksPerWinner = kinPerWinner.toQuarks();

  // Get task's solana account to transfer from
  const sourceAccount = await getOrCreateAssociatedTokenAccount(
    solanaConn,
    solanaPayer,
    kinPubKey,
    taskSolanaAccount.keypair.publicKey,
  );

  // Distribute funds to each valid winner in parallel
  const transferPromises = validWinners.map(
    async ({ creatorId, depositAddress }) => {
      try {
        const creatorPubKey = new PublicKey(depositAddress);
        const destinationAccount = await getOrCreateAssociatedTokenAccount(
          solanaConn,
          solanaPayer,
          kinPubKey,
          creatorPubKey,
        );

        const signature = await transfer(
          solanaConn,
          solanaPayer,
          sourceAccount.address,
          destinationAccount.address,
          taskSolanaAccount.keypair,
          quarksPerWinner,
        );

        return {
          tx_signature: signature,
          task_id: task.id,
          payee: creatorId,
          amount_quarks: Number(quarksPerWinner),
          destination_address: depositAddress,
        };
      } catch (error) {
        console.error(
          new Date().toLocaleString(),
          `Failed to distribute payout to ${creatorId} for task ${task.id}:`,
          error,
        );
        return null;
      }
    },
  );

  const results = await Promise.all(transferPromises);
  const successfulTransfers = results.filter((result) => result !== null);

  // Insert successful transfers into TaskPayout
  await Promise.all(
    successfulTransfers.map((transfer) => TaskPayout.insert(transfer)),
  );
  console.log(
    new Date().toLocaleString(),
    `Payouts distributed to ${successfulTransfers.length} users: [${successfulTransfers
      .map((p) => p.payee)
      .join(", ")}]`,
  );

  return `Payouts distributed to ${successfulTransfers.length} users.`;
}

export async function returnFunds(task: Task): Promise<string> {
  // get task deposit address
  const taskSolanaAccount = await task.getSolanaAccount();
  if (!taskSolanaAccount) {
    return "Task has no deposit address";
  }

  // Get all funders for this task
  const funders = await TaskFunds.getFundersByTask(task.id);
  if (!funders || funders.length === 0) {
    return "No funds to return";
  }

  // Get task's solana account to transfer from
  const sourceAccount = await getOrCreateAssociatedTokenAccount(
    solanaConn,
    solanaPayer,
    kinPubKey,
    taskSolanaAccount.keypair.publicKey,
  );

  // Return funds to each funder in parallel
  const transferPromises = funders.map(async ({ funderId, amount }) => {
    try {
      const funder = await User.getUserById(funderId);
      if (!funder?.depositAddress)
        throw new Error("Funder has no deposit address");

      const funderPubKey = new PublicKey(funder.depositAddress);
      const destinationAccount = await getOrCreateAssociatedTokenAccount(
        solanaConn,
        solanaPayer,
        kinPubKey,
        funderPubKey,
      );

      const signature = await transfer(
        solanaConn,
        solanaPayer,
        sourceAccount.address,
        destinationAccount.address,
        taskSolanaAccount.keypair,
        amount.toQuarks(),
      );

      return {
        tx_signature: signature,
        task_id: task.id,
        funder_id: funderId,
        amount_quarks: Number(amount.toQuarks()),
        destination_address: funder.depositAddress,
      };
    } catch (error) {
      console.error(
        new Date().toLocaleString(),
        `Failed to return funds to ${funderId} for task ${task.id}:`,
        error,
      );
      return null;
    }
  });

  const results = await Promise.all(transferPromises);
  const successfulTransfers = results.filter((result) => result !== null);

  // Insert successful transfers into TaskFundingReturn
  await Promise.all(
    successfulTransfers.map((transfer) => TaskFundingReturn.insert(transfer)),
  );
  console.log(
    new Date().toLocaleString(),
    `Funds returned to ${successfulTransfers.length} users: [${successfulTransfers
      .map((f) => f.funder_id)
      .join(", ")}]`,
  );

  return `Funds returned to ${successfulTransfers.length} users.`;
}
