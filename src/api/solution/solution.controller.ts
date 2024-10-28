import { NextFunction, Request, Response } from "express";

import { Solution } from "@/api/solution/solution.model";
import { SolutionVotes } from "@/api/solutionVotes/solutionVotes.model";
import { getUserJson } from "@/api/user/userc.ontroller";
import { GET_SOLUTIONS_LIMIT_PER_PAGE } from "@/common/configs/constants";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/auth.types";
import { SolutionResponse } from "@/common/types/response.types";
import {
  getPaginationJson,
  handleServiceResponse,
} from "@/common/utils/helpers";

export async function getSolutionJson(
  solution: Solution,
): Promise<SolutionResponse> {
  const creator = await solution.getCreator();
  const totalVotes = await SolutionVotes.totalVotesBySolutionId(solution.id);

  return {
    id: solution.id,
    taskId: solution.taskId,
    createdBy: creator ? getUserJson(creator) : null,
    details: solution.details,
    voteCount: totalVotes,
    isWinner: solution.isWinner,
    createdAt: solution.createdAt,
    editedAt: solution.editedAt,
    deletedAt: solution.deletedAt,
  };
}

export async function getSolutionList(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const RETURN_COUNT = GET_SOLUTIONS_LIMIT_PER_PAGE;
  const page = req.query.page as unknown as number;
  const rangeStart = (page - 1) * RETURN_COUNT;
  const rangeEnd = rangeStart + RETURN_COUNT - 1;

  //   await new Promise((resolve) => setTimeout(resolve, 1000));

  try {
    const { solutions, totalRecords } = await Solution.getSolutionsByTaskId(
      req.params.id,
      rangeStart,
      rangeEnd,
      false,
    );
    const pagination = getPaginationJson(totalRecords, page, RETURN_COUNT);
    const returnData: Awaited<ReturnType<typeof getSolutionJson>>[] = [];
    for (const item of solutions) {
      returnData.push(await getSolutionJson(item));
    }

    const serviceResponse = ServiceResponse.success<SolutionResponse[]>(
      "Solutions Found",
      {
        data: returnData,
        pagination,
      },
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    const error = JSON.parse(String(err).slice(7));
    if (error.code == "PGRST103") {
      const serviceResponse = ServiceResponse.failure<null>(
        "Requested page is out of range",
        null,
      );
      return handleServiceResponse(serviceResponse, res);
    } else return next(err);
  }
}

export async function createSolution(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const authUser = (req as AuthenticatedRequest).authUser;

  //   await new Promise((resolve) => setTimeout(resolve, 1000));

  try {
    const solution = await Solution.insert({
      created_by: authUser.id,
      task_id: req.body.taskId,
      details: req.body.description,
    });

    const serviceResponse = ServiceResponse.success<SolutionResponse>(
      "Solution Created",
      { data: await getSolutionJson(solution) },
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}
