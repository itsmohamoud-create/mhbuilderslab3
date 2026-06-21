import type { Metadata } from "next"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"

export const metadata: Metadata = {
  title: "About | MH Builders Lab",
  description: "Learn about Mohamud Hassan and the mission behind MH Builders Lab.",
  openGraph: {
    title: "About | MH Builders Lab",
    description: "Learn about Mohamud Hassan and the mission behind MH Builders Lab.",
    url: "https://mhbuilderslab.com/about",
  },
}

const VALUES = [
  { icon: "ðŸŽ¯", title: "Results-First", desc: "Every decision is measured by the impact on your business growth." },
  { icon: "âš¡", title: "Speed Without Compromise", desc: "10-day delivery without cutting corners on quality." },
  { icon: "ðŸ¤", title: "Partnership Mindset", desc: "We succeed when you succeed. Your growth is our reputation." },
  { icon: "ðŸ”®", title: "Future-Ready", desc: "Built with modern tech that scales as you grow." },
]

export default function AboutPage() {
  return (
    <main className="pt-24 pb-24 px-6">
      <div className="max-w-6xl mx-auto">
        <div className="text-center mb-16">
          <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
            Built by <GradientText>Builders</GradientText>
          </h1>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center mb-20">
          <RevealWrapper>
            <div className="relative">
              <div className="aspect-square max-w-md mx-auto rounded-2xl bg-gradient-to-br from-violet/20 to-cyan/20 flex items-center justify-center overflow-hidden">
                <div className="text-center p-8">
                  <div className="text-8xl mb-4">ðŸ‘¨â€ðŸ’»</div>
                  <p className="font-dm text-sm text-text-muted">Founder photo placeholder</p>
                  <p className="font-dm text-xs text-text-faint mt-2">Replace mo.png with actual photo</p>
                </div>
              </div>
            </div>
          </RevealWrapper>

          <RevealWrapper delay={0.1}>
            <div>
              <h2 className="font-syne font-bold text-3xl text-white mb-6">
                Mohamud Hassan
              </h2>
              <p className="font-dm text-violet-light mb-4 font-medium">
                Founder & CEO
              </p>
              <p className="font-dm text-text-muted leading-relaxed mb-4">
                I started MH Builders Lab with a simple belief: every small business deserves access to the same digital systems that power Fortune 500 companies.
              </p>
              <p className="font-dm text-text-muted leading-relaxed mb-6">
                After years of building systems for companies across Africa, the UK, and the UAE, I saw a pattern, the businesses that thrived weren&apos;t necessarily the biggest, but the ones that leveraged technology most effectively.
              </p>
              <p className="font-dm text-text-muted leading-relaxed">
                Today, we&apos;re on a mission to democratize digital transformation. No jargon, no bloated budgets, no long timelines. Just systems that work.
              </p>
            </div>
          </RevealWrapper>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-20">
          {VALUES.map((value, index) => (
            <RevealWrapper key={value.title} delay={index * 0.1}>
              <GlassCard className="p-6 h-full text-center">
                <div className="text-4xl mb-4">{value.icon}</div>
                <h3 className="font-syne font-bold text-white mb-2">{value.title}</h3>
                <p className="font-dm text-sm text-text-muted">{value.desc}</p>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>

        <RevealWrapper>
          <GlassCard className="p-8 md:p-12 bg-gradient-to-br from-violet/10 via-transparent to-cyan/10">
            <div className="text-center">
              <h2 className="font-syne font-bold text-2xl text-white mb-4">
                The Numbers Speak
              </h2>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-8 mt-8">
                {[
                  { value: "50+", label: "Projects Delivered" },
                  { value: "12", label: "Countries Served" },
                  { value: "3+", label: "Years Active" },
                  { value: "98%", label: "Client Satisfaction" },
                ].map((stat) => (
                  <div key={stat.label}>
                    <div className="font-syne font-bold text-3xl md:text-4xl bg-gradient-to-r from-violet-light to-cyan-light bg-clip-text text-transparent">
                      {stat.value}
                    </div>
                    <div className="font-dm text-sm text-text-muted mt-1">{stat.label}</div>
                  </div>
                ))}
              </div>
            </div>
          </GlassCard>
        </RevealWrapper>
      </div>
    </main>
  )
}