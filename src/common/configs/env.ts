import dotenv from "dotenv";
import {
  EnvError,
  cleanEnv,
  host,
  json,
  makeExactValidator,
  num,
  port,
  str,
  testOnly,
  url,
} from "envalid";

dotenv.config();

const secretKey = makeExactValidator<Uint8Array>((input: string) => {
  try {
    const decodedSecretKey = Uint8Array.from(
      JSON.parse(input) as Iterable<number>,
    );
    return decodedSecretKey;
  } catch (err) {
    throw new EnvError(
      `Invalid secret key in environment variable '${input}'! ${String(err)}`,
    );
  }
});

export const env = cleanEnv(process.env, {
  NODE_ENV: str({
    devDefault: testOnly("test"),
    choices: ["development", "production", "test"],
  }),
  HOST: host({ devDefault: testOnly("localhost") }),
  PORT: port({ devDefault: testOnly(3000) }),
  CORS_ORIGIN: json(),
  COMMON_RATE_LIMIT_MAX_REQUESTS: num({ devDefault: testOnly(1000) }),
  COMMON_RATE_LIMIT_WINDOW_MS: num({ devDefault: testOnly(1000) }),
  SUPABASE_ANON_KEY: str(),
  SUPABASE_SERVICE_ROLE_KEY: str(),
  SUPABASE_URL: url(),
  KIN_DESTINATION: str(),
  SOLANA_PAYER_SECRET: secretKey(),
  SOLANA_RPC: str({ choices: ["devnet", "testnet", "mainnet-beta"] }),
  KIN_MINT_ADDRESS: str(),
});
