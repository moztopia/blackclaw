import { CallToAction } from "./sections/CallToAction";
import { ClientsSection } from "./sections/ClientsSection";
import { CoverageSection } from "./sections/CoverageSection";
import { FlowSection } from "./sections/FlowSection";
import { HeroSection } from "./sections/HeroSection";
import { WhySection } from "./sections/WhySection";

export function HomePage({ onUpdates }: { onUpdates: () => void }) {
  return (
    <main>
      <HeroSection />
      <section className="signal-strip" aria-label="Project attributes">
        <span>Built in the open</span><i />
        <span>Evidence-backed schemas</span><i />
        <span>Stable REST resources</span><i />
        <span>Multi-language clients</span>
      </section>
      <WhySection />
      <CoverageSection />
      <ClientsSection />
      <FlowSection />
      <CallToAction onUpdates={onUpdates} />
    </main>
  );
}
