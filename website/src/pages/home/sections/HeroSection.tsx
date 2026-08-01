import { EndpointDemo } from "../../../components/api/EndpointDemo";

export function HeroSection() {
  return (
    <section className="hero">
      <div className="hero-copy">
        <p className="eyebrow"><span /> Open-source Census infrastructure</p>
        <h1>Game data, without the <em>archaeology.</em></h1>
        <p className="hero-intro">A modern API, complete OpenAPI contract, and generated clients for the Darkpaw Games Census ecosystem.</p>
        <div className="hero-actions">
          <a className="button button--primary" href="/eq2/">Explore the API <span>→</span></a>
          <a className="button button--secondary" href="https://github.com/mozrin/blackclaw">
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 .7a11.5 11.5 0 0 0-3.64 22.4c.58.1.79-.25.79-.56v-2.23c-3.22.7-3.9-1.37-3.9-1.37-.52-1.34-1.28-1.7-1.28-1.7-1.05-.71.08-.7.08-.7 1.16.08 1.77 1.19 1.77 1.19 1.03 1.77 2.7 1.26 3.36.96.1-.75.4-1.26.73-1.55-2.57-.29-5.27-1.28-5.27-5.69 0-1.26.45-2.28 1.19-3.09-.12-.29-.52-1.46.11-3.05 0 0 .97-.31 3.16 1.18a11 11 0 0 1 5.75 0C15.03 4.4 16 4.71 16 4.71c.63 1.59.23 2.76.11 3.05.74.81 1.19 1.83 1.19 3.09 0 4.42-2.71 5.39-5.29 5.68.42.36.79 1.06.79 2.14v3.17c0 .31.21.67.8.56A11.5 11.5 0 0 0 12 .7Z" /></svg>
            View on GitHub
          </a>
        </div>
        <div className="hero-proof" aria-label="Project facts">
          <span><strong>v0.2.0</strong> contract</span>
          <span><strong>3</strong> client families</span>
          <span><strong>0</strong> auth keys needed</span>
        </div>
      </div>
      <div className="hero-visual">
        <div className="orbit orbit--one" /><div className="orbit orbit--two" />
        <span className="float-label float-label--schema">OpenAPI 3.1</span>
        <span className="float-label float-label--typed">Type-safe</span>
        <EndpointDemo />
      </div>
    </section>
  );
}
