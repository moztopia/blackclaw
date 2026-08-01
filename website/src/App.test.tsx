import { render, screen } from "@testing-library/react";
import { describe, expect, it } from "vitest";
import App from "./App";

describe("Darkclaw website", () => {
  it("presents the Census project and unofficial status", () => {
    render(<App />);
    expect(screen.getByRole("heading", { name: /one contract/i })).toBeInTheDocument();
    expect(screen.getByText(/not affiliated with or endorsed/i)).toBeInTheDocument();
  });

  it("links every planned game documentation route", () => {
    render(<App />);
    for (const route of ["/eq2/", "/ps2/", "/dcuo/", "/mtgo/"]) {
      expect(document.querySelector(`a[href="${route}"]`)).not.toBeNull();
    }
  });
});
