import { TaskKind, TaskStatus } from "@/api/task/task.model";

export interface ResponseObject<T> {
  data: T;
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
  metrics: {
    overall: { totalFunds: number; totalVotes: number };
    user: {
      totalFunds: number;
      totalVotes: number;
      votingRights: number;
    } | null;
  };
}

export interface SolutionResponse {
  id: string;
  taskId: string | null;
  createdBy: UserResponse | null;
  title: string | null;
  details: string | null;
  userVoteMetrics: SolutionVoteMetrics | null;
  isWinner: boolean;
  createdAt: string;
  editedAt: string | null;
  deletedAt: string | null;
}

export interface SolutionVoteMetrics {
  totalVotes: number;
  votingRights: number;
}
