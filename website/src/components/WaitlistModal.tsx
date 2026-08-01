import { useCallback, useRef, useState } from "react";

interface WaitlistModalProps {
  open: boolean;
  onClose: () => void;
}

const COUNTRY_CODES = [
  { code: "+1", label: "🇺🇸 +1" },
  { code: "+44", label: "🇬🇧 +44" },
  { code: "+61", label: "🇦🇺 +61" },
  { code: "+33", label: "🇫🇷 +33" },
  { code: "+49", label: "🇩🇪 +49" },
  { code: "+81", label: "🇯🇵 +81" },
  { code: "+82", label: "🇰🇷 +82" },
  { code: "+86", label: "🇨🇳 +86" },
  { code: "+91", label: "🇮🇳 +91" },
  { code: "+55", label: "🇧🇷 +55" },
  { code: "+52", label: "🇲🇽 +52" },
  { code: "+34", label: "🇪🇸 +34" },
  { code: "+39", label: "🇮🇹 +39" },
  { code: "+31", label: "🇳🇱 +31" },
  { code: "+46", label: "🇸🇪 +46" },
  { code: "+47", label: "🇳🇴 +47" },
  { code: "+48", label: "🇵🇱 +48" },
  { code: "+7", label: "🇷🇺 +7" },
  { code: "+90", label: "🇹🇷 +90" },
  { code: "+966", label: "🇸🇦 +966" },
  { code: "+971", label: "🇦🇪 +971" },
  { code: "+27", label: "🇿🇦 +27" },
  { code: "+234", label: "🇳🇬 +234" },
  { code: "+254", label: "🇰🇪 +254" },
  { code: "+63", label: "🇵🇭 +63" },
  { code: "+66", label: "🇹🇭 +66" },
  { code: "+62", label: "🇮🇩 +62" },
  { code: "+60", label: "🇲🇾 +60" },
  { code: "+65", label: "🇸🇬 +65" },
  { code: "+64", label: "🇳🇿 +64" },
  { code: "+353", label: "🇮🇪 +353" },
  { code: "+41", label: "🇨🇭 +41" },
  { code: "+43", label: "🇦🇹 +43" },
  { code: "+32", label: "🇧🇪 +32" },
  { code: "+351", label: "🇵🇹 +351" },
  { code: "+30", label: "🇬🇷 +30" },
];

type Phase = "form" | "submitting" | "success" | "error";

export function WaitlistModal({ open, onClose }: WaitlistModalProps) {
  const dialogRef = useRef<HTMLDialogElement>(null);
  const [phase, setPhase] = useState<Phase>("form");
  const [errorMsg, setErrorMsg] = useState("");

  const handleClose = useCallback(() => {
    setPhase("form");
    setErrorMsg("");
    onClose();
  }, [onClose]);

  const handleBackdrop = useCallback(
    (e: React.MouseEvent) => {
      if (e.target === dialogRef.current) handleClose();
    },
    [handleClose],
  );

  const handleSubmit = useCallback(
    async (e: React.FormEvent<HTMLFormElement>) => {
      e.preventDefault();
      setPhase("submitting");

      const form = e.currentTarget;
      const data = new FormData(form);

      const body: Record<string, string> = {
        name: data.get("name") as string,
        email: data.get("email") as string,
      };

      const countryCode = data.get("country_code") as string;
      const phone = data.get("phone") as string;
      if (countryCode && phone) {
        body.country_code = countryCode;
        body.phone = phone;
      }

      try {
        const res = await fetch("/api/v1/waitlist", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
          },
          body: JSON.stringify(body),
        });

        if (!res.ok) {
          const err = await res.json().catch(() => null);
          throw new Error(err?.message ?? "Something went wrong");
        }

        setPhase("success");
      } catch (err) {
        setErrorMsg(err instanceof Error ? err.message : "Something went wrong");
        setPhase("error");
      }
    },
    [],
  );

  if (!open) return null;

  return (
    <div className="modal-backdrop" onClick={handleBackdrop} ref={dialogRef as never}>
      <div className="modal-card" role="dialog" aria-modal="true" aria-labelledby="waitlist-title">
        <button className="modal-close" type="button" onClick={handleClose} aria-label="Close">
          ✕
        </button>

        {phase === "success" ? (
          <div className="modal-success">
            <span className="modal-success-icon" aria-hidden="true">🌍</span>
            <h2 id="waitlist-title">You're on the list!</h2>
            <p>We'll be in touch when we're ready. Thanks for believing in us.</p>
            <button className="button button--primary" type="button" onClick={handleClose}>
              Done
            </button>
          </div>
        ) : (
          <>
            <div className="modal-header">
              <span className="brand-mark" aria-hidden="true">🌍</span>
              <h2 id="waitlist-title">Join the early list</h2>
              <p>Be the first to know when we launch.</p>
            </div>

            <form className="waitlist-form" onSubmit={handleSubmit}>
              <div className="form-field">
                <label htmlFor="waitlist-name">Name</label>
                <input
                  id="waitlist-name"
                  name="name"
                  type="text"
                  required
                  autoComplete="name"
                  placeholder="Your name"
                />
              </div>

              <div className="form-field">
                <label htmlFor="waitlist-email">Email</label>
                <input
                  id="waitlist-email"
                  name="email"
                  type="email"
                  required
                  autoComplete="email"
                  placeholder="you@example.com"
                />
              </div>

              <div className="form-field">
                <label htmlFor="waitlist-phone">Phone <span className="optional">(optional)</span></label>
                <div className="phone-row">
                  <select id="waitlist-country-code" name="country_code" defaultValue="">
                    <option value="" disabled>
                      Code
                    </option>
                    {COUNTRY_CODES.map(({ code, label }) => (
                      <option key={code} value={code}>
                        {label}
                      </option>
                    ))}
                  </select>
                  <input
                    id="waitlist-phone"
                    name="phone"
                    type="tel"
                    autoComplete="tel"
                    placeholder="Phone number"
                  />
                </div>
              </div>

              {phase === "error" && (
                <p className="form-error" role="alert">{errorMsg}</p>
              )}

              <button
                className="button button--primary button--full"
                type="submit"
                disabled={phase === "submitting"}
              >
                {phase === "submitting" ? "Joining…" : "Join the list"}
              </button>
            </form>
          </>
        )}
      </div>
    </div>
  );
}
