import { EndpointDemo } from "../../components/api/EndpointDemo";
import type { Game } from "../../content/project";

export function GamePage({ game }: { game: Game }) {
  const isEq2 = game.short === "EQ2";
  const gameId = game.short.toLowerCase();

  return (
    <main>
      <section className={`game-hero game-hero--${game.tone}`}>
        <div className="breadcrumb"><a href="/">Darkclaw</a><span>/</span><span>{game.short}</span></div>
        <div className="game-hero-grid">
          <div>
            <p className="eyebrow">{game.status} · {game.namespace}</p>
            <h1 aria-label={`${game.name} data, clarified.`}>{game.name}<br /><em>data, clarified.</em></h1>
            <p className="hero-intro">{game.description} Darkclaw handles the Census-specific mechanics so your application does not have to.</p>
            <div className="hero-actions">
              <a className="button button--primary" href="#operations">View operations <span>↓</span></a>
              <a className="button button--secondary" href="https://github.com/mozrin/blackclaw/blob/main/packages/contracts/darkclaw.openapi.yaml">OpenAPI contract</a>
            </div>
          </div>
          <EndpointDemo game={game} />
        </div>
      </section>

      <section className="section operations-section" id="operations">
        <div className="section-heading split-heading">
          <div><p className="eyebrow">Available now</p><h2>{isEq2 ? "Typed where it matters.\nGeneric everywhere else." : "The whole namespace,\nthrough one interface."}</h2></div>
          <p>{isEq2 ? "Character resources get reviewed models today. The generic record layer keeps every other collection accessible while coverage grows." : "Discover collections first, then list or fetch records without learning the upstream Census URL dialect."}</p>
        </div>
        <div className="endpoint-list">
          {isEq2 && <>
            <article><span>GET</span><code>/v1/games/eq2/characters</code><p>Search characters</p><i>Typed</i></article>
            <article><span>GET</span><code>/v1/games/eq2/characters/{"{characterId}"}</code><p>Get a character</p><i>Typed</i></article>
          </>}
          <article><span>GET</span><code>/v1/games/{gameId}/collections</code><p>List collections</p><i>Generic</i></article>
          <article><span>GET</span><code>/v1/games/{gameId}/collections/{"{collectionId}"}/records</code><p>List records</p><i>Generic</i></article>
          <article><span>GET</span><code>/v1/games/{gameId}/collections/{"{collectionId}"}/records/{"{recordId}"}</code><p>Get a record</p><i>Generic</i></article>
        </div>
      </section>

      <section className="game-bottom-cta">
        <div><p className="eyebrow">Ready to make a request?</p><h2>No auth ceremony.<br />Just game data.</h2></div>
        <a className="button button--light" href="https://api.darkclaw.mozrin.com/v1/status">Check API status <span>↗</span></a>
      </section>
    </main>
  );
}
