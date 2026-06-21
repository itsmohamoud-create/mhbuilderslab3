"use client"
import { INTEGRATIONS_ROW1, INTEGRATIONS_ROW2 } from "@/lib/constants"
import SectionLabel from "@/components/ui/SectionLabel"

const COLOR_MAP: Record<string, string> = {
  violet: "border-violet/30 text-violet-light shadow-[0_0_12px_rgba(124,58,237,0.2)]",
  blue: "border-blue/30 text-blue-300 shadow-[0_0_12px_rgba(59,130,246,0.2)]",
  emerald: "border-emerald/30 text-emerald-300 shadow-[0_0_12px_rgba(16,185,129,0.2)]",
  amber: "border-amber/30 text-amber-300 shadow-[0_0_12px_rgba(245,158,11,0.2)]",
  rose: "border-rose/30 text-rose-300 shadow-[0_0_12px_rgba(244,63,94,0.2)]",
  cyan: "border-cyan/30 text-cyan-light shadow-[0_0_12px_rgba(6,182,212,0.2)]",
}

function IntegrationBadge({ abbr, name, color }: { abbr: string; name: string; color: string }) {
  return (
    <div className={`inline-flex items-center gap-2 px-4 py-2 rounded-full border mx-3 flex-shrink-0 ${COLOR_MAP[color]}`}>
      <span className="font-syne font-bold text-xs">{abbr}</span>
      <span className="font-dm text-xs">{name}</span>
    </div>
  )
}

export default function IntegrationsTicker() {
  const row1 = [...INTEGRATIONS_ROW1, ...INTEGRATIONS_ROW1]
  const row2 = [...INTEGRATIONS_ROW2, ...INTEGRATIONS_ROW2]

  return (
    <section className="py-12 overflow-hidden">
      <div className="text-center mb-8">
        <SectionLabel>Powered by & Integrates With 50+ Platforms</SectionLabel>
      </div>
      
      <div className="space-y-4">
        <div className="ticker-row flex whitespace-nowrap">
          {row1.map((item, i) => (
            <IntegrationBadge key={`${item.abbr}-${i}`} {...item} />
          ))}
        </div>
        <div className="ticker-row-reverse flex whitespace-nowrap">
          {row2.map((item, i) => (
            <IntegrationBadge key={`${item.abbr}-${i}`} {...item} />
          ))}
        </div>
      </div>
    </section>
  )
}