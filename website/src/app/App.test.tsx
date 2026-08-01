import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { afterEach, describe, expect, it, vi } from "vitest";
import App from "./App";

describe("Darkclaw application", () => {
  afterEach(() => {
    vi.restoreAllMocks();
    window.history.replaceState({}, "", "/");
  });

  it("presents the Census project and unofficial status", () => {
    render(<App />);
    expect(screen.getByRole("heading", { name: /game data, without the archaeology/i })).toBeInTheDocument();
    expect(screen.getByText(/not affiliated with or endorsed/i)).toBeInTheDocument();
    expect(screen.getByText(/v0\.2\.0/i)).toBeInTheDocument();
  });

  it("links every supported game documentation route", () => {
    render(<App />);
    for (const route of ["/eq2/", "/ps2/", "/dcuo/", "/mtgo/"]) {
      expect(document.querySelector(`a[href="${route}"]`)).not.toBeNull();
    }
  });

  it("switches between generated client examples", async () => {
    const user = userEvent.setup();
    render(<App />);
    await user.click(screen.getByRole("tab", { name: "Python" }));
    expect(screen.getByText(/pip install darkclaw-census-api-client/i)).toBeInTheDocument();
  });

  it("submits project update signups to the website API", async () => {
    const user = userEvent.setup();
    const fetchMock = vi.spyOn(globalThis, "fetch").mockResolvedValue(
      new Response(JSON.stringify({ message: "You're on the list!" }), {
        status: 201,
        headers: { "Content-Type": "application/json" },
      }),
    );

    render(<App />);
    await user.click(screen.getByRole("button", { name: /follow the build/i }));
    await user.type(screen.getByLabelText("Name"), "Alyssa");
    await user.type(screen.getByLabelText("Email"), "alyssa@example.com");
    await user.selectOptions(screen.getByLabelText(/most interested/i), "using-the-api");
    await user.click(screen.getByRole("button", { name: /keep me posted/i }));

    expect(await screen.findByRole("heading", { name: /you’re in the loop/i })).toBeInTheDocument();
    expect(fetchMock).toHaveBeenCalledWith("/api/v1/waitlist", expect.objectContaining({
      method: "POST",
      body: JSON.stringify({
        name: "Alyssa",
        email: "alyssa@example.com",
        what_for: "using-the-api",
      }),
    }));
  });

  it("renders a namespace-specific page from the route", () => {
    window.history.replaceState({}, "", "/ps2/");
    render(<App />);
    expect(screen.getByRole("heading", { name: /planetside 2 data, clarified/i })).toBeInTheDocument();
    expect(screen.getAllByText(/generic access/i).length).toBeGreaterThan(0);
  });
});
