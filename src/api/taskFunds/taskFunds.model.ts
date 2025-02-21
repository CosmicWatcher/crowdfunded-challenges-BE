import { Kin } from "@code-wallet/currency";

import { Task } from "@/api/task/task.model";
import { User } from "@/api/user/user.model";
import {
  Tables,
  TablesInsert,
  TablesUpdate,
} from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export class TaskFunds {
  static readonly TABLE_NAME = "task_funding" as const;
  static readonly KIN_PER_VOTE = 1000;

  constructor(private taskFundsData: Tables<typeof TaskFunds.TABLE_NAME>) {}

  get id() {
    return this.taskFundsData.id;
  }
  get taskId() {
    return this.taskFundsData.task_id;
  }
  get fundedBy() {
    return this.taskFundsData.funded_by;
  }
  get amountQuarks() {
    return this.taskFundsData.amount_quarks;
  }
  get fundedAt() {
    return this.taskFundsData.funded_at;
  }

  async getFundedBy(): Promise<User | null> {
    if (!this.fundedBy) return null;
    return await User.getUserById(this.fundedBy);
  }

  async getTask(): Promise<Task | null> {
    if (!this.taskId) return null;
    return await Task.getTaskById(this.taskId);
  }

  static async getFundersByTask(taskId: Task["id"]): Promise<
    {
      funderId: User["id"];
      amount: Kin;
    }[]
  > {
    const { data, error } = await supabase
      .from(TaskFunds.TABLE_NAME)
      .select("funded_by, amount_quarks.sum()")
      .eq("task_id", taskId)
      .gt("amount_quarks", 0)
      .returns<{ funded_by: User["id"]; sum: number }[]>();

    if (error) throw new Error(JSON.stringify(error));
    return data.map(({ funded_by, sum }) => ({
      funderId: funded_by,
      amount: Kin.fromQuarks(BigInt(sum)),
    }));
  }

  static async findByIntent(intentId: string): Promise<TaskFunds | null> {
    const { data, error } = await supabase
      .from(TaskFunds.TABLE_NAME)
      .select()
      .eq("intent_id", intentId)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) return null;

    return new TaskFunds(data);
  }

  static async totalKinByTask(taskId: Task["id"]): Promise<Kin> {
    const { data, error } = await supabase
      .from(TaskFunds.TABLE_NAME)
      .select("amount_quarks.sum()")
      .eq("task_id", taskId)
      .returns<{ sum: number | null }[]>()
      .single();

    if (error) throw new Error(JSON.stringify(error));
    if (!data.sum) return Kin.zero;
    return Kin.fromQuarks(BigInt(data.sum));
  }

  static async totalKinByUser(
    taskId: Task["id"],
    userId: User["id"],
  ): Promise<Kin> {
    const { data, error } = await supabase
      .from(TaskFunds.TABLE_NAME)
      .select("amount_quarks.sum()")
      .eq("task_id", taskId)
      .eq("funded_by", userId)
      .returns<{ sum: number | null }[]>()
      .single();

    if (error) throw new Error(JSON.stringify(error));
    if (!data.sum) return Kin.zero;
    return Kin.fromQuarks(BigInt(data.sum));
  }

  static async userBoughtVotingRights(
    taskId: Task["id"],
    userId: User["id"],
  ): Promise<number> {
    const totalKin = await TaskFunds.totalKinByUser(taskId, userId);
    return Math.floor(Number(totalKin.toDecimal() / TaskFunds.KIN_PER_VOTE));
  }

  static async insert(
    taskFundsData: TablesInsert<typeof TaskFunds.TABLE_NAME>,
  ): Promise<TaskFunds> {
    const { data, error } = await supabase
      .from(TaskFunds.TABLE_NAME)
      .insert(taskFundsData)
      .select()
      .single();

    if (error) throw new Error(JSON.stringify(error));
    return new TaskFunds(data);
  }

  async update(
    taskFundsData: TablesUpdate<typeof TaskFunds.TABLE_NAME>,
  ): Promise<TaskFunds> {
    const { data, error } = await supabase
      .from(TaskFunds.TABLE_NAME)
      .update(taskFundsData)
      .eq("id", this.id)
      .select()
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) return this;

    this.taskFundsData = data;
    return this;
  }
}
