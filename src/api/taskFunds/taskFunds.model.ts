import { Kin } from "@code-wallet/currency";

import { SolutionVotes } from "@/api/solutionVotes/solutionVotes.model";
import { Task } from "@/api/task/task.model";
import { User } from "@/api/user/user.model";
import { Tables, TablesInsert } from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export class TaskFunds {
  static readonly TABLE_NAME = "task_funding" as const;
  static readonly QUARKS_PER_VOTE = 10000n * Kin.quarksPerKin;

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
    return Math.floor(Number(totalKin.toQuarks() / TaskFunds.QUARKS_PER_VOTE));
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
}
