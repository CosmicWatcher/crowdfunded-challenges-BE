import { FORM_LIMITS } from "@/common/configs/constants";
import { ServiceResponse } from "@/common/models/serviceResponse";
import { app } from "@/server";
import { StatusCodes } from "http-status-codes";
import request from "supertest";

describe("Task API Endpoints", () => {
  describe("POST /tasks/create", () => {
    it("should return invalid input", async () => {
      let payload = {
        kind: "wrong",
        title: "title",
        details: "description",
        maxWinners: FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MIN + 1,
      };
      await createTaskInvalidInput(payload);

      payload = {
        kind: "community",
        title: "ti",
        details: "description",
        maxWinners: FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MIN + 1,
      };
      await createTaskInvalidInput(payload);

      payload = {
        kind: "community",
        title: "this title is too lengthy".repeat(
          FORM_LIMITS.TASK_CREATION.TITLE.MAX / 25 + 1,
        ),
        details: "description",
        maxWinners: FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MIN + 1,
      };
      await createTaskInvalidInput(payload);

      payload = {
        kind: "community",
        title: "title",
        details: "description",
        maxWinners: FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MIN - 1,
      };
      await createTaskInvalidInput(payload);

      payload = {
        kind: "community",
        title: "title",
        details: "description",
        maxWinners: FORM_LIMITS.TASK_CREATION.MAX_WINNERS.MAX + 1,
      };
      await createTaskInvalidInput(payload);
    });
  });
});

async function createTaskInvalidInput(payload: object) {
  const response = await request(app)
    .post("/tasks/create")
    .send(payload)
    .set("Content-Type", "application/json")
    .set("Accept", "application/json");
  const responseBody = response.body as ServiceResponse<null>;
  console.warn(responseBody.message);
  // Assert
  expect(response.statusCode).toEqual(StatusCodes.BAD_REQUEST);
  expect(responseBody.success).toBeFalsy();
  expect(responseBody.message).toContain("Invalid input");
}
