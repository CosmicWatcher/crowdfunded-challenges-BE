import { Database } from "@/common/types/database.types";
import { env } from "@/common/configs/env";
import { createClient } from "@supabase/supabase-js";

export const supabase = createClient<Database>(
  env.SUPABASE_URL,
  env.SUPABASE_SERVICE_ROLE_KEY,
  {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  },
);
