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
  const space = 0;

  const [rentExemptionAmount, accountInfo] = await Promise.all([
    solanaConn.getMinimumBalanceForRentExemption(space),
    solanaConn.getAccountInfo(newAccount.publicKey),
  ]);

  if (accountInfo) {
    if (accountInfo.lamports >= rentExemptionAmount) return;
    const sendSolInstruction = SystemProgram.transfer({
      fromPubkey: solanaPayer.publicKey,
      toPubkey: newAccount.publicKey,
      lamports: rentExemptionAmount - accountInfo.lamports,
    });
    const sendSolTransaction = new Transaction().add(sendSolInstruction);
    await sendAndConfirmTransaction(solanaConn, sendSolTransaction, [
      solanaPayer,
    ]);
  } else {
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
}
