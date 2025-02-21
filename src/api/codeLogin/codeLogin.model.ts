import {
  Tables,
  TablesInsert,
  TablesUpdate,
} from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export class CodeLogin {
  static readonly TABLE_NAME = "code_login" as const;
  constructor(private codeLoginData: Tables<typeof CodeLogin.TABLE_NAME>) {}

  get id() {
    return this.codeLoginData.id;
  }
  get intentId() {
    return this.codeLoginData.intent_id;
  }
  get userId() {
    return this.codeLoginData.user_id;
  }
  get createdAt() {
    return this.codeLoginData.created_at;
  }
  get expiresAt() {
    return this.codeLoginData.expires_at;
  }

  static async isIntentValid(intentId: string) {
    const { data, error } = await supabase
      .from(CodeLogin.TABLE_NAME)
      .select()
      .eq("intent_id", intentId)
      .gt("expires_at", new Date().toISOString())
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) {
      return false;
    }

    // wait a tiny bit before deleting the intent to avoid race condition on mobile
    void setTimeout(() => void CodeLogin.delete(intentId), 1000);

    return true;
  }

  static async insert(
    codeLoginData: TablesInsert<typeof CodeLogin.TABLE_NAME>,
  ): Promise<CodeLogin> {
    const { data, error } = await supabase
      .from(CodeLogin.TABLE_NAME)
      .insert(codeLoginData)
      .select()
      .single();

    if (error) throw new Error(JSON.stringify(error));
    return new CodeLogin(data);
  }

  static async delete(intentId: string) {
    const { error } = await supabase
      .from(CodeLogin.TABLE_NAME)
      .delete()
      .eq("intent_id", intentId);

    if (error) throw new Error(JSON.stringify(error));
  }

  async update(
    codeLoginData: TablesUpdate<typeof CodeLogin.TABLE_NAME>,
  ): Promise<CodeLogin> {
    const { data, error } = await supabase
      .from(CodeLogin.TABLE_NAME)
      .update(codeLoginData)
      .eq("id", this.id)
      .select()
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) return this;

    this.codeLoginData = data;
    return this;
  }
}
