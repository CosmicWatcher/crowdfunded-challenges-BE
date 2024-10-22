import { Response } from "express";
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
    next_page: currentPage === totalPages ? null : currentPage + 1,
  };
}
