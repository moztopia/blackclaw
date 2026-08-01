# Website

The public React/TypeScript experience for the monorepo scaffold. This scaffold contains a
small landing page plus a live API health card. Registration, account, and
billing flows can be layered onto it as those product decisions are made.

## Requirements

- Node.js 22.12 or newer
- npm
- The generated `@monorepo/api-client` package in
  `../packages/api-client-typescript`

From this directory:

```bash
npm install
npm run dev
```

Vite listens on port `3000`. During local Compose development it proxies
requests beginning with `/api` to `http://api:8000`, so no browser CORS setup is
needed for `GET /api/v1/status`.

For development outside Compose, copy `.env.example` to `.env.local` and point
the website at a reachable API origin:

```dotenv
VITE_API_BASE_URL=http://localhost:8000
```

Do not set `VITE_API_BASE_URL` in the standard Compose workflow: an empty value
keeps requests same-origin so the Vite proxy handles them.

## Commands

```bash
npm run dev          # Vite development server
npm run typecheck    # strict TypeScript check
npm test             # Vitest + Testing Library test suite
npm run test:watch   # tests in watch mode
npm run build        # typecheck and create dist/
npm run preview      # inspect the static production build locally
```

Vite is a development/build tool only. The production container should serve
the generated `dist/` directory with its configured static web server.

## API boundary

`src/api/statusApi.ts` is the only generated-client adapter in this initial
slice. UI components depend on its small `StatusApi` interface, which keeps
tests fast and localizes any changes caused by regenerating the OpenAPI client.
