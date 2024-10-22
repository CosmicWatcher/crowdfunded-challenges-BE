import { SolanaKeypair } from "@/api/solanaKeypair/solanaKeypairModel";
import { Task } from "@/api/task/taskModel";
import { getUserJson } from "@/api/user/userController";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/auth.types";
import { TaskResponse } from "@/common/types/response.types";
import {
  handleServiceResponse,
  getPaginationJson,
} from "@/common/utils/helpers";
import { Request, Response, NextFunction } from "express";

export async function getTaskJson(task: Task): Promise<TaskResponse> {
  const depositAddress = await task.getDepositAddress();
  const creator = await task.getCreator();
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
  };
}

export async function getTaskById(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  try {
    const task = await Task.getTaskById(req.params.id);
    if (!task) {
      const serviceResponse = ServiceResponse.failure("Task not Found", null);
      return handleServiceResponse(serviceResponse, res);
    }

    const serviceResponse = ServiceResponse.success("Task Found", {
      data: await getTaskJson(task),
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
  const RETURN_COUNT = 4;
  const page = req.query.page as unknown as number;
  const rangeStart = (page - 1) * RETURN_COUNT;
  const rangeEnd = rangeStart + RETURN_COUNT - 1;

  try {
    const { tasks, totalRecords } = await Task.getTaskList(
      rangeStart,
      rangeEnd,
      false,
    );
    const pagination = getPaginationJson(totalRecords, page, RETURN_COUNT);
    const returnData: Awaited<ReturnType<typeof getTaskJson>>[] = [];
    for (const item of tasks) {
      returnData.push(await getTaskJson(item));
    }

    const serviceResponse = ServiceResponse.success("Tasks Found", {
      data: returnData,
      pagination,
    });
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    const error = JSON.parse(err as string);
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

  let keypair: SolanaKeypair | null = null;
  try {
    keypair = await SolanaKeypair.getOrCreateKeypair();
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
      deposit_address: keypair ? keypair.id : null,
    });

    const serviceResponse = ServiceResponse.success("Task Created", null);
    return handleServiceResponse(serviceResponse, res);
  } catch (err) {
    next(err);
  }
}
