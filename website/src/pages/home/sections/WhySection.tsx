import { ClawMark } from "../../../components/branding/ClawMark";

export function WhySection() {
  return (
    <section className="section why-section" id="why">
      <div className="section-heading split-heading">
        <div><p className="eyebrow">Less reverse-engineering</p><h2>Census is powerful.<br />Its edges are sharp.</h2></div>
        <p>Darkclaw turns a capable but idiosyncratic upstream service into infrastructure you can confidently ship against.</p>
      </div>
      <div className="bento-grid">
        <article className="bento-card bento-card--contract">
          <span className="card-index">01 / Contract</span>
          <div className="schema-art" aria-hidden="true">
            <span>GET</span><code>/characters/{"{id}"}</code><i>200</i>
            <span>GET</span><code>/collections</code><i>200</i>
            <span>GET</span><code>/records/{"{id}"}</code><i>200</i>
          </div>
          <h3>One source of truth</h3>
          <p>A canonical OpenAPI contract keeps servers, docs, and every generated client speaking the same language.</p>
        </article>
        <article className="bento-card bento-card--snapshots">
          <span className="card-index">02 / Evidence</span>
          <div className="snapshot-art" aria-hidden="true">
            {[84, 52, 73, 38, 66, 91, 58, 76, 45, 86, 62, 95].map((height, index) => <i key={index} style={{ height: `${height}%` }} />)}
          </div>
          <h3>Observed, then reviewed</h3>
          <p>Repeatable snapshots expose upstream drift. Samples inform the schema; they never silently rewrite it.</p>
        </article>
        <article className="bento-card bento-card--proxy">
          <span className="card-index">03 / Interface</span>
          <div className="route-art" aria-hidden="true"><span>Census</span><i>→</i><strong><ClawMark /></strong><i>→</i><span>Your app</span></div>
          <h3>A clean front door</h3>
          <p>The proxy owns service IDs, legacy query syntax, normalization, pagination, and predictable errors.</p>
        </article>
      </div>
    </section>
  );
}
