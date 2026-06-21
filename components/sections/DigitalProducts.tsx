import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"
import { PRODUCTS, WA_LINK } from "@/lib/constants"

const BADGE_COLORS: Record<string, string> = {
  cyan: "bg-cyan/10 border-cyan/30 text-cyan-light",
  violet: "bg-violet/10 border-violet/30 text-violet-light",
  emerald: "bg-emerald/10 border-emerald/30 text-emerald",
  amber: "bg-amber/10 border-amber/30 text-amber-300",
  rose: "bg-rose/10 border-rose/30 text-rose-300",
}

export default function DigitalProducts() {
  return (
    <section id="products" className="py-24 px-6">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>Digital Products</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Instant Access. <GradientText>Immediate Impact.</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {PRODUCTS.map((product, index) => (
            <RevealWrapper key={product.name} delay={index * 0.1}>
              <GlassCard className="p-6 h-full flex flex-col">
                <div className="mb-4">
                  <span
                    className={`inline-block px-3 py-1 rounded-full text-xs font-dm border ${BADGE_COLORS[product.badgeColor]}`}
                  >
                    {product.badge}
                  </span>
                </div>

                <h3 className="font-syne font-bold text-lg text-white mb-2">
                  {product.name}
                </h3>

                <p className="font-dm text-sm text-text-muted leading-relaxed mb-4 flex-grow">
                  {product.desc}
                </p>

                <div className="flex items-center justify-between pt-4 border-t border-white/[0.08]">
                  <span className="font-dm text-xs text-text-faint">
                    {product.format}
                  </span>
                  <a
                    href={`${WA_LINK}?text=${encodeURIComponent(product.waMsg)}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="font-dm text-sm text-violet-light hover:text-violet-light/80 transition-colors"
                  >
                    Get this â†’
                  </a>
                </div>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}