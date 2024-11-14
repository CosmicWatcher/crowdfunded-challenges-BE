import {
  Connection,
  Keypair,
  PublicKey,
  SystemProgram,
  Transaction,
  clusterApiUrl,
  sendAndConfirmTransaction,
} from "@solana/web3.js";

import { env } from "@/common/configs/env";

export const solanaPayer = Keypair.fromSecretKey(env.SOLANA_PAYER_SECRET);
export const kinPubKey = new PublicKey(env.KIN_MINT_ADDRESS);
export const solanaConn = new Connection(clusterApiUrl(env.SOLANA_RPC));

export async function createAccountOnChain(newAccount: Keypair) {
  const accountInfo = await solanaConn.getAccountInfo(newAccount.publicKey);
  if (accountInfo) return;

  const space = 0;
  const rentExemptionAmount =
    await solanaConn.getMinimumBalanceForRentExemption(space);

  const createAccountParams = {
    fromPubkey: solanaPayer.publicKey,
    newAccountPubkey: newAccount.publicKey,
    lamports: rentExemptionAmount,
    space,
    programId: SystemProgram.programId,
  };

  const createAccountTransaction = new Transaction().add(
    SystemProgram.createAccount(createAccountParams),
  );

  await sendAndConfirmTransaction(solanaConn, createAccountTransaction, [
    solanaPayer,
    newAccount,
  ]);
}
