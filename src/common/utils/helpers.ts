import { PublicKey } from "@code-wallet/keys";
import { createPublicKey } from "crypto";
import { Request, Response } from "express";
import { jwtVerify } from "jose";

import { ServiceResponse } from "@/common/models/serviceResponse";
import { ResponsePagination } from "@/common/types/response.types";

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

export function getJwtToken(req: Request): string | null {
  const jwt = req.headers.authorization;
  if (jwt?.startsWith("Bearer ")) return jwt.slice(7);
  else return null;
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
