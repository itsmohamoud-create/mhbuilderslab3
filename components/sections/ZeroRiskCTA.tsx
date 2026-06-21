import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import { WA_LINK } from "@/lib/constants"

const TRUST_CHIPS = [
  "âœ“ Free consultation",
  "âœ“ No commitment required",
  "âœ“ Results in 10 days",
  "âœ“ Ongoing support",
]

export default function ZeroRiskCTA() {
  return (
    <section id="cta" className="py-24 px-6">
      <div className="max-w-4xl mx-auto">
        <RevealWrapper>
          <GlassCard className="rounded-[28px] p-8 md:p-16 bg-gradient-to-br from-violet/10 via-transparent to-cyan/10 border-violet/20">
            <div className="text-center">
              <h2 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-6">
                Ready to <GradientText>Scale Your Business?</GradientText>
              </h2>

              <p className="font-dm text-lg text-text-muted leading-relaxed max-w-2xl mx-auto mb-8">
                Join 50+ businesses that have transformed their operations with MH Builders Lab. Your free demo is just one click away.
              </p>

              <div className="flex flex-wrap gap-3 justify-center mb-10">
                {TRUST_CHIPS.map((chip) => (
                  <span
                    key={chip}
                    className="px-4 py-2 rounded-full bg-emerald/10 border border-emerald/30 text-emerald text-sm font-dm"
                  >
                    {chip}
                  </span>
                ))}
              </div>

              <a
                href={WA_LINK}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-block bg-gradient-to-r from-violet to-cyan text-white rounded-full px-12 py-4 font-dm font-medium text-lg shadow-[0_8px_32px_rgba(124,58,237,0.35)] hover:shadow-[0_12px_40px_rgba(124,58,237,0.5)] hover:-translate-y-0.5 transition-all duration-250"
              >
                Book Your Free Demo â†’
              </a>

              <p className="font-dm text-xs text-text-faint mt-6">
                No credit card required Â· 30-minute call Â· Instant clarity on what is possible
              </p>
            </div>
          </GlassCard>
        </RevealWrapper>
      </div>
    </section>
  )
}