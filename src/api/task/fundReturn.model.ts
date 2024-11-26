import { User } from "@/api/user/user.model";
import { Tables, TablesInsert } from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export class TaskFundingReturn {
  static readonly TABLE_NAME = "task_funding_return" as const;

  constructor(
    private taskFundingReturnData: Tables<typeof TaskFundingReturn.TABLE_NAME>,
  ) {}

  get txSignature() {
    return this.taskFundingReturnData.tx_signature;
  }
  get taskId() {
    return this.taskFundingReturnData.task_id;
  }
  get funderId() {
    return this.taskFundingReturnData.funder_id;
  }
  get amountQuarks() {
    return this.taskFundingReturnData.amount_quarks;
  }
  get destinationAddress() {
    return this.taskFundingReturnData.destination_address;
  }
  get returnAt() {
    return this.taskFundingReturnData.return_at;
  }

  async getFunder(): Promise<User | null> {
    if (!this.funderId) return null;
    return await User.getUserById(this.funderId);
  }

  static async getFundingReturnById(
    id: string,
  ): Promise<TaskFundingReturn | null> {
    const { data, error } = await supabase
      .from(TaskFundingReturn.TABLE_NAME)
      .select()
      .eq("tx_signature", id)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) {
      return null;
    }

    return new TaskFundingReturn(data);
  }

  static async insert(
    taskFundingReturnData: TablesInsert<typeof TaskFundingReturn.TABLE_NAME>,
  ): Promise<void> {
    const { error } = await supabase
      .from(TaskFundingReturn.TABLE_NAME)
      .insert(taskFundingReturnData);
    if (error) throw new Error(JSON.stringify(error));
  }
}
