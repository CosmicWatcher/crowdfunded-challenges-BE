import { User } from "@/api/user/user.model";
import { UserResponse } from "@/common/types/response.types";

export function getUserJson(user: User): UserResponse {
  return {
    id: user.id,
    username: user.username,
  };
}
