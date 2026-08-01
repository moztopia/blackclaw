export type ProjectUpdatesPayload = {
  name: string;
  email: string;
  what_for: string;
};

type ValidationError = {
  message?: string;
  errors?: Record<string, string[]>;
};

export async function submitProjectUpdates(payload: ProjectUpdatesPayload) {
  const response = await fetch("/api/v1/waitlist", {
    method: "POST",
    headers: { "Content-Type": "application/json", Accept: "application/json" },
    body: JSON.stringify(payload),
  });

  if (response.ok) return;

  const error = await response.json().catch(() => null) as ValidationError | null;
  const validationMessage = error?.errors
    ? Object.values(error.errors).flat().at(0)
    : null;

  throw new Error(validationMessage ?? error?.message ?? "Unable to sign up right now.");
}
