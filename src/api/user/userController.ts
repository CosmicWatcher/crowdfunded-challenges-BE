import { User } from "@/api/user/userModel";

export function getUserJson(user: User) {
  return {
    id: user.id,
    username: user.username,
  };
}
