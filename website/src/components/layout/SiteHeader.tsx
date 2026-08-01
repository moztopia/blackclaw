import { ClawMark } from "../branding/ClawMark";

export function SiteHeader({ onUpdates }: { onUpdates: () => void }) {
  return (
    <header className="site-header">
      <a className="brand" href="/" aria-label="Darkclaw home">
        <span className="brand-mark"><ClawMark /></span>
        <span>darkclaw</span>
      </a>
      <nav aria-label="Main navigation">
        <a href="/#why">Why Darkclaw</a>
        <a href="/#coverage">Coverage</a>
        <a href="/#clients">Clients</a>
        <a href="https://github.com/mozrin/blackclaw">GitHub</a>
      </nav>
      <button className="header-action" type="button" onClick={onUpdates}>
        Follow the build <span aria-hidden="true">↗</span>
      </button>
    </header>
  );
}
