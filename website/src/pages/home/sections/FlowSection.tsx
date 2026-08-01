export function FlowSection() {
  return (
    <section className="section flow-section">
      <p className="eyebrow">Designed for confidence</p>
      <h2>From volatile upstream data<br />to a stable developer experience.</h2>
      <div className="flow-diagram" aria-label="Darkclaw contract workflow">
        <article><small>01</small><strong>Observe</strong><p>Capture repeatable upstream snapshots.</p></article><span aria-hidden="true">→</span>
        <article><small>02</small><strong>Curate</strong><p>Review behavior into the contract.</p></article><span aria-hidden="true">→</span>
        <article><small>03</small><strong>Generate</strong><p>Rebuild every client from scratch.</p></article><span aria-hidden="true">→</span>
        <article><small>04</small><strong>Ship</strong><p>Build against a consistent API.</p></article>
      </div>
    </section>
  );
}
