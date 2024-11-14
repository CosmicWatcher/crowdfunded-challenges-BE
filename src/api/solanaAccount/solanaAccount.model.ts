import { Keypair } from "@solana/web3.js";

import { Task } from "@/api/task/task.model";
import { Tables, TablesUpdate } from "@/common/types/database.types";
import { createAccountOnChain } from "@/common/utils/solana";
import { supabase } from "@/common/utils/supabase";

export class SolanaAccount {
  static readonly TABLE_NAME = "solana_accounts" as const;
  private keypairObject: Keypair;

  constructor(private accountData: Tables<typeof SolanaAccount.TABLE_NAME>) {
    this.keypairObject = this.getKeypairFromPrivateKey(accountData.private_key);
  }

  get id() {
    return this.accountData.id;
  }
  get privateKey() {
    return this.accountData.private_key;
  }
  get publicKey() {
    return this.accountData.public_key;
  }
  get createdAt() {
    return this.accountData.created_at;
  }
  get isOnChain() {
    return this.accountData.is_on_chain;
  }
  get keypair() {
    return this.keypairObject;
  }

  private getKeypairFromPrivateKey(privateKey: string) {
    return Keypair.fromSecretKey(
      Uint8Array.from(JSON.parse(privateKey) as Iterable<number>),
    );
  }

  static async getAccountById(id: string) {
    const { data, error } = await supabase
      .from(SolanaAccount.TABLE_NAME)
      .select()
      .eq("id", id)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) {
      return null;
    }

    return new SolanaAccount(data);
  }

  static async getAccountNotInUse() {
    const { data, error } = await supabase
      .from(SolanaAccount.TABLE_NAME)
      .select(`*, ${Task.TABLE_NAME}(id)`)
      .is(Task.TABLE_NAME, null)
      .limit(1)
      .maybeSingle();
    if (error) throw new Error(JSON.stringify(error));
    if (!data) return null;

    return new SolanaAccount(data);
  }

  static async createKeypair() {
    const keypair = Keypair.generate();
    const { data, error } = await supabase
      .from(SolanaAccount.TABLE_NAME)
      .insert({
        private_key: JSON.stringify(Array.from(keypair.secretKey)),
        public_key: keypair.publicKey.toBase58(),
      })
      .select()
      .single();
    if (error) throw new Error(JSON.stringify(error));

    return new SolanaAccount(data);
  }

  static async getOrCreateAccount() {
    let account = await SolanaAccount.getAccountNotInUse();
    if (!account) account = await SolanaAccount.createKeypair();
    await createAccountOnChain(account.keypair);

    return account;
  }

  async update(
    accountData: TablesUpdate<typeof SolanaAccount.TABLE_NAME>,
  ): Promise<SolanaAccount> {
    const { data, error } = await supabase
      .from(SolanaAccount.TABLE_NAME)
      .update(accountData)
      .eq("id", this.id)
      .select()
      .single();
    if (error) throw new Error(JSON.stringify(error));
    this.accountData = data;
    this.keypairObject = this.getKeypairFromPrivateKey(data.private_key);
    return this;
  }
}
