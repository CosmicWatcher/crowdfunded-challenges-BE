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
    if (this.status !== "active") return null;

    if (!this.solanaAccountId) {
      const account = await SolanaAccount.getOrCreateAccount();
      await this.update({ deposit_address: account.id });
      return account;
    }

    return await SolanaAccount.getAccountById(this.solanaAccountId);
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
  ): Promise<{ tasks: Task[]; totalRecords: number }> {
    const status: TaskStatus = "deleted";

    const { data, error, count } = await supabase
      .from(Task.TABLE_NAME)
      .select("*", { count: "estimated" })
      .neq("status", status)
      .order("created_at", { ascending })
      .range(rangeStart, rangeEnd);
    if (error) {
      throw new Error(JSON.stringify(error));
    }

    const tasks: Task[] = [];
    for (const row of data) {
      tasks.push(new Task(row));
    }
    return { tasks, totalRecords: count ?? tasks.length };
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
      .single();
    if (error) throw new Error(JSON.stringify(error));
    this.taskData = data;
    return this;
  }
}
