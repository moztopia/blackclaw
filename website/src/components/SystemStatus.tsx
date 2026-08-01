import { useCallback, useEffect, useState } from "react";
import type { ApiStatus, StatusApi } from "../api/statusApi";

type StatusState =
  | { phase: "loading" }
  | { phase: "ready"; data: ApiStatus }
  | { phase: "error" };

interface SystemStatusProps {
  api: StatusApi;
}

const timestampFormatter = new Intl.DateTimeFormat(undefined, {
  dateStyle: "medium",
  timeStyle: "short",
});

export function SystemStatus({ api }: SystemStatusProps) {
  const [attempt, setAttempt] = useState(0);
  const [state, setState] = useState<StatusState>({ phase: "loading" });

  const retry = useCallback(() => {
    setState({ phase: "loading" });
    setAttempt((value) => value + 1);
  }, []);

  useEffect(() => {
    let active = true;

    api.getStatus().then(
      (data) => {
        if (active) setState({ phase: "ready", data });
      },
      () => {
        if (active) setState({ phase: "error" });
      },
    );

    return () => {
      active = false;
    };
  }, [api, attempt]);

  return (
    <section className="system-status" aria-labelledby="system-status-title">
      <div className="status-heading">
        <span className="eyebrow">Live connection</span>
        <h2 id="system-status-title">API status</h2>
      </div>

      {state.phase === "loading" && (
        <div className="status-message" role="status" aria-live="polite">
          <span className="status-dot status-dot--checking" aria-hidden="true" />
          <div>
            <strong>Checking the API…</strong>
            <p>Connecting to the API service.</p>
          </div>
        </div>
      )}

      {state.phase === "ready" && (
        <div className="status-message" role="status" aria-live="polite">
          <span className="status-dot status-dot--online" aria-hidden="true" />
          <div>
            <strong>All systems are {state.data.status}</strong>
            <p>
              {state.data.service} · Updated{" "}
              <time dateTime={state.data.timestamp.toISOString()}>
                {timestampFormatter.format(state.data.timestamp)}
              </time>
            </p>
          </div>
        </div>
      )}

      {state.phase === "error" && (
        <div className="status-message status-message--error" role="alert">
          <span className="status-dot status-dot--offline" aria-hidden="true" />
          <div>
            <strong>We could not reach the API</strong>
            <p>It may still be starting. Check the containers, then try again.</p>
            <button className="retry-button" type="button" onClick={retry}>
              Try again
            </button>
          </div>
        </div>
      )}
    </section>
  );
}
