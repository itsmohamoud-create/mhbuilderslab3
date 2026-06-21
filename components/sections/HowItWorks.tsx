import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"

const STEPS = [
  {
    number: "01",
    title: "Book Free Demo",
    description: "Schedule a 30-minute call. We'll analyze your business, identify gaps, and show you exactly what's possible â€” no commitment required.",
  },
  {
    number: "02",
    title: "We Build the System",
    description: "Our team designs and builds your complete digital system in just 10 days. Websites, automations, apps â€” delivered ready to deploy.",
  },
  {
    number: "03",
    title: "You Grow",
    description: "Launch with confidence. Watch your leads increase, manual work decrease, and revenue scale. We provide ongoing support as you expand.",
  },
]

export default function HowItWorks() {
  return (
    <section id="process" className="py-24 px-6">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>The Process</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Up & Running <GradientText>in 10 Days</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 relative">
          <div className="hidden md:block absolute top-24 left-[20%] right-[20%] h-px bg-gradient-to-r from-violet via-cyan to-blue" />

          {STEPS.map((step, index) => (
            <RevealWrapper key={step.number} delay={index * 0.15}>
              <div className="relative text-center">
                <div className="font-syne font-bold text-6xl bg-gradient-to-r from-violet-light to-cyan-light bg-clip-text text-transparent mb-6">
                  {step.number}
                </div>
                <GlassCard className="p-8">
                  <h3 className="font-syne font-bold text-xl text-white mb-3">
                    {step.title}
                  </h3>
                  <p className="font-dm text-text-muted leading-relaxed">
                    {step.description}
                  </p>
                </GlassCard>
              </div>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}