import { NextFunction, Request, Response } from "express";

import { Solution } from "@/api/solution/solution.model";
import { getUserVoteMetrics } from "@/api/solutionVotes/solutionVotes.controller";
import { Task } from "@/api/task/task.model";
import { getUserJson } from "@/api/user/user.controller";
import { User } from "@/api/user/user.model";
import { GET_SOLUTIONS_LIMIT_PER_PAGE } from "@/common/configs/constants";
import { ServiceResponse } from "@/common/models/serviceResponse";
import {
  AuthenticatedRequest,
  ValidatedQuery,
} from "@/common/types/custom.types";
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
  const userVoteMetrics = userId
    ? await getUserVoteMetrics(solution.id, userId)
    : null;

  return {
    id: solution.id,
    taskId: solution.taskId,
    createdBy: creator ? getUserJson(creator) : null,
    title: solution.title,
    details: solution.details,
    userVoteMetrics,
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
  const taskId = req.params.id;
  const page = (req as ValidatedQuery).queryParams.page as number;

  const RETURN_COUNT = GET_SOLUTIONS_LIMIT_PER_PAGE;
  const rangeStart = (page - 1) * RETURN_COUNT;
  const rangeEnd = rangeStart + RETURN_COUNT - 1;

  let userId: User["id"] | null = null;
  try {
    userId = await User.getIdFromJwt(req);
  } catch (err) {
    res.locals.err = err;
  }

  try {
    const { solutions, totalRecords } = await Solution.getSolutionsByTaskId(
      taskId,
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

export async function createSolution(req: Request, res: Response) {
  const authUser = (req as AuthenticatedRequest).authUser;
  const taskId = req.body.taskId as Task["id"];
  const title = req.body.title as Task["title"];
  const details = req.body.description as Task["details"];

  const task = await Task.getTaskById(taskId);
  if (!task) {
    const serviceResponse = ServiceResponse.failure("Task not found", null);
    return handleServiceResponse(serviceResponse, res);
  }
  if (task.status !== "active") {
    const serviceResponse = ServiceResponse.failure("Task is not active", null);
    return handleServiceResponse(serviceResponse, res);
  }

  const currentTime = new Date();
  const endedAt = task.endedAt ? new Date(task.endedAt) : null;
  if (endedAt && currentTime > endedAt) {
    const serviceResponse = ServiceResponse.failure("Task has ended", null);
    return handleServiceResponse(serviceResponse, res);
  }

  const solution = await Solution.insert({
    created_by: authUser.id,
    task_id: task.id,
    title,
    details,
  });

  const serviceResponse = ServiceResponse.success<SolutionResponse>(
    "Solution Created",
    { data: await getSolutionJson(solution, authUser.id) },
  );
  return handleServiceResponse(serviceResponse, res);
}
