import {
  ASSOCIATED_TOKEN_PROGRAM_ID,
  Account,
  TOKEN_PROGRAM_ID,
  TokenAccountNotFoundError,
  TokenInvalidAccountOwnerError,
  TokenInvalidMintError,
  TokenInvalidOwnerError,
  createAssociatedTokenAccountInstruction,
  createTransferInstruction,
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
  TransactionInstruction,
  TransactionSignature,
  clusterApiUrl,
  sendAndConfirmTransaction,
} from "@solana/web3.js";

import { env } from "@/common/configs/env";
import { SolanaAddressType } from "@/common/types/custom.types";

export const solanaPayer = Keypair.fromSecretKey(env.SOLANA_PAYER_SECRET);
export const kinPubKey = new PublicKey(env.KIN_MINT_ADDRESS);
export const solanaConn = new Connection(clusterApiUrl(env.SOLANA_RPC));

export async function getSolanaAddressType(
  address: string,
): Promise<SolanaAddressType | null> {
  const accountInfo = await solanaConn.getAccountInfo(new PublicKey(address));

  if (accountInfo === null) {
    return null;
  }
  if (accountInfo.owner.toBase58() === SystemProgram.programId.toBase58()) {
    return "solana";
  } else {
    return "token";
  }
}

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
        await sendAndConfirmTransaction(
          connection,
          new Transaction().add(instruction),
          [payer],
          confirmOptions,
        );
      } catch (error: unknown) {
        if (error instanceof TransactionExpiredBlockheightExceededError) {
          await tryTransactionWithPriorityFee(
            connection,
            payer,
            confirmOptions,
            instruction,
            error.signature,
          );
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

/**
 * Transfer tokens from one account to another
 *
 * @param connection     Connection to use
 * @param payer          Payer of the transaction fees
 * @param source         Source account
 * @param destination    Destination account
 * @param owner          Owner of the source account
 * @param amount         Number of tokens to transfer
 * @param multiSigners   Signing accounts if `owner` is a multisig
 * @param confirmOptions Options for confirming the transaction
 * @param programId      SPL Token program account
 *
 * @return Signature of the confirmed transaction
 */
export async function transferToken(
  connection: Connection,
  payer: Signer,
  source: PublicKey,
  destination: PublicKey,
  owner: Signer | PublicKey,
  amount: number | bigint,
  multiSigners: Signer[] = [],
  confirmOptions: ConfirmOptions = {
    preflightCommitment: "confirmed",
    commitment: "confirmed",
  },
  programId = TOKEN_PROGRAM_ID,
): Promise<TransactionSignature> {
  const [ownerPublicKey, signers] =
    owner instanceof PublicKey
      ? [owner, multiSigners]
      : [owner.publicKey, [owner]];

  const instruction = createTransferInstruction(
    source,
    destination,
    ownerPublicKey,
    amount,
    multiSigners,
    programId,
  );

  try {
    return await sendAndConfirmTransaction(
      connection,
      new Transaction().add(instruction),
      [payer, ...signers],
      confirmOptions,
    );
  } catch (error: unknown) {
    if (!(error instanceof TransactionExpiredBlockheightExceededError)) {
      throw error;
    }

    return await tryTransactionWithPriorityFee(
      connection,
      payer,
      confirmOptions,
      instruction,
      error.signature,
    );
  }
}

/**
 * Try the transaction with progressively higher priority fees
 * in case it doesn't get included in a block.
 *
 * @param connection               Connection to use
 * @param payer                    Payer of the transaction and initialization fees
 * @param confirmOptions           Options for confirming the transaction
 * @param instruction              Transaction instruction to execute
 * @param signature                Signature of the transaction to check status of before trying with priority fee
 *
 * @return Signature of the confirmed transaction
 */
async function tryTransactionWithPriorityFee(
  connection: Connection,
  payer: Signer,
  confirmOptions: ConfirmOptions,
  instruction: TransactionInstruction,
  signature?: TransactionSignature,
): Promise<TransactionSignature> {
  const baseFee = 10000;
  const maxFee = Math.pow(10, 7);
  let attempt = 0;

  while (true) {
    if (signature) {
      // wait a bit then check if the transaction was actually confirmed
      await new Promise((resolve) => setTimeout(resolve, 2000));
      const status = await solanaConn.getSignatureStatus(signature, {
        searchTransactionHistory: true,
      });

      if (
        status?.value?.confirmationStatus === "confirmed" ||
        status?.value?.confirmationStatus === "finalized"
      ) {
        return signature;
      }
    }

    const priorityFee = Math.floor(100000 * attempt * attempt + baseFee);

    try {
      console.log(
        `[${new Date().toLocaleString()}] Trying with priority fee ${priorityFee}`,
      );

      const priorityFeeInstruction = ComputeBudgetProgram.setComputeUnitPrice({
        microLamports: priorityFee,
      });
      const transaction = new Transaction()
        .add(instruction)
        .add(priorityFeeInstruction);

      return await sendAndConfirmTransaction(
        connection,
        transaction,
        [payer],
        confirmOptions,
      );
    } catch (error: unknown) {
      if (
        !(error instanceof TransactionExpiredBlockheightExceededError) ||
        priorityFee > maxFee
      ) {
        throw error;
      }

      attempt++;
      signature = error.signature;
    }
  }
}
