import { PostgrestSingleResponse } from "@supabase/supabase-js";

import { SolanaAccount } from "@/api/solanaAccount/solanaAccount.model";
import { User } from "@/api/user/user.model";
import {
  Tables,
  TablesInsert,
  TablesUpdate,
} from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export type TaskStatus = Tables<typeof Task.TABLE_NAME>["status"];
export type TaskKind = Tables<typeof Task.TABLE_NAME>["kind"];

export class Task {
  static readonly TABLE_NAME = "tasks" as const;

  constructor(private taskData: Tables<typeof Task.TABLE_NAME>) {}

  get id() {
    return this.taskData.id;
  }
  get status() {
    return this.taskData.status;
  }
  get title() {
    return this.taskData.title;
  }
  get details() {
    return this.taskData.details;
  }
  get maxWinners() {
    return this.taskData.max_winners;
  }
  get createdAt() {
    return this.taskData.created_at;
  }
  get editedAt() {
    return this.taskData.edited_at;
  }
  get endedAt() {
    return this.taskData.ended_at;
  }
  get deletedAt() {
    return this.taskData.deleted_at;
  }
  get kind() {
    return this.taskData.kind;
  }
  get createdBy() {
    return this.taskData.created_by;
  }
  get solanaAccountId() {
    return this.taskData.deposit_address;
  }

  async getCreator(): Promise<User | null> {
    if (!this.createdBy) return null;
    return await User.getUserById(this.createdBy);
  }

  async getSolanaAccount(): Promise<SolanaAccount | null> {
    if (
      this.status === "successful" ||
      this.status === "failed" ||
      this.status === "deleted"
    )
      return null;

    try {
      if (!this.solanaAccountId) {
        const account = await SolanaAccount.getOrCreateAccount();
        await this.update({ deposit_address: account.id });
        return account;
      }

      return await SolanaAccount.getAccountById(this.solanaAccountId);
    } catch (_err) {
      return null;
    }
  }

  static async getTaskById(id: string): Promise<Task | null> {
    const status: TaskStatus = "deleted";

    const { data, error } = await supabase
      .from(Task.TABLE_NAME)
      .select()
      .eq("id", id)
      .neq("status", status)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) {
      return null;
    }

    return new Task(data);
  }

  static async getTaskList(
    rangeStart: number,
    rangeEnd: number,
    ascending = false,
    status?: TaskStatus,
  ): Promise<{ tasks: Task[]; totalRecords: number }> {
    const statusDeleted: TaskStatus = "deleted";

    let result: PostgrestSingleResponse<Tables<typeof Task.TABLE_NAME>[]>;
    if (status === undefined) {
      result = await supabase
        .from(Task.TABLE_NAME)
        .select("*", { count: "estimated" })
        .neq("status", statusDeleted)
        .order("created_at", { ascending })
        .range(rangeStart, rangeEnd);
    } else {
      result = await supabase
        .from(Task.TABLE_NAME)
        .select("*", { count: "estimated" })
        .eq("status", status)
        .order("created_at", { ascending })
        .range(rangeStart, rangeEnd);
    }

    if (result.error) throw new Error(JSON.stringify(result.error));

    const tasks: Task[] = [];
    for (const row of result.data) {
      tasks.push(new Task(row));
    }
    return { tasks, totalRecords: result.count ?? tasks.length };
  }

  static async getFeaturedTasks(): Promise<Task[]> {
    const { data, error } = await supabase
      .from(Task.TABLE_NAME)
      .select()
      .eq("status", "active")
      .limit(5);

    if (error) throw new Error(JSON.stringify(error));
    if (!data) return [];

    const tasks: Task[] = [];
    for (const row of data) {
      tasks.push(new Task(row));
    }
    return tasks;
  }

  static async insert(
    taskData: TablesInsert<typeof Task.TABLE_NAME>,
  ): Promise<void> {
    const { error } = await supabase.from(Task.TABLE_NAME).insert(taskData);
    if (error) throw new Error(JSON.stringify(error));
  }

  async update(taskData: TablesUpdate<typeof Task.TABLE_NAME>): Promise<Task> {
    const { data, error } = await supabase
      .from(Task.TABLE_NAME)
      .update(taskData)
      .eq("id", this.id)
      .select()
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) return this;

    this.taskData = data;
    return this;
  }
}
