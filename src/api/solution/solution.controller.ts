import { NextFunction, Request, Response } from "express";

import { Solution } from "@/api/solution/solution.model";
import { getVoteDetails } from "@/api/solutionVotes/solutionVotes.controller";
import { getUserJson } from "@/api/user/user.controller";
import { User } from "@/api/user/user.model";
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
  userId?: User["id"],
): Promise<SolutionResponse> {
  const creator = await solution.getCreator();
  const voteDetails = await getVoteDetails(solution.id, userId);

  return {
    id: solution.id,
    taskId: solution.taskId,
    createdBy: creator ? getUserJson(creator) : null,
    title: solution.title,
    details: solution.details,
    voteDetails,
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

  let userId: User["id"] | null = null;
  try {
    userId = await User.getIdFromJwt(req);
  } catch (err) {
    res.locals.err = err;
  }

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
      returnData.push(await getSolutionJson(item, userId ?? undefined));
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

  // await new Promise((resolve) => setTimeout(resolve, 2000));

  try {
    const solution = await Solution.insert({
      created_by: authUser.id,
      task_id: req.body.taskId,
      title: req.body.title,
      details: req.body.description,
    });

    const serviceResponse = ServiceResponse.success<SolutionResponse>(
      "Solution Created",
      { data: await getSolutionJson(solution, authUser.id) },
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}
