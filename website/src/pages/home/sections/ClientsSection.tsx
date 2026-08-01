import { useState } from "react";
import { sdks, type Sdk } from "../../../content/project";

export function ClientsSection() {
  const [activeSdk, setActiveSdk] = useState<Sdk>("TypeScript");
  const sdk = sdks[activeSdk];

  return (
    <section className="section clients-section" id="clients">
      <div className="clients-copy">
        <p className="eyebrow eyebrow--light">Generated clients</p>
        <h2>Your language.<br />The same contract.</h2>
        <p>Move from endpoint discovery to typed application code without hand-maintaining request models.</p>
        <ul><li><span>✓</span> Generated directly from OpenAPI</li><li><span>✓</span> Built and tested before release</li><li><span>✓</span> Predictable models and errors</li></ul>
        <a href="https://github.com/mozrin/blackclaw/tree/main/packages">Browse generated packages <span>→</span></a>
      </div>
      <div className="sdk-window">
        <div className="sdk-tabs" role="tablist" aria-label="Client examples">
          {(Object.keys(sdks) as Sdk[]).map((name) => (
            <button type="button" role="tab" aria-selected={activeSdk === name} className={activeSdk === name ? "active" : ""} onClick={() => setActiveSdk(name)} key={name}>{name}</button>
          ))}
        </div>
        <div className="install-command"><span>$</span><code>{sdk.install}</code></div>
        <pre><code>{sdk.code.map((line, index) => <span className={line.startsWith("import") || line.startsWith("from") ? "code-accent" : ""} key={`${activeSdk}-${index}`}>{line || " "}{"\n"}</span>)}</code></pre>
      </div>
    </section>
  );
}
