import { SolanaKeypair } from "@/api/solanaKeypair/solanaKeypairModel";
import { User } from "@/api/user/userModel";
import { Tables, TablesInsert } from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export class Task {
  static readonly TABLE_NAME = "tasks" as const;
  static readonly TYPES = {
    COMMUNITY: "community",
    PERSONAL: "personal",
  };
  static readonly STATUS = {
    ACTIVE: "active",
    SUCCESSFUL: "successful",
    FAILED: "failed",
    DELETED: "deleted",
  };

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
  get creatorId() {
    return this.taskData.created_by;
  }
  get depositAddressId() {
    return this.taskData.deposit_address;
  }

  async getCreator() {
    if (!this.creatorId) {
      return null;
    }
    return await User.getUserById(this.creatorId);
  }

  async getDepositAddress() {
    if (!this.depositAddressId) {
      return null;
    }
    return await SolanaKeypair.getKeypairById(this.depositAddressId);
  }

  static async getTaskById(id: string) {
    const { data, error } = await supabase
      .from(Task.TABLE_NAME)
      .select()
      .eq("id", id)
      .neq("status", Task.STATUS.DELETED)
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
  ) {
    const { data, error, count } = await supabase
      .from(Task.TABLE_NAME)
      .select("*", { count: "estimated" })
      .neq("status", Task.STATUS.DELETED)
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

  static async insert(taskData: TablesInsert<typeof Task.TABLE_NAME>) {
    const { error } = await supabase.from(Task.TABLE_NAME).insert(taskData);
    if (error) throw new Error(JSON.stringify(error));
  }
}
