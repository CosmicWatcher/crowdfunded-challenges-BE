import { z } from "zod";

export const commonValidations = {
  id: z.string().uuid({ message: "Invalid ID" }),
  page: z
    .string()
    .refine(
      (data) => !Number.isNaN(Number(data)),
      "page must be a numeric value",
    )
    .transform(Number)
    .refine((num) => num > 0, "page must be a positive number"),
};
