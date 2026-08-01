import { useState } from "react";
import { SiteFooter } from "../components/layout/SiteFooter";
import { SiteHeader } from "../components/layout/SiteHeader";
import { findGame } from "../content/project";
import { ProjectUpdatesModal } from "../features/project-updates/ProjectUpdatesModal";
import { GamePage } from "../pages/game/GamePage";
import { HomePage } from "../pages/home/HomePage";

export default function App() {
  const game = findGame(window.location.pathname);
  const [updatesOpen, setUpdatesOpen] = useState(false);
  const openUpdates = () => setUpdatesOpen(true);

  return (
    <div className="site-shell">
      <SiteHeader onUpdates={openUpdates} />
      {game ? <GamePage game={game} /> : <HomePage onUpdates={openUpdates} />}
      <SiteFooter onUpdates={openUpdates} />
      <ProjectUpdatesModal open={updatesOpen} onClose={() => setUpdatesOpen(false)} />
    </div>
  );
}
