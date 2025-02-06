import { Resend } from "resend";

import { env } from "@/common/configs/env";

const resend = new Resend(env.RESEND_API_KEY);

async function sendEmail(
  to: string | string[],
  subject: string,
  html: string,
  attempts = 0,
) {
  if (attempts >= 3) {
    console.error(
      `[${new Date().toLocaleString()}] Failed to send email to ${to.toString()} after 3 attempts`,
    );
    return;
  }

  const { error } = await resend.emails.send({
    from: "KinQuest.app <admin@kinquest.app>",
    to,
    subject,
    html,
  });

  if (error) {
    console.error({ error });
    if (error.name === "rate_limit_exceeded") {
      await new Promise((resolve) =>
        setTimeout(resolve, 1000 + attempts * 2000),
      );
      await sendEmail(to, subject, html, attempts + 1);
    } else if (
      error.name === "application_error" ||
      error.name === "internal_server_error"
    ) {
      await new Promise((resolve) =>
        setTimeout(resolve, 60000 + attempts * 300000),
      );
      await sendEmail(to, subject, html, attempts + 1);
    }
  }
}

export async function sendTaskEndedEmail(
  taskId: string,
  taskCreatorEmail: string,
) {
  const html = `<h2>Choose the outcome of the KinQuest.app task you created</h2>
    <p>The task you created has reached its end date!</p>
    <p><strong>You have 24 hours to choose the outcome of the task or the funds will automatically be returned to the funders!</strong></p>
    <br>
    <p>Visit the task page <a href="${env.APP_URL}/tasks/${taskId}">here</a> and choose the outcome of the task.</p>
    <p>Choose <strong>Success</strong> to distribute the task funds to the top voted solutions</p>
    <p>Choose <strong>Fail</strong> to return the task funds back to the funders</p>
    <br>
    <p>Note: You have to be logged in with the same account you used to create the task</p>`;

  const subject = "Choose the Outcome of Your Task";

  await sendEmail(taskCreatorEmail, subject, html);
}
