import { useEffect, useState } from "react";
import type { StatusApi } from "./api/statusApi";
import { SystemStatus } from "./components/SystemStatus";
import { WaitlistModal } from "./components/WaitlistModal";

interface AppProps {
  statusApi: StatusApi;
}

export default function App({ statusApi }: AppProps) {
  const [showWaitlist, setShowWaitlist] = useState(false);
  const [waitlistCount, setWaitlistCount] = useState<number | null>(null);

  useEffect(() => {
    fetch("/api/v1/waitlist/count")
      .then((r) => (r.ok ? r.json() : Promise.reject()))
      .then((d) => setWaitlistCount(d.count ?? null))
      .catch(() => {});
  }, [showWaitlist]);

  return (
    <>
      <div className="site-shell">
        <header className="site-header">
          <a className="brand" href="#top" aria-label="Home">
            <span className="brand-mark" aria-hidden="true">
              🚀
            </span>
            <span>scaffold</span>
          </a>
          <nav aria-label="Primary navigation">
            <a href="#what-you-get">Features</a>
            <a href="#privacy">Privacy First</a>
            <a href="#status">Status</a>
          </nav>
          <button
            className="header-action"
            type="button"
            onClick={() => setShowWaitlist(true)}
          >
            Get started
          </button>
        </header>

        <main id="top">
          <section className="hero" aria-labelledby="hero-title">
            <div className="hero-copy">
              <p className="eyebrow">Your Project, Your Way</p>
              <h1 id="hero-title">
                Build something amazing with this scaffold.
              </h1>
              <p className="hero-intro">
                This is your starting point. A contract-first monorepo with
                Flutter, Laravel, React, and OpenAPI — all wired together and
                ready for development. Replace this copy with your product
                vision.
              </p>
              <div className="hero-actions" id="get-started">
                <button
                  className="button button--primary"
                  type="button"
                  onClick={() => setShowWaitlist(true)}
                >
                  Join the early list
                </button>
                <a className="button button--secondary" href="#what-you-get">
                  Explore Features
                </a>
              </div>
            </div>

            <div className="hero-visual" aria-label="App preview">
              <div className="visual-glow" aria-hidden="true" />
              <div className="phone-card">
                <div className="phone-notch" aria-hidden="true" />
                <div className="profile-photo" aria-hidden="true">
                  <span className="profile-emoji">🚀</span>
                </div>
                {waitlistCount !== null && (
                  <div className="interest-counter">
                    <span className="interest-dot" aria-hidden="true" />
                    <strong>{waitlistCount.toLocaleString()}</strong> people
                    waiting
                  </div>
                )}
                <div className="profile-info">
                  <strong>Your App at a Glance</strong>
                  <div className="profile-tags">
                    <span className="tag tag--blue">📋 Feature One</span>
                    <span className="tag tag--amber">📊 Feature Two</span>
                    <span className="tag tag--lavender">🔧 Feature Three</span>
                    <span className="tag tag--sky">🤝 Feature Four</span>
                    <span className="tag tag--green">📦 Feature Five</span>
                    <span className="tag tag--teal">🔒 Feature Six</span>
                    <span className="tag tag--lavender">✨ Feature Seven</span>
                  </div>
                </div>
                <div className="compass-bar" aria-hidden="true">
                  <span className="compass-btn compass-btn--explore">🧭</span>
                  <span className="compass-btn compass-btn--go">✈️</span>
                </div>
              </div>
            </div>
          </section>

          <section
            className="features-section"
            id="what-you-get"
            aria-labelledby="features-title"
          >
            <div className="section-heading">
              <div>
                <p className="eyebrow">What you get</p>
                <h2 id="features-title">Everything you need to ship fast</h2>
              </div>
            </div>
            <div className="feature-grid">
              <article>
                <span className="feature-icon">📱</span>
                <h3>Flutter Mobile App</h3>
                <p>
                  A ready-to-run Flutter application wired to the API through
                  generated OpenAPI clients.
                </p>
              </article>
              <article>
                <span className="feature-icon">⚡</span>
                <h3>Laravel JSON API</h3>
                <p>
                  A contract-first Laravel API with MariaDB, Redis, and a
                  health-check endpoint out of the box.
                </p>
              </article>
              <article>
                <span className="feature-icon">🌐</span>
                <h3>React Website</h3>
                <p>
                  A Vite-powered React + TypeScript website with testing,
                  proxied API access, and production builds.
                </p>
              </article>
              <article>
                <span className="feature-icon">📄</span>
                <h3>OpenAPI Contracts</h3>
                <p>
                  Change the contract, regenerate clients. Dart and TypeScript
                  clients are always in sync with the API.
                </p>
              </article>
              <article>
                <span className="feature-icon">🐳</span>
                <h3>Docker Infrastructure</h3>
                <p>
                  Multi-service Docker Compose with MariaDB, Redis, nginx proxy,
                  and Cloudflare tunnel support.
                </p>
              </article>
              <article>
                <span className="feature-icon">🔄</span>
                <h3>One-Command Setup</h3>
                <p>
                  Run <code>make setup</code> and everything installs, builds,
                  migrates, and starts automatically.
                </p>
              </article>
              <article>
                <span className="feature-icon">✅</span>
                <h3>Testing Included</h3>
                <p>
                  PEST for Laravel, Vitest for React, and Flutter test — all
                  wired up and ready to extend.
                </p>
              </article>
            </div>
          </section>

          <section
            className="values-section"
            id="privacy"
            aria-labelledby="values-title"
          >
            <div>
              <p className="eyebrow">Built Right</p>
              <h2 id="values-title">Principles baked into the scaffold.</h2>
            </div>
            <div className="values-grid">
              <div className="value-card">
                <span className="value-icon">📝</span>
                <h3>Contract First</h3>
                <p>
                  The OpenAPI spec is the single source of truth. Change the
                  contract, then implement — never the other way around.
                </p>
              </div>
              <div className="value-card">
                <span className="value-icon">🔒</span>
                <h3>Secrets Safe</h3>
                <p>
                  Environment variables and .env.example templates keep
                  credentials out of git history by design.
                </p>
              </div>
              <div className="value-card">
                <span className="value-icon">🧩</span>
                <h3>Modular Layout</h3>
                <p>
                  Four clean working areas — api, app, website, packages — each
                  with its own README and tooling.
                </p>
              </div>
              <div className="value-card">
                <span className="value-icon">🚀</span>
                <h3>Production Ready</h3>
                <p>
                  Multi-stage Docker builds, nginx reverse proxy, and Cloudflare
                  tunnel wiring for real deployments.
                </p>
              </div>
            </div>
          </section>

          <section
            className="promise-section"
            id="promise"
            aria-labelledby="promise-title"
          >
            <div className="promise-glow" aria-hidden="true" />
            <p className="eyebrow">The promise</p>
            <h2 id="promise-title">Ship faster, build better.</h2>
            <p className="promise-body">
              Join the waitlist to be among the first to know when new features
              and updates land.
            </p>
            <button
              className="button button--primary button--large"
              type="button"
              onClick={() => setShowWaitlist(true)}
            >
              Join the early list
            </button>
          </section>

          <div id="status">
            <SystemStatus api={statusApi} />
          </div>
        </main>

        <footer className="site-footer">
          <a className="brand" href="#top">
            <span className="brand-mark" aria-hidden="true">
              🚀
            </span>
            <span>scaffold</span>
          </a>
          <p>Built with the scaffold template.</p>
          <small>© {new Date().getFullYear()} Your Project</small>
        </footer>
      </div>

      <WaitlistModal
        open={showWaitlist}
        onClose={() => setShowWaitlist(false)}
      />
    </>
  );
}
