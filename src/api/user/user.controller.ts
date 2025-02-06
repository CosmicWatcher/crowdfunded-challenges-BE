import { NextFunction, Request, Response } from "express";
import { StatusCodes } from "http-status-codes";

import { User } from "@/api/user/user.model";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { AuthenticatedRequest } from "@/common/types/custom.types";
import { UserResponse } from "@/common/types/response.types";
import { handleServiceResponse } from "@/common/utils/helpers";
import { getSolanaAddressType } from "@/common/utils/solana";

export function getUserJson(user: User): UserResponse {
  return {
    id: user.id,
    username: user.username,
  };
}

export function getUserAccountJson(user: User): UserResponse {
  return {
    id: user.id,
    username: user.username,
    depositAddress: user.depositAddress,
  };
}

export async function getUserAccountById(req: Request, res: Response) {
  const authUser = (req as AuthenticatedRequest).authUser;

  const user = await User.getUserById(authUser.id);
  if (!user) {
    const serviceResponse = ServiceResponse.failure("User not found", null);
    return handleServiceResponse(serviceResponse, res);
  }

  const serviceResponse = ServiceResponse.success(
    "User account fetched successfully",
    { data: getUserAccountJson(user) },
  );
  return handleServiceResponse(serviceResponse, res);
}

export async function updateUser(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const authUser = (req as AuthenticatedRequest).authUser;
  const { username, depositAddressInfo } = req.body;

  let user = await User.getUserById(authUser.id);
  if (!user) {
    const serviceResponse = ServiceResponse.failure("User not found", null);
    return handleServiceResponse(serviceResponse, res);
  }

  try {
    user = await user.update({
      username,
      deposit_address: depositAddressInfo
        ? depositAddressInfo.address
        : undefined,
      deposit_address_type: depositAddressInfo
        ? depositAddressInfo.kind
        : undefined,
    });
  } catch (err) {
    const error = JSON.parse(String(err).slice(7));
    if (error.code == "23505") {
      const serviceResponse = ServiceResponse.failure(
        "Username already exists",
        null,
        StatusCodes.CONFLICT,
      );
      return handleServiceResponse(serviceResponse, res);
    } else {
      return next(err);
    }
  }

  const serviceResponse = ServiceResponse.success("User updated successfully", {
    data: getUserAccountJson(user),
  });
  return handleServiceResponse(serviceResponse, res);
}

export async function checkUsernameExists(req: Request, res: Response) {
  const { username } = req.body;

  const exists = await User.checkUsernameExists(username as string);

  const serviceResponse = ServiceResponse.success("Username check completed", {
    data: exists,
  });
  return handleServiceResponse(serviceResponse, res);
}

export async function validateSolanaAddress(req: Request, res: Response) {
  const address = req.body.address as string;

  try {
    const type = await getSolanaAddressType(address);
    const serviceResponse = ServiceResponse.success("Address validated", {
      data: {
        type,
      },
    });
    return handleServiceResponse(serviceResponse, res);
  } catch (err: unknown) {
    const serviceResponse = ServiceResponse.failure(
      err instanceof Error
        ? `Address validation failed: ${err.message}`
        : String(err),
      null,
    );
    return handleServiceResponse(serviceResponse, res);
  }
}
