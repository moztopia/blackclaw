export type Game = {
  path: string;
  short: string;
  name: string;
  namespace: string;
  status: string;
  description: string;
  tone: string;
};

export const games: readonly Game[] = [
  {
    path: "/eq2/",
    short: "EQ2",
    name: "EverQuest II",
    namespace: "eq2",
    status: "Typed + generic",
    description: "Typed character search and profiles, with the entire Census namespace still within reach.",
    tone: "ember",
  },
  {
    path: "/ps2/",
    short: "PS2",
    name: "PlanetSide 2",
    namespace: "ps2:v2",
    status: "Generic access",
    description: "Discover collections and query live records through a stable, normalized interface.",
    tone: "cyan",
  },
  {
    path: "/dcuo/",
    short: "DCUO",
    name: "DC Universe Online",
    namespace: "dcuo:v1",
    status: "Generic access",
    description: "Explore the upstream namespace without taking on its transport conventions.",
    tone: "violet",
  },
  {
    path: "/mtgo/",
    short: "MTGO",
    name: "Magic: The Gathering Online",
    namespace: "mtgo",
    status: "Generic access",
    description: "A consistent collection and record API for the MTGO Census data surface.",
    tone: "gold",
  },
] as const;

export const sdks = {
  TypeScript: {
    install: "npm i @darkclaw/census-api-client",
    code: [
      "import { EverQuestIICharactersApi } from",
      "  '@darkclaw/census-api-client';",
      "",
      "const api = new EverQuestIICharactersApi();",
      "const { data } = await api.listCharacters({",
      "  name: 'Zarenda',",
      "  pageSize: 10,",
      "});",
    ],
  },
  Python: {
    install: "pip install darkclaw-census-api-client",
    code: [
      "from darkclaw_census_api_client import (",
      "    EverQuestIICharactersApi,",
      ")",
      "",
      "api = EverQuestIICharactersApi()",
      "page = api.list_characters(",
      "    name=\"Zarenda\", page_size=10",
      ")",
    ],
  },
  Dart: {
    install: "dart pub add darkclaw_census_api_client",
    code: [
      "final api = EverQuestIICharactersApi();",
      "final response = await api.listCharacters(",
      "  name: 'Zarenda',",
      "  pageSize: 10,",
      ");",
      "",
      "final characters = response.data?.data;",
    ],
  },
} as const;

export type Sdk = keyof typeof sdks;

export function findGame(pathname: string) {
  return games.find((game) => pathname.startsWith(game.path));
}
