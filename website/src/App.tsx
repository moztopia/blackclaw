const games = [
  { path: "/eq2/", short: "EQ2", name: "EverQuest II", status: "Typed coverage underway" },
  { path: "/ps2/", short: "PS2", name: "PlanetSide 2", status: "Generic Census access" },
  { path: "/dcuo/", short: "DCUO", name: "DC Universe Online", status: "Generic Census access" },
  { path: "/mtgo/", short: "MTGO", name: "Magic: The Gathering Online", status: "Generic Census access" },
] as const;

function currentGame(pathname: string) {
  return games.find((game) => pathname.startsWith(game.path));
}

export default function App() {
  const selected = currentGame(window.location.pathname);

  return (
    <div className="site-shell">
      <header className="site-header">
        <a className="brand" href="/">Darkclaw</a>
        <nav aria-label="Game documentation">
          {games.map((game) => <a key={game.path} href={game.path}>{game.short}</a>)}
        </nav>
      </header>

      <main>
        <section className="hero">
          <p className="eyebrow">Unofficial Census API project</p>
          <h1>{selected ? selected.name : "One contract for the Darkpaw Games Census API"}</h1>
          <p className="hero-copy">
            {selected
              ? `${selected.status}. Darkclaw keeps generic operations available while typed models are added from repeatable upstream snapshots.`
              : "A complete OpenAPI specification, human documentation, and generated clients across the languages developers use."}
          </p>
          <div className="hero-actions">
            <a className="button button-primary" href={selected ? "#operations" : "/eq2/"}>Explore the API</a>
            <a className="button button-secondary" href="https://census.daybreakgames.com">Upstream Census</a>
          </div>
        </section>

        <section className="feature-grid" aria-label="Project principles">
          <article className="feature-card">
            <p className="feature-number">01</p>
            <h2>One shared contract</h2>
            <p>Every supported game and generic collection query lives in one canonical OpenAPI document.</p>
          </article>
          <article className="feature-card">
            <p className="feature-number">02</p>
            <h2>Observed, then reviewed</h2>
            <p>Repeatable snapshots reveal upstream collection and schema drift without treating samples as truth.</p>
          </article>
          <article className="feature-card">
            <p className="feature-number">03</p>
            <h2>Generated everywhere</h2>
            <p>Client packages retain their exact OpenAPI Generator identity and are tested before release.</p>
          </article>
        </section>

        <section id="operations" className="games-section">
          <p className="eyebrow">Namespaces</p>
          <h2>Games covered by the shared Census architecture</h2>
          <div className="game-grid">
            {games.map((game) => (
              <a className="game-card" href={game.path} key={game.path}>
                <span>{game.short}</span>
                <strong>{game.name}</strong>
                <small>{game.status}</small>
              </a>
            ))}
          </div>
        </section>
      </main>

      <footer>
        <p>Darkclaw is not affiliated with or endorsed by Darkpaw Games.</p>
      </footer>
    </div>
  );
}
