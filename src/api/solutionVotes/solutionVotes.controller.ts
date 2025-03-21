import { NextFunction, Request, Response } from "express";

import { Solution } from "@/api/solution/solution.model";
import { SolutionVotes } from "@/api/solutionVotes/solutionVotes.model";
import { getUserVotingRights } from "@/api/task/task.controller";
import { getUserJson } from "@/api/user/user.controller";
import { User } from "@/api/user/user.model";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/custom.types";
import {
  SolutionVoteMetrics,
  SolutionVoteResponse,
} from "@/common/types/response.types";
import { handleServiceResponse } from "@/common/utils/helpers";

export async function getUserVoteMetrics(
  solutionId: Solution["id"],
  userId: User["id"],
): Promise<SolutionVoteMetrics> {
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

async function getSolutionVoteJson(
  solution: Solution,
  voteCount: number,
): Promise<SolutionVoteResponse["topSolutions"][number]> {
  const creator = await solution.getCreator();
  return {
    createdBy: creator ? getUserJson(creator) : null,
    title: solution.title,
    details: solution.details,
    voteCount,
    createdAt: solution.createdAt,
    editedAt: solution.editedAt,
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

  try {
    let voteMetrics = await getUserVoteMetrics(solutionId, authUser.id);
    if (!voteMetrics.votingRights || voteMetrics.votingRights < voteCount) {
      const serviceResponse = ServiceResponse.failure(
        "Insufficient voting rights",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    const solution = await Solution.getSolutionById(solutionId);
    if (!solution) {
      const serviceResponse = ServiceResponse.failure(
        `Solution with id ${solutionId} not found`,
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    if (solution.createdBy === authUser.id) {
      const serviceResponse = ServiceResponse.failure(
        "Cannot vote for your own solution",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }

    const task = await solution.getTask();
    if (!task) {
      const serviceResponse = ServiceResponse.failure(
        `Task with id ${solution.taskId} not found`,
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }
    if (task.status !== "active") {
      const serviceResponse = ServiceResponse.failure(
        "Task is not active",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    }
    if (task.kind === "personal" && task.createdBy !== authUser.id) {
      const serviceResponse = ServiceResponse.failure(
        "Cannot vote for a personal task you didn't create",
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

    const solutions = await Solution.getTopSolutionsByVoteCount(task.id);
    const returnData: Awaited<ReturnType<typeof getSolutionVoteJson>>[] = [];
    for (const item of solutions) {
      returnData.push(await getSolutionVoteJson(item.solution, item.voteCount));
    }

    const serviceResponse = ServiceResponse.success<SolutionVoteResponse>(
      "Solution Vote Recorded",
      {
        data: { userVoteMetrics: voteMetrics, topSolutions: returnData },
      },
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}
