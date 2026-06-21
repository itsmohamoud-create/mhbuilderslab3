import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import { WA_LINK } from "@/lib/constants"

const STATS = [
  { value: "10", label: "Days to go live" },
  { value: "20h+", label: "Saved per week" },
  { value: "3x", label: "Revenue growth" },
  { value: "50+", label: "Integrations" },
]

export default function Hero() {
  return (
    <section id="home" className="min-h-screen flex items-center justify-center relative overflow-hidden">
      <div className="absolute inset-0 grid-pattern" />
      
      <div className="relative z-10 max-w-6xl mx-auto px-6 py-32 text-center">
        <RevealWrapper>
          <div className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-violet/12 border border-violet/25 mb-8">
            <span className="w-2 h-2 rounded-full bg-emerald animate-pulse" />
            <span className="font-dm text-sm text-violet-light">
              Done-for-you digital systems for serious business growth
            </span>
          </div>
        </RevealWrapper>

        <RevealWrapper delay={0.1}>
          <h1 className="font-syne font-extrabold tracking-tight text-[clamp(2.8rem,6vw,5.2rem)] leading-[1.1] mb-6">
            Build. Automate.
            <br />
            <GradientText>Scale Beyond Limits.</GradientText>
          </h1>
        </RevealWrapper>

        <RevealWrapper delay={0.2}>
          <p className="font-dm font-light text-text-muted leading-loose max-w-2xl mx-auto text-lg mb-10">
            We engineer the digital systems that grow your business â€” high-converting websites, intelligent AI automations, apps, and growth marketing that turn traffic into revenue.
          </p>
        </RevealWrapper>

        <RevealWrapper delay={0.3}>
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-16">
            <a
              href={WA_LINK}
              target="_blank"
              rel="noopener noreferrer"
              className="bg-gradient-to-r from-violet to-cyan text-white rounded-full px-8 py-3.5 font-dm font-medium shadow-[0_8px_32px_rgba(124,58,237,0.35)] hover:shadow-[0_12px_40px_rgba(124,58,237,0.5)] hover:-translate-y-0.5 transition-all duration-250"
            >
              Book Free Demo â†’
            </a>
            <a
              href="#services"
              className="border border-white/[0.08] text-white rounded-full px-8 py-3.5 font-dm font-medium hover:bg-white/[0.07] transition-all duration-250"
            >
              Explore Services
            </a>
          </div>
        </RevealWrapper>

        <RevealWrapper delay={0.4}>
          <GlassCard className="p-8 max-w-3xl mx-auto">
            <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
              {STATS.map((stat) => (
                <div key={stat.label} className="text-center">
                  <div className="font-syne font-bold text-3xl md:text-4xl bg-gradient-to-r from-violet-light to-cyan-light bg-clip-text text-transparent">
                    {stat.value}
                  </div>
                  <div className="font-dm text-sm text-text-muted mt-1">
                    {stat.label}
                  </div>
                </div>
              ))}
            </div>
          </GlassCard>
        </RevealWrapper>
      </div>
    </section>
  )
}