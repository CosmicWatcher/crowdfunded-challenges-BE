import express, { Router } from "express";
import { z } from "zod";

import {
  getSolutionVoteDetails,
  recordSolutionVote,
} from "@/api/solutionVotes/solutionVotes.controller";
import {
  commonValidations,
  validateRequest,
  validateUser,
} from "@/common/middleware/validators";

export const solutionVotesRouter: Router = express.Router();

const getSolutionVoteDetailsSchema = z.object({
  params: z.object({ id: commonValidations.id }),
});

const recordSolutionVoteSchema = z.object({
  body: z.object({
    solutionId: commonValidations.id,
    amount: z.number().min(1, "Minimum vote is 1"),
  }),
});

solutionVotesRouter.get(
  "/details/:id",
  validateRequest(getSolutionVoteDetailsSchema),
  validateUser(),
  getSolutionVoteDetails,
);
solutionVotesRouter.post(
  "/record",
  validateRequest(recordSolutionVoteSchema),
  validateUser(),
  recordSolutionVote,
);
