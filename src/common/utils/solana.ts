import { clusterApiUrl, Connection, Keypair, PublicKey } from "@solana/web3.js";
import { env } from "@/common/configs/env";

export const solanaPayer = Keypair.fromSecretKey(env.SOLANA_PAYER_SECRET);
export const kinPubKey = new PublicKey(env.KIN_MINT_ADDRESS);
export const solanaConn = new Connection(clusterApiUrl(env.SOLANA_RPC));
