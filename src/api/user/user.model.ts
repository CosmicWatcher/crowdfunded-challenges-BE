import { User as AuthUser } from "@supabase/supabase-js";
import { Request } from "express";

import { Tables } from "@/common/types/database.types";
import { getJwtToken } from "@/common/utils/helpers";
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

  async getAuthUserData(): Promise<AuthUser> {
    const { data, error } = await supabase.auth.admin.getUserById(this.id);
    if (error) throw new Error(JSON.stringify(error));
    return data.user;
  }

  static async getIdFromJwt(req: Request): Promise<User["id"] | null> {
    const jwt = getJwtToken(req);
    if (!jwt) return null;

    const { data, error } = await supabase.auth.getUser(jwt);
    if (error) throw new Error(JSON.stringify(error));

    return data.user.id;
  }
}
