import { User as AuthUser } from "@supabase/supabase-js";

import { Tables, TablesUpdate } from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export type DepositAddressType = Tables<
  typeof User.TABLE_NAME
>["deposit_address_type"];

export class User {
  static readonly TABLE_NAME = "users" as const;
  constructor(private userData: Tables<typeof User.TABLE_NAME>) {}

  get id() {
    return this.userData.id;
  }
  get username() {
    return this.userData.username;
  }
  get depositAddress() {
    return this.userData.deposit_address;
  }
  get depositAddressType() {
    return this.userData.deposit_address_type;
  }

  static async getUserById(id: string) {
    const { data, error } = await supabase
      .from(User.TABLE_NAME)
      .select()
      .eq("id", id)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) {
      return null;
    }

    return new User(data);
  }

  static async checkUsernameExists(username: string) {
    const { data, error } = await supabase
      .from(User.TABLE_NAME)
      .select("username")
      .ilike("username", username)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));

    return !!data;
  }

  static async getAuthUserData(userId: string): Promise<AuthUser> {
    const { data, error } = await supabase.auth.admin.getUserById(userId);
    if (error) throw new Error(JSON.stringify(error));
    return data.user;
  }

  static async getCodeLoginUser(codeUserId: string): Promise<User> {
    const { data, error } = await supabase
      .from(User.TABLE_NAME)
      .select()
      .eq("code_userid", codeUserId)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (data) return new User(data);

    const { data: newData, error: error2 } = await supabase
      .from(User.TABLE_NAME)
      .insert({
        code_userid: codeUserId,
      })
      .select()
      .single();

    if (error2) throw new Error(JSON.stringify(error2));
    return new User(newData);
  }

  async update(userData: TablesUpdate<typeof User.TABLE_NAME>): Promise<User> {
    const { data, error } = await supabase
      .from(User.TABLE_NAME)
      .update(userData)
      .eq("id", this.id)
      .select()
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) return this;

    this.userData = data;
    return this;
  }
}
