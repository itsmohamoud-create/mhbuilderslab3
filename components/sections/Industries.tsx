import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"

const INDUSTRIES = [
  { icon: "ðŸ¨", label: "Hotels & Restaurants" },
  { icon: "ðŸ’†", label: "Med Spas & Wellness" },
  { icon: "ðŸ ", label: "Real Estate" },
  { icon: "âš–ï¸", label: "Legal Services" },
  { icon: "ðŸ¥", label: "Healthcare" },
  { icon: "ðŸ›’", label: "E-commerce" },
  { icon: "ðŸ—ï¸", label: "Contractors" },
  { icon: "â¤ï¸", label: "Charities & NGOs" },
  { icon: "ðŸŽ¯", label: "Coaches" },
  { icon: "ðŸš—", label: "Automotive" },
  { icon: "ðŸŽ“", label: "Education" },
  { icon: "ðŸšŒ", label: "Transport & Logistics" },
]

export default function Industries() {
  return (
    <section id="industries" className="py-24 px-6 bg-[var(--bg2)]">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>Who We Serve</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Built For <GradientText>Your Industry</GradientText>
          </h2>
        </div>

        <div className="flex flex-wrap gap-3 justify-center">
          {INDUSTRIES.map((industry, index) => (
            <RevealWrapper key={industry.label} delay={index * 0.05}>
              <GlassCard className="px-6 py-4 hover:border-cyan/30">
                <div className="flex items-center gap-3">
                  <span className="text-2xl">{industry.icon}</span>
                  <span className="font-dm text-sm font-medium text-white">{industry.label}</span>
                </div>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}