import { games } from "../../content/project";
import { ClawMark } from "../branding/ClawMark";

export function SiteFooter({ onUpdates }: { onUpdates: () => void }) {
  return (
    <footer className="site-footer">
      <div className="footer-main">
        <a className="brand brand--footer" href="/"><span className="brand-mark"><ClawMark /></span><span>darkclaw</span></a>
        <p>Modern, open infrastructure for the<br />Darkpaw Games Census API.</p>
      </div>
      <div className="footer-links">
        <div><strong>Explore</strong><a href="/#why">Why Darkclaw</a><a href="/#coverage">Coverage</a><a href="/#clients">Clients</a></div>
        <div><strong>Project</strong><a href="https://github.com/mozrin/blackclaw">GitHub</a><a href="https://github.com/mozrin/blackclaw#contributing">Contribute</a><button type="button" onClick={onUpdates}>Updates</button></div>
        <div><strong>Namespaces</strong>{games.map((game) => <a href={game.path} key={game.path}>{game.short}</a>)}</div>
      </div>
      <div className="footer-bottom">
        <span>© 2026 Darkclaw · Open source</span>
        <span>Unofficial. Not affiliated with or endorsed by Darkpaw Games.</span>
      </div>
    </footer>
  );
}
