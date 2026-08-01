import {
  Configuration,
  SystemApi,
  type StatusResponse,
} from "@app/api-client";

export type ApiStatus = Pick<StatusResponse, "status" | "service" | "timestamp">;

export interface StatusApi {
  getStatus(): Promise<ApiStatus>;
}

function normalizeBaseUrl(baseUrl: string): string {
  return baseUrl.trim().replace(/\/$/, "");
}

export function createStatusApi(
  baseUrl = import.meta.env.VITE_API_BASE_URL ?? "",
): StatusApi {
  const client = new SystemApi(
    new Configuration({ basePath: normalizeBaseUrl(baseUrl) }),
  );

  return {
    getStatus: () => client.getStatus(),
  };
}

export const statusApi = createStatusApi();
