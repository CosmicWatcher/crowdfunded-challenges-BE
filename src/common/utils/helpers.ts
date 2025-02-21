import { PublicKey } from "@code-wallet/keys";
import { createPublicKey } from "crypto";
import { Request, Response } from "express";
import { importSPKI, jwtVerify } from "jose";

import { User } from "@/api/user/user.model";
import { env } from "@/common/configs/env";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { ResponsePagination } from "@/common/types/response.types";
import { supabase } from "@/common/utils/supabase";

export function handleServiceResponse(
  serviceResponse: ServiceResponse<unknown>,
  response: Response,
) {
  return response.status(serviceResponse.statusCode).send(serviceResponse);
}

export function getPaginationJson(
  itemCount: number,
  currentPage: number,
  returnCount: number,
): ResponsePagination {
  const totalPages = Math.ceil(itemCount / returnCount);
  return {
    total_records: itemCount,
    total_pages: totalPages,
    current_page: currentPage,
    prev_page: currentPage === 1 ? null : currentPage - 1,
    next_page:
      totalPages === 0 || currentPage === totalPages ? null : currentPage + 1,
  };
}

export function getJwtToken(req: Request): {
  token: string;
  loginMethod: "code-login" | "supabase";
} | null {
  const jwt = req.headers.authorization;

  if (jwt?.startsWith("code-login "))
    return { token: jwt.slice(11), loginMethod: "code-login" };
  else if (jwt?.startsWith("supabase "))
    return { token: jwt.slice(9), loginMethod: "supabase" };
  else return null;
}

export async function getIdFromJwt(req: Request): Promise<User["id"] | null> {
  const jwt = getJwtToken(req);
  if (!jwt) return null;

  if (jwt.loginMethod === "code-login") {
    const payload = await verifyJwtToken(jwt.token);
    return payload.userId as string;
  } else if (jwt.loginMethod === "supabase") {
    const { data, error } = await supabase.auth.getUser(jwt.token);
    if (error) throw new Error(JSON.stringify(error));
    return data.user.id;
  }

  return null;
}

export async function verifyCodeWalletWebhookToken(
  token: string,
  publicKey: string,
) {
  const publicKeyBuffer = PublicKey.fromBase58(publicKey).toBuffer();

  const publicKeyDER = Buffer.concat([
    // these are ASN.1 headers for Ed25519 keys
    Buffer.from("302a300506032b6570032100", "hex"),
    publicKeyBuffer,
  ]);

  // convert to PEM format
  const publicKeyPEM = `-----BEGIN PUBLIC KEY-----\n${publicKeyDER.toString("base64")}\n-----END PUBLIC KEY-----\n`;

  // verify the token
  const public_key = createPublicKey({
    key: publicKeyPEM,
    format: "pem",
    type: "spki",
  });
  const { payload } = await jwtVerify(token, public_key, {
    algorithms: ["EdDSA"],
  });

  return payload;
}

export async function verifyJwtToken(token: string) {
  const publicKey = await importSPKI(env.JWT_PUBLIC_KEY, "EdDSA");
  const { payload } = await jwtVerify(token, publicKey);
  return payload;
}
