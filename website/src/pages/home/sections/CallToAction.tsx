import { ClawMark } from "../../../components/branding/ClawMark";

export function CallToAction({ onUpdates }: { onUpdates: () => void }) {
  return (
    <section className="cta-section">
      <div className="cta-mark"><ClawMark /></div>
      <p className="eyebrow">The work is just beginning</p>
      <h2>Help make game data<br />better to build with.</h2>
      <p>Follow typed coverage, new client releases, and the road to v1.</p>
      <div className="hero-actions">
        <button className="button button--light" type="button" onClick={onUpdates}>Get project updates <span>→</span></button>
        <a className="button button--ghost" href="https://github.com/mozrin/blackclaw">Contribute on GitHub</a>
      </div>
    </section>
  );
}
