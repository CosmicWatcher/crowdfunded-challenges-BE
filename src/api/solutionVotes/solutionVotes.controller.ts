import { NextFunction, Request, Response } from "express";

import { Solution } from "@/api/solution/solution.model";
import { SolutionVotes } from "@/api/solutionVotes/solutionVotes.model";
import { TaskFunds } from "@/api/taskFunds/taskFunds.model";
import { User } from "@/api/user/user.model";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/auth.types";
import { SolutionVoteDetailsResponse } from "@/common/types/response.types";
import { handleServiceResponse } from "@/common/utils/helpers";

export async function getVoteDetails(
  solutionId: Solution["id"],
  userId?: User["id"],
): Promise<SolutionVoteDetailsResponse> {
  const totalVotes = await SolutionVotes.totalSolutionVotes(solutionId);
  const totalVotesByUser = userId
    ? await SolutionVotes.totalSolutionVotesByUser(solutionId, userId)
    : null;
  const solution = await Solution.getSolutionById(solutionId);
  const taskId = solution?.taskId;
  const userVotingRights =
    taskId && userId
      ? await TaskFunds.getUserVotingRights(taskId, userId)
      : null;

  return {
    totalVotes,
    totalVotesByUser,
    userVotingRights,
  };
}

export async function getSolutionVoteDetails(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const authUser = (req as AuthenticatedRequest).authUser;

  try {
    const serviceResponse =
      ServiceResponse.success<SolutionVoteDetailsResponse>(
        "Found Solution Vote Details",
        {
          data: await getVoteDetails(req.params.id, authUser.id),
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
    let voteDetails = await getVoteDetails(solutionId, authUser.id);
    if (
      !voteDetails.userVotingRights ||
      voteDetails.userVotingRights < voteCount
    ) {
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

    voteDetails = await getVoteDetails(solutionId, authUser.id);

    const serviceResponse =
      ServiceResponse.success<SolutionVoteDetailsResponse>(
        "Solution Vote Recorded",
        {
          data: voteDetails,
        },
      );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}
