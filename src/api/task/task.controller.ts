import { getOrCreateAssociatedTokenAccount, transfer } from "@solana/spl-token";
import { PublicKey } from "@solana/web3.js";
import { NextFunction, Request, Response } from "express";

import { SolanaAccount } from "@/api/solanaAccount/solanaAccount.model";
import { Solution } from "@/api/solution/solution.model";
import { SolutionVotes } from "@/api/solutionVotes/solutionVotes.model";
import { Task } from "@/api/task/task.model";
import { TaskFunds } from "@/api/taskFunds/taskFunds.model";
import { getUserJson } from "@/api/user/user.controller";
import { User } from "@/api/user/user.model";
import { GET_TASKS_LIMIT_PER_PAGE } from "@/common/configs/constants";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/auth.types";
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
  if (userId) {
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

    if (!task.solanaAccountId) {
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
  const RETURN_COUNT = GET_TASKS_LIMIT_PER_PAGE;
  const page = req.query.page as unknown as number;
  const rangeStart = (page - 1) * RETURN_COUNT;
  const rangeEnd = rangeStart + RETURN_COUNT - 1;
  let userId: User["id"] | null = null;
  try {
    userId = await User.getIdFromJwt(req);
  } catch (err) {
    res.locals.err = err;
  }

  // await new Promise((resolve) => setTimeout(resolve, 2000));

  try {
    const { tasks, totalRecords } = await Task.getTaskList(
      rangeStart,
      rangeEnd,
      false,
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

export async function payWinners(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const taskId = req.params.id;

  try {
    let task: Task | null = null;

    // get task
    task = await Task.getTaskById(taskId);
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

    // get task deposit address
    const taskSolanaAccount = await task.getSolanaAccount();
    if (!taskSolanaAccount) {
      const serviceResponse = ServiceResponse.failure(
        "Task has no deposit address",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    // get winning solutions
    const topSolutions = await Solution.getTopSolutionsByVoteCount(taskId);
    if (topSolutions.length === 0) {
      const serviceResponse = ServiceResponse.failure(
        "No solutions found to distribute funds to",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    // validate all winners
    const validWinners = [];
    for (const { solution } of topSolutions) {
      if (validWinners.length >= task.maxWinners) break;
      const creator = await solution.getCreator();
      if (creator?.depositAddress) {
        validWinners.push(creator.depositAddress);
      }
    }
    if (validWinners.length === 0) {
      const serviceResponse = ServiceResponse.failure(
        "No valid winners found to distribute funds to",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    // calculate amountPerWinner based on valid winners
    const totalFunds = await TaskFunds.totalKinByTask(taskId);
    let amountPerWinner = totalFunds;
    if (validWinners.length > 1)
      amountPerWinner = totalFunds.divide(validWinners.length);

    // Distribute funds to each valid winner
    for (const winnerAddress of validWinners) {
      const creatorPubKey = new PublicKey(winnerAddress);
      const sourceAccount = await getOrCreateAssociatedTokenAccount(
        solanaConn,
        solanaPayer,
        kinPubKey,
        taskSolanaAccount.keypair.publicKey,
      );
      const destinationAccount = await getOrCreateAssociatedTokenAccount(
        solanaConn,
        solanaPayer,
        kinPubKey,
        creatorPubKey,
      );
      await transfer(
        solanaConn,
        solanaPayer,
        sourceAccount.address,
        destinationAccount.address,
        taskSolanaAccount.keypair,
        amountPerWinner.toQuarks(),
      );
    }

    const serviceResponse = ServiceResponse.success(
      `Funds distributed to ${validWinners.length} winners: [${validWinners.join(
        ", ",
      )}]`,
      null,
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (e) {
    next(e);
  }
}
