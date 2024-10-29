import { NextFunction, Request, Response } from "express";

import { Solution } from "@/api/solution/solution.model";
import { SolutionVotes } from "@/api/solutionVotes/solutionVotes.model";
import { User } from "@/api/user/user.model";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/auth.types";
import { SolutionVoteDetailsResponse } from "@/common/types/response.types";
import { handleServiceResponse } from "@/common/utils/helpers";

export async function getVoteDetailsJson(
  solutionId: Solution["id"],
  userId?: User["id"],
): Promise<SolutionVoteDetailsResponse> {
  const totalVotes = await SolutionVotes.totalSolutionVotes(solutionId);
  const totalVotesByUser = userId
    ? await SolutionVotes.totalSolutionVotesByUser(solutionId, userId)
    : null;

  return {
    totalVotes,
    totalVotesByUser,
    userVotingRights: userId ? 69 : null,
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
          data: await getVoteDetailsJson(req.params.id, authUser.id),
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

  await new Promise((resolve) => setTimeout(resolve, 2000));

  try {
    await SolutionVotes.insert({
      voted_by: authUser.id,
      solution_id: req.body.solutionId,
      vote_count: req.body.amount,
    });

    const serviceResponse =
      ServiceResponse.success<SolutionVoteDetailsResponse>(
        "Solution Vote Recorded",
        {
          data: await getVoteDetailsJson(
            req.body.solutionId as Solution["id"],
            authUser.id,
          ),
        },
      );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}
