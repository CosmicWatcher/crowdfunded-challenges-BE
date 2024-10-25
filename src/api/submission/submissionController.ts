import { NextFunction, Request, Response } from "express";

import { Submission } from "@/api/submission/submissionModel";
import { getUserJson } from "@/api/user/userController";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/auth.types";
import { SubmissionResponse } from "@/common/types/response.types";
import {
  getPaginationJson,
  handleServiceResponse,
} from "@/common/utils/helpers";

export async function getSubmissionJson(
  submission: Submission,
): Promise<SubmissionResponse> {
  const creator = await submission.getCreator();
  return {
    id: submission.id,
    taskId: submission.taskId,
    createdBy: creator ? getUserJson(creator) : null,
    details: submission.details,
    voteCount: submission.voteCount,
    isWinner: submission.isWinner,
    createdAt: submission.createdAt,
    editedAt: submission.editedAt,
    deletedAt: submission.deletedAt,
  };
}

export async function getSubmissionList(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const RETURN_COUNT = 4;
  const page = req.query.page as unknown as number;
  const rangeStart = (page - 1) * RETURN_COUNT;
  const rangeEnd = rangeStart + RETURN_COUNT - 1;

  //   await new Promise((resolve) => setTimeout(resolve, 1000));

  try {
    const { submissions, totalRecords } =
      await Submission.getSubmissionsByTaskId(
        req.params.id,
        rangeStart,
        rangeEnd,
        false,
      );
    const pagination = getPaginationJson(totalRecords, page, RETURN_COUNT);
    const returnData: Awaited<ReturnType<typeof getSubmissionJson>>[] = [];
    for (const item of submissions) {
      returnData.push(await getSubmissionJson(item));
    }

    const serviceResponse = ServiceResponse.success<SubmissionResponse[]>(
      "Submissions Found",
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

export async function createSubmission(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const authUser = (req as AuthenticatedRequest).authUser;

  //   await new Promise((resolve) => setTimeout(resolve, 1000));

  try {
    const submission = await Submission.insert({
      created_by: authUser.id,
      task_id: req.body.taskId,
      details: req.body.description,
    });

    const serviceResponse = ServiceResponse.success<SubmissionResponse>(
      "Submission Created",
      { data: await getSubmissionJson(submission) },
    );
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}
