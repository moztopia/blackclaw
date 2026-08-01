import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { describe, expect, it, vi } from "vitest";
import App from "./App";
import type { ApiStatus, StatusApi } from "./api/statusApi";

const healthyStatus: ApiStatus = {
  status: "ok",
  service: "api",
  timestamp: new Date("2026-07-12T08:30:00.000Z"),
};

function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((promiseResolve) => {
    resolve = promiseResolve;
  });

  return { promise, resolve };
}

describe("App", () => {
  it("shows a loading state while the API request is pending", () => {
    const request = deferred<ApiStatus>();
    const api: StatusApi = { getStatus: () => request.promise };

    render(<App statusApi={api} />);

    expect(screen.getByText("Checking the API…")).toBeInTheDocument();
  });

  it("shows the service response when the API is healthy", async () => {
    const api: StatusApi = { getStatus: vi.fn().mockResolvedValue(healthyStatus) };

    render(<App statusApi={api} />);

    expect(await screen.findByText("All systems are ok")).toBeInTheDocument();
    expect(screen.getByText(/api/)).toBeInTheDocument();
  });

  it("lets the visitor retry after a failed status request", async () => {
    const getStatus = vi
      .fn<StatusApi["getStatus"]>()
      .mockRejectedValueOnce(new Error("Unavailable"))
      .mockResolvedValueOnce(healthyStatus);
    const user = userEvent.setup();

    render(<App statusApi={{ getStatus }} />);

    expect(await screen.findByRole("alert")).toHaveTextContent(
      "We could not reach the API",
    );

    await user.click(screen.getByRole("button", { name: "Try again" }));

    expect(await screen.findByText("All systems are ok")).toBeInTheDocument();
    expect(getStatus).toHaveBeenCalledTimes(2);
  });
});
