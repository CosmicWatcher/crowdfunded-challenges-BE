import { createClient } from "@supabase/supabase-js";

import { env } from "@/common/configs/env";
import { Database } from "@/common/types/database.types";

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
