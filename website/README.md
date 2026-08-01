# Darkclaw website

The React/TypeScript documentation and project website published at
`https://darkclaw.mozrin.com`.

Its route structure is `/`, `/eq2/`, `/ps2/`, `/dcuo/`, and `/mtgo/`. The site documents
the upstream Census contract but does not treat that contract as its own backend API.
When Laravel website operations need a generated client, it will be named
`darkclaw-website-api-client-typescript-axios` and generated from the separate
`darkclaw-website.openapi.yaml` contract.

## Commands

```bash
npm install
npm run dev
npm run typecheck
npm test
npm run build
```

Vite listens on port 3000 and proxies `/api` to the Laravel `api` container during local
Compose development.
