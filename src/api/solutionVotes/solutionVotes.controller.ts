import { NextFunction, Request, Response } from "express";

import { Solution } from "@/api/solution/solution.model";
import { SolutionVotes } from "@/api/solutionVotes/solutionVotes.model";
import { getUserVotingRights } from "@/api/task/task.controller";
import { User } from "@/api/user/user.model";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/auth.types";
import {
  SolutionResponse,
  SolutionVoteMetrics,
} from "@/common/types/response.types";
import { handleServiceResponse } from "@/common/utils/helpers";

export async function getUserVoteMetrics(
  solutionId: Solution["id"],
  userId: User["id"],
): Promise<NonNullable<SolutionResponse["userVoteMetrics"]>> {
  const totalVotes = await SolutionVotes.totalSolutionVotes(solutionId);
  const totalVotesByUser = await SolutionVotes.totalSolutionVotesByUser(
    solutionId,
    userId,
  );
  const solution = await Solution.getSolutionById(solutionId);
  if (!solution) throw new Error(`Solution with id ${solutionId} not found`);
  const taskId = solution.taskId;
  if (!taskId) throw new Error(`Task with id ${solution.taskId} not found`);
  const userVotingRights = await getUserVotingRights(taskId, userId);

  return {
    totalVotes: totalVotesByUser,
    votingRights: userVotingRights,
  };
}

export async function getSolutionVoteDetails(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const authUser = (req as AuthenticatedRequest).authUser;

  try {
    const serviceResponse = ServiceResponse.success<SolutionVoteMetrics>(
      "Found Solution Vote Details",
      {
        data: await getUserVoteMetrics(req.params.id, authUser.id),
      },
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}

export async function recordSolutionVote(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const authUser = (req as AuthenticatedRequest).authUser;
  const solutionId = req.body.solutionId as Solution["id"];
  const voteCount = req.body.amount;

  // await new Promise((resolve) => setTimeout(resolve, 2000));

  try {
    let voteMetrics = await getUserVoteMetrics(solutionId, authUser.id);
    if (!voteMetrics.votingRights || voteMetrics.votingRights < voteCount) {
      const serviceResponse = ServiceResponse.failure(
        "Insufficient voting rights",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    await SolutionVotes.insert({
      voted_by: authUser.id,
      solution_id: solutionId,
      vote_count: voteCount,
    });

    voteMetrics = await getUserVoteMetrics(solutionId, authUser.id);

    const serviceResponse = ServiceResponse.success<SolutionVoteMetrics>(
      "Solution Vote Recorded",
      {
        data: voteMetrics,
      },
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}
