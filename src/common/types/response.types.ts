import { TaskKind, TaskStatus } from "@/api/task/taskModel";

export interface ResponseObject {
  data: UserResponse | TaskResponse;
  pagination?: ResponsePagination;
}

export interface ResponsePagination {
  total_records: number;
  total_pages: number;
  current_page: number;
  prev_page: number | null;
  next_page: number | null;
}

export interface UserResponse {
  id: string;
  username: string | null;
}

export interface TaskResponse {
  id: string;
  createdBy: UserResponse | null;
  title: string | null;
  details: string | null;
  kind: TaskKind;
  maxWinners: number;
  status: TaskStatus;
  depositAddress: string | null;
  createdAt: string;
  editedAt: string | null;
  endedAt: string | null;
}
