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
  TransactionInstruction,
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
 * SPL Token class to retrieve or create an associated token account.
 *
 * In case the transaction doesn't get included in a block it retries
 * with progressively higher priority fees
 */
export class TokenAccount {
  associatedToken: PublicKey;

  /**
   * Constructor
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
   */
  constructor(
    public connection: Connection,
    public payer: Signer,
    public mint: PublicKey,
    public owner: PublicKey,
    public allowOwnerOffCurve = false,
    public commitment: Commitment = "confirmed",
    public confirmOptions: ConfirmOptions = {
      preflightCommitment: "confirmed",
      commitment: "confirmed",
    },
    public programId = TOKEN_PROGRAM_ID,
    public associatedTokenProgramId = ASSOCIATED_TOKEN_PROGRAM_ID,
  ) {
    this.associatedToken = getAssociatedTokenAddressSync(
      this.mint,
      this.owner,
      this.allowOwnerOffCurve,
      this.programId,
      this.associatedTokenProgramId,
    );
  }

  async getAccount() {
    return await getAccount(
      this.connection,
      this.associatedToken,
      this.commitment,
      this.programId,
    );
  }

  /**
   * Retrieve the associated token account, or create it if it doesn't exist
   *
   * In case the transaction doesn't get included in a block it retries
   * with progressively higher priority fees
   *
   * @return Address of the new associated token account
   */
  async getOrCreateAccount() {
    let account: Account;
    try {
      account = await this.getAccount();
    } catch (error: unknown) {
      if (
        error instanceof TokenAccountNotFoundError ||
        error instanceof TokenInvalidAccountOwnerError
      ) {
        const instruction = this.createInstruction();
        try {
          const transaction = new Transaction().add(instruction);
          await this.sendTransaction(transaction);
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
                console.log(`Trying with priority fee ${priorityFee}`);
                await this.tryWithPriorityFee(instruction, priorityFee);
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

        account = await this.getAccount();
      } else {
        throw error;
      }
    }

    if (!account.mint.equals(this.mint)) throw new TokenInvalidMintError();
    if (!account.owner.equals(this.owner)) throw new TokenInvalidOwnerError();

    return account;
  }

  private async tryWithPriorityFee(
    instruction: TransactionInstruction,
    microLamports: number,
  ) {
    const priorityFee = ComputeBudgetProgram.setComputeUnitPrice({
      microLamports,
    });
    const transaction = new Transaction().add(instruction).add(priorityFee);
    await this.sendTransaction(transaction);
  }

  private createInstruction() {
    return createAssociatedTokenAccountInstruction(
      this.payer.publicKey,
      this.associatedToken,
      this.owner,
      this.mint,
      this.programId,
      this.associatedTokenProgramId,
    );
  }

  private async sendTransaction(transaction: Transaction) {
    await sendAndConfirmTransaction(
      this.connection,
      transaction,
      [this.payer],
      this.confirmOptions,
    );
  }
}
