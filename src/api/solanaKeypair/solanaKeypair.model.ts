import { Keypair } from "@solana/web3.js";

import { Task } from "@/api/task/task.model";
import { Tables } from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export class SolanaKeypair {
  static readonly TABLE_NAME = "task_solana_keypairs" as const;
  private keypairObject: Keypair;

  constructor(private keypairData: Tables<typeof SolanaKeypair.TABLE_NAME>) {
    this.keypairObject = Keypair.fromSecretKey(
      Uint8Array.from(JSON.parse(keypairData.private_key) as Iterable<number>),
    );
  }

  get id() {
    return this.keypairData.id;
  }
  get privateKey() {
    return this.keypairData.private_key;
  }
  get publicKey() {
    return this.keypairData.public_key;
  }
  get createdAt() {
    return this.keypairData.created_at;
  }
  get keypair() {
    return this.keypairObject;
  }

  static async getKeypairById(id: string) {
    const { data, error } = await supabase
      .from(SolanaKeypair.TABLE_NAME)
      .select()
      .eq("id", id)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) {
      return null;
    }

    return new SolanaKeypair(data);
  }

  static async getKeypairNotInUse() {
    const { data, error } = await supabase
      .from(SolanaKeypair.TABLE_NAME)
      .select(`*, ${Task.TABLE_NAME}(id)`)
      .is(Task.TABLE_NAME, null)
      .limit(1)
      .maybeSingle();
    if (error) throw new Error(JSON.stringify(error));
    if (!data) return null;

    return new SolanaKeypair(data);
  }

  static async createKeypair() {
    const keypair = Keypair.generate();
    const { data, error } = await supabase
      .from(SolanaKeypair.TABLE_NAME)
      .insert({
        private_key: JSON.stringify(Array.from(keypair.secretKey)),
        public_key: keypair.publicKey.toBase58(),
      })
      .select()
      .single();
    if (error) throw new Error(JSON.stringify(error));
    if (!data) throw new Error("Failed to create keypair");

    return new SolanaKeypair(data);
  }

  static async getOrCreateKeypair() {
    const keypair = await SolanaKeypair.getKeypairNotInUse();
    if (!keypair) return await SolanaKeypair.createKeypair();
    return keypair;
  }
}
