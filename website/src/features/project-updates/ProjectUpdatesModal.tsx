import { useCallback, useEffect, useRef, useState } from "react";
import { ClawMark } from "../../components/branding/ClawMark";
import { submitProjectUpdates } from "./api";

interface ProjectUpdatesModalProps {
  open: boolean;
  onClose: () => void;
}

type Phase = "form" | "submitting" | "success" | "error";

export function ProjectUpdatesModal({ open, onClose }: ProjectUpdatesModalProps) {
  const backdropRef = useRef<HTMLDivElement>(null);
  const nameRef = useRef<HTMLInputElement>(null);
  const [phase, setPhase] = useState<Phase>("form");
  const [errorMsg, setErrorMsg] = useState("");

  const handleClose = useCallback(() => {
    setPhase("form");
    setErrorMsg("");
    onClose();
  }, [onClose]);

  useEffect(() => {
    if (!open) return;

    const previousOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    nameRef.current?.focus();

    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.key === "Escape") handleClose();
    };
    window.addEventListener("keydown", handleKeyDown);

    return () => {
      document.body.style.overflow = previousOverflow;
      window.removeEventListener("keydown", handleKeyDown);
    };
  }, [handleClose, open]);

  const handleBackdrop = useCallback((event: React.MouseEvent) => {
    if (event.target === backdropRef.current) handleClose();
  }, [handleClose]);

  const handleSubmit = useCallback(async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setErrorMsg("");
    setPhase("submitting");

    const data = new FormData(event.currentTarget);
    const body = {
      name: String(data.get("name") ?? ""),
      email: String(data.get("email") ?? ""),
      what_for: String(data.get("what_for") ?? "project-updates"),
    };

    try {
      await submitProjectUpdates(body);
      setPhase("success");
    } catch (error) {
      setErrorMsg(error instanceof Error ? error.message : "Unable to sign up right now.");
      setPhase("error");
    }
  }, []);

  if (!open) return null;

  const mark = (
    <span className="brand-mark" aria-hidden="true">
      <ClawMark />
    </span>
  );

  return (
    <div className="modal-backdrop" onMouseDown={handleBackdrop} ref={backdropRef}>
      <div className="modal-card" role="dialog" aria-modal="true" aria-labelledby="updates-title">
        <button className="modal-close" type="button" onClick={handleClose} aria-label="Close updates signup">×</button>

        {phase === "success" ? (
          <div className="modal-success">
            {mark}
            <h2 id="updates-title">You’re in the loop.</h2>
            <p>We’ll send the meaningful updates: new coverage, client releases, and major milestones.</p>
            <button className="button button--light" type="button" onClick={handleClose}>Back to Darkclaw</button>
          </div>
        ) : (
          <>
            <div className="modal-header">
              {mark}
              <p className="eyebrow">Follow the build</p>
              <h2 id="updates-title">Get project updates.</h2>
              <p>No noise. Just releases, new coverage, and the road to v1.</p>
            </div>
            <form className="waitlist-form" onSubmit={handleSubmit}>
              <div className="form-field">
                <label htmlFor="updates-name">Name</label>
                <input ref={nameRef} id="updates-name" name="name" type="text" required autoComplete="name" placeholder="How should we address you?" />
              </div>
              <div className="form-field">
                <label htmlFor="updates-email">Email</label>
                <input id="updates-email" name="email" type="email" required autoComplete="email" placeholder="you@example.com" />
              </div>
              <div className="form-field">
                <label htmlFor="updates-interest">I’m most interested in</label>
                <select id="updates-interest" name="what_for" defaultValue="project-updates">
                  <option value="project-updates">Project and release updates</option>
                  <option value="using-the-api">Using the API</option>
                  <option value="contributing">Contributing to Darkclaw</option>
                  <option value="client-releases">Generated client releases</option>
                </select>
              </div>
              {phase === "error" && <p className="form-error" role="alert">{errorMsg}</p>}
              <button className="button button--light button--full" type="submit" disabled={phase === "submitting"}>
                {phase === "submitting" ? "Signing you up…" : "Keep me posted →"}
              </button>
            </form>
          </>
        )}
      </div>
    </div>
  );
}
