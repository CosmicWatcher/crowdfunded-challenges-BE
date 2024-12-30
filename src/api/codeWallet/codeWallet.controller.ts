import { getStatus, getUserId, loginIntents } from "@code-wallet/client";
import { Keypair } from "@code-wallet/keys";
import { type Request, type Response } from "express";

import { env } from "@/common/configs/env";
import { ServiceResponse } from "@/common/models/serviceResponse";
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
    //   url: "https://example.com/webhook",
    // },
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

  const status = await getStatus({ intent });
  const user = await getUserId({ intent, verifier });

  console.log(
    new Date().toLocaleTimeString(),
    "status: ",
    status,
    "user: ",
    user,
  );

  const serviceResponse = ServiceResponse.success("Login successful", null);
  return handleServiceResponse(serviceResponse, res);
}
