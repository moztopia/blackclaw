import { games } from "../../../content/project";

export function CoverageSection() {
  return (
    <section className="section coverage-section" id="coverage">
      <div className="section-heading split-heading">
        <div><p className="eyebrow">Namespace coverage</p><h2>One architecture.<br />Four worlds.</h2></div>
        <p>Start with typed EverQuest II resources or use the generic collection layer across every supported game.</p>
      </div>
      <div className="game-grid">
        {games.map((game, index) => (
          <a className={`game-card game-card--${game.tone}`} href={game.path} key={game.path}>
            <span className="game-card-top"><small>0{index + 1}</small><i>{game.status}</i></span>
            <span className="game-monogram">{game.short}</span>
            <strong>{game.name}</strong><p>{game.description}</p>
            <span className="text-link">Explore namespace <b>→</b></span>
          </a>
        ))}
      </div>
    </section>
  );
}
