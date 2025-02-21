import { getUserId, loginIntents } from "@code-wallet/client";
import { Keypair } from "@code-wallet/keys";
import { type Request, type Response } from "express";
import { StatusCodes } from "http-status-codes";
import { SignJWT, importPKCS8 } from "jose";

import { CodeLogin } from "@/api/codeLogin/codeLogin.model";
import { User } from "@/api/user/user.model";
import { env } from "@/common/configs/env";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { CodeLoginResponse } from "@/common/types/response.types";
import { handleServiceResponse } from "@/common/utils/helpers";

export function getVerifier(_req: Request, res: Response) {
  const verifier = Keypair.fromSecretKey(env.CODE_VERFIER_SECRET);

  const serviceResponse = ServiceResponse.success(
    "Successfully fetched verifier",
    {
      data: verifier.getPublicKey().toBase58(),
    },
  );

  return handleServiceResponse(serviceResponse, res);
}

export async function createLoginIntent(_req: Request, res: Response) {
  const verifier = Keypair.fromSecretKey(env.CODE_VERFIER_SECRET);

  const { clientSecret, id } = await loginIntents.create({
    mode: "login",
    login: {
      verifier: verifier.getPublicKey().toBase58(),

      // Cannot be localhost or a subdomain. It must be a domain that you own
      // and have access to. Code will verify that this domain is owned by you
      // by looking for the .well-known/code-payments.json file.
      domain: env.DOMAIN,
    },

    signers: [verifier],
    // webhook: {
    //   url: `https://devapi.kinquest.app/code-login/verify-login`,
    // },
  });

  await CodeLogin.insert({
    intent_id: id,
  });

  console.log(new Date().toLocaleTimeString(), "Created intent", id);

  // The clientSecret value needs to be sent to the browser so that the browser
  // can use it to setup a login with this intent instance. The client will
  // use the login details along with this value to derive the same login
  // intent id on its end.
  const serviceResponse = ServiceResponse.success("Login intent created", {
    data: clientSecret,
  });

  return handleServiceResponse(serviceResponse, res);
}

export async function verifyLogin(req: Request, res: Response) {
  const intent = req.params.id;
  const verifier = Keypair.fromSecretKey(env.CODE_VERFIER_SECRET);

  const codeUser = await getUserId({ intent, verifier });
  if (codeUser.userId === undefined) {
    console.error("Code login failed: codeUser is undefined");
    const serviceResponse = ServiceResponse.failure(
      "Code login failed",
      null,
      StatusCodes.UNAUTHORIZED,
    );
    return handleServiceResponse(serviceResponse, res);
  }

  const isValid = await CodeLogin.isIntentValid(intent);
  if (!isValid) {
    console.error("Code login failed: intent is invalid");
    const serviceResponse = ServiceResponse.failure(
      "Code login failed",
      null,
      StatusCodes.UNAUTHORIZED,
    );
    return handleServiceResponse(serviceResponse, res);
  }

  const user = await User.getCodeLoginUser(codeUser.userId);

  const alg = "EdDSA";
  const expiresAt = Date.now() + env.JWT_EXPIRATION_TIME;
  const privateKey = await importPKCS8(env.JWT_PRIVATE_KEY, alg);
  const jwt = await new SignJWT({
    userId: user.id,
  })
    .setProtectedHeader({ alg })
    .setIssuedAt()
    .setExpirationTime(expiresAt / 1000)
    .sign(privateKey);

  const serviceResponse = ServiceResponse.success<CodeLoginResponse>(
    "Code login successful",
    {
      data: {
        jwt,
        userId: user.id,
        expiresAt,
      },
    },
  );
  return handleServiceResponse(serviceResponse, res);
}
