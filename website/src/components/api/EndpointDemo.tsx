import { games, type Game } from "../../content/project";

export function EndpointDemo({ game = games[0] }: { game?: Game }) {
  const isEq2 = game.short === "EQ2";
  const endpoint = isEq2
    ? "/v1/games/eq2/characters?name=Zarenda"
    : `/v1/games/${game.short.toLowerCase()}/collections`;

  return (
    <div className="api-window" aria-label="Darkclaw API response example">
      <div className="window-bar">
        <span className="window-dots" aria-hidden="true"><i /><i /><i /></span>
        <span>api.darkclaw.mozrin.com</span>
        <span className="live-pill"><i /> live</span>
      </div>
      <div className="request-bar">
        <span>GET</span><code>{endpoint}</code><strong>200</strong>
      </div>
      <pre className="code-block"><code>{isEq2 ? <>
        <span className="syntax-muted">{"{"}</span>{"\n"}
        {"  "}<span className="syntax-key">"data"</span>: [{"{"}{"\n"}
        {"    "}<span className="syntax-key">"id"</span>: <span className="syntax-string">"463858770551"</span>,{"\n"}
        {"    "}<span className="syntax-key">"name"</span>: {"{"}{"\n"}
        {"      "}<span className="syntax-key">"first"</span>: <span className="syntax-string">"Zarenda"</span>{"\n"}
        {"    "}{"}"},{"\n"}
        {"    "}<span className="syntax-key">"profile"</span>: {"{"}{"\n"}
        {"      "}<span className="syntax-key">"className"</span>: <span className="syntax-string">"Wizard"</span>,{"\n"}
        {"      "}<span className="syntax-key">"level"</span>: <span className="syntax-number">125</span>{"\n"}
        {"    "}{"}"}{"\n"}
        {"  "}{"}"}],{"\n"}
        {"  "}<span className="syntax-key">"page"</span>: {"{"} <span className="syntax-key">"returned"</span>: <span className="syntax-number">1</span> {"}"}{"\n"}
        <span className="syntax-muted">{"}"}</span>
      </> : <>
        <span className="syntax-muted">{"{"}</span>{"\n"}
        {"  "}<span className="syntax-key">"data"</span>: [{"\n"}
        {"    "}{"{"} <span className="syntax-key">"name"</span>: <span className="syntax-string">"character"</span> {"}"},{"\n"}
        {"    "}{"{"} <span className="syntax-key">"name"</span>: <span className="syntax-string">"world"</span> {"}"},{"\n"}
        {"    "}{"{"} <span className="syntax-key">"name"</span>: <span className="syntax-string">"item"</span> {"}"}{"\n"}
        {"  "}],{"\n"}
        {"  "}<span className="syntax-key">"namespace"</span>: <span className="syntax-string">"{game.namespace}"</span>{"\n"}
        <span className="syntax-muted">{"}"}</span>
      </>}</code></pre>
      <div className="window-footer"><span>Normalized response</span><span>application/json</span></div>
    </div>
  );
}
