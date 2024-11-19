import { User } from "@/api/user/user.model";
import { Tables, TablesInsert } from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export class TaskPayout {
  static readonly TABLE_NAME = "task_payout" as const;

  constructor(private taskPayoutData: Tables<typeof TaskPayout.TABLE_NAME>) {}

  get txSignature() {
    return this.taskPayoutData.tx_signature;
  }
  get taskId() {
    return this.taskPayoutData.task_id;
  }
  get payeeId() {
    return this.taskPayoutData.payee;
  }
  get amountQuarks() {
    return this.taskPayoutData.amount_quarks;
  }
  get destinationAddress() {
    return this.taskPayoutData.destination_address;
  }
  get payoutAt() {
    return this.taskPayoutData.payout_at;
  }

  async getPayee(): Promise<User | null> {
    if (!this.payeeId) return null;
    return await User.getUserById(this.payeeId);
  }

  static async getPayoutById(id: string): Promise<TaskPayout | null> {
    const { data, error } = await supabase
      .from(TaskPayout.TABLE_NAME)
      .select()
      .eq("tx_signature", id)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) {
      return null;
    }

    return new TaskPayout(data);
  }

  static async insert(
    taskPayoutData: TablesInsert<typeof TaskPayout.TABLE_NAME>,
  ): Promise<void> {
    const { error } = await supabase
      .from(TaskPayout.TABLE_NAME)
      .insert(taskPayoutData);
    if (error) throw new Error(JSON.stringify(error));
  }
}
