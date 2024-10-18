import { clusterApiUrl, Connection, Keypair, PublicKey } from "@solana/web3.js";
import { env } from "@/common/configs/env";
import { SupabaseClient } from "@supabase/supabase-js";
import { Database } from "@/common/types/database.types";

export const solanaPayer = Keypair.fromSecretKey(env.SOLANA_PAYER_SECRET);
export const kinPubKey = new PublicKey(env.KIN_MINT_ADDRESS);
export const solanaConn = new Connection(clusterApiUrl(env.SOLANA_RPC));

/**
 * @throws PostgrestError but not in production environment
 * @returns an existing or new solana keypair
 * @returns id of the keypair on the db or null if there was an error while saving it
 */
export async function getOrCreateKeypair(supabase: SupabaseClient<Database>) {
  let keypair = Keypair.generate();
  let keypairID: string | null;

  // get a solana keypair from db if one is available
  const { data: keypairData, error: e1 } = await supabase
    .from("task_solana_keypairs")
    .select("id, private_key, tasks()")
    .is("tasks", null)
    .limit(1)
    .maybeSingle();
  if (e1 && env.NODE_ENV !== "production") throw new Error(JSON.stringify(e1));

  if (keypairData) {
    keypair = Keypair.fromSecretKey(
      Uint8Array.from(JSON.parse(keypairData.private_key) as Iterable<number>),
    );
    keypairID = keypairData.id;
  }
  // if a keypair is not available, create one
  else {
    const { data, error: e2 } = await supabase
      .from("task_solana_keypairs")
      .insert({
        private_key: JSON.stringify(Array.from(keypair.secretKey)),
        public_key: keypair.publicKey.toBase58(),
      })
      .select()
      .single();
    keypairID = data ? data.id : null;
    if (e2 && env.NODE_ENV !== "production")
      throw new Error(JSON.stringify(e2));
  }

  return { keypair, keypairID };
}
