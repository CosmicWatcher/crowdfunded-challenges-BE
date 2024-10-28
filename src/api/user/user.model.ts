import { Tables } from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

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

  async getAuthUserData() {
    const { data, error } = await supabase.auth.admin.getUserById(this.id);
    if (error) throw new Error(JSON.stringify(error));
    return data;
  }
}
