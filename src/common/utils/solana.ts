import {
  ASSOCIATED_TOKEN_PROGRAM_ID,
  Account,
  TOKEN_PROGRAM_ID,
  TokenAccountNotFoundError,
  TokenInvalidAccountOwnerError,
  TokenInvalidMintError,
  TokenInvalidOwnerError,
  createAssociatedTokenAccountInstruction,
  getAccount,
  getAssociatedTokenAddressSync,
} from "@solana/spl-token";
import {
  Commitment,
  ComputeBudgetProgram,
  ConfirmOptions,
  Connection,
  Keypair,
  PublicKey,
  Signer,
  SystemProgram,
  Transaction,
  TransactionExpiredBlockheightExceededError,
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

/**
 * Retrieve or create an associated token account.
 * In case the transaction doesn't get included in a block it retries
 * with progressively higher priority fees.
 *
 * @param connection               Connection to use
 * @param payer                    Payer of the transaction and initialization fees
 * @param mint                     Mint associated with the account to set or verify
 * @param owner                    Owner of the account to set or verify
 * @param allowOwnerOffCurve       Allow the owner account to be a PDA (Program Derived Address)
 * @param commitment               Desired level of commitment for querying the state
 * @param confirmOptions           Options for confirming the transaction
 * @param programId                SPL Token program account
 * @param associatedTokenProgramId SPL Associated Token program account
 *
 * @return Address of the new associated token account
 */
export async function getOrCreateTokenAccount(
  connection: Connection,
  payer: Signer,
  mint: PublicKey,
  owner: PublicKey,
  allowOwnerOffCurve = false,
  commitment: Commitment = "confirmed",
  confirmOptions: ConfirmOptions = {
    preflightCommitment: "confirmed",
    commitment: "confirmed",
  },
  programId = TOKEN_PROGRAM_ID,
  associatedTokenProgramId = ASSOCIATED_TOKEN_PROGRAM_ID,
): Promise<Account> {
  const associatedToken = getAssociatedTokenAddressSync(
    mint,
    owner,
    allowOwnerOffCurve,
    programId,
    associatedTokenProgramId,
  );

  let account: Account;
  try {
    account = await getAccount(
      connection,
      associatedToken,
      commitment,
      programId,
    );
  } catch (error: unknown) {
    if (
      error instanceof TokenAccountNotFoundError ||
      error instanceof TokenInvalidAccountOwnerError
    ) {
      const instruction = createAssociatedTokenAccountInstruction(
        payer.publicKey,
        associatedToken,
        owner,
        mint,
        programId,
        associatedTokenProgramId,
      );

      try {
        const transaction = new Transaction().add(instruction);
        await sendAndConfirmTransaction(
          connection,
          transaction,
          [payer],
          confirmOptions,
        );
      } catch (error: unknown) {
        if (error instanceof TransactionExpiredBlockheightExceededError) {
          const baseFee = 10000;
          const maxFee = Math.pow(10, 7);
          let attempt = 0;

          while (true) {
            const priorityFee = Math.floor(
              100000 * attempt * attempt + baseFee,
            );
            try {
              console.log(
                `[${new Date().toLocaleString()}] Trying with priority fee ${priorityFee}`,
              );
              const priorityFeeInstruction =
                ComputeBudgetProgram.setComputeUnitPrice({
                  microLamports: priorityFee,
                });
              const transaction = new Transaction()
                .add(instruction)
                .add(priorityFeeInstruction);
              await sendAndConfirmTransaction(
                connection,
                transaction,
                [payer],
                confirmOptions,
              );
              break;
            } catch (retryError) {
              if (
                !(
                  retryError instanceof
                  TransactionExpiredBlockheightExceededError
                )
              ) {
                throw retryError;
              }
              attempt++;
              if (priorityFee > maxFee) {
                throw retryError;
              }
            }
          }
        }
      }

      account = await getAccount(
        connection,
        associatedToken,
        commitment,
        programId,
      );
    } else {
      throw error;
    }
  }

  if (!account.mint.equals(mint)) throw new TokenInvalidMintError();
  if (!account.owner.equals(owner)) throw new TokenInvalidOwnerError();

  return account;
}
