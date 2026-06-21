"use client"
import { useState } from "react"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"
import type { ROIResults } from "@/lib/types"

export default function ROICalculator() {
  const [rev, setRev] = useState(50000)
  const [leads, setLeads] = useState(100)
  const [conv, setConv] = useState(5)
  const [acv, setAcv] = useState(500)
  const [results, setResults] = useState<ROIResults>({
    monthlyGain: 0,
    annualGain: 0,
    extraClients: 0,
    roi: 0,
  })

  const calcROI = () => {
    const improvedLeads = leads * 1.45
    const improvedConv = Math.min(conv * 1.5, 75)
    const extraClients =
      (improvedLeads * improvedConv) / 100 - (leads * conv) / 100
    const monthlyGain = Math.round(extraClients * acv)
    const annualGain = monthlyGain * 12
    const roi = rev > 0 ? Math.round((monthlyGain / (rev * 0.1)) * 100) : 0
    setResults({
      monthlyGain,
      annualGain,
      extraClients: Math.round(extraClients),
      roi,
    })
  }

  return (
    <section id="roi" className="py-24 px-6 bg-[var(--bg2)]">
      <div className="max-w-6xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>ROI Calculator</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            See Your <GradientText>Potential ROI</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <RevealWrapper>
            <GlassCard className="p-8">
              <h3 className="font-syne font-bold text-xl text-white mb-6">
                Your Current Numbers
              </h3>

              <div className="space-y-6">
                <div>
                  <label className="font-dm text-sm text-text-muted block mb-2">
                    {`Monthly Revenue: $${rev.toLocaleString()}`}
                  </label>
                  <input
                    type="range"
                    min={10000}
                    max={500000}
                    step={5000}
                    value={rev}
                    onChange={(e) => {
                      setRev(Number(e.target.value))
                      calcROI()
                    }}
                    className="w-full accent-violet"
                  />
                </div>

                <div>
                  <label className="font-dm text-sm text-text-muted block mb-2">
                    {`Monthly Leads: ${leads}`}
                  </label>
                  <input
                    type="range"
                    min={10}
                    max={1000}
                    step={10}
                    value={leads}
                    onChange={(e) => {
                      setLeads(Number(e.target.value))
                      calcROI()
                    }}
                    className="w-full accent-violet"
                  />
                </div>

                <div>
                  <label className="font-dm text-sm text-text-muted block mb-2">
                    {`Conversion Rate: ${conv}%`}
                  </label>
                  <input
                    type="range"
                    min={1}
                    max={30}
                    step={1}
                    value={conv}
                    onChange={(e) => {
                      setConv(Number(e.target.value))
                      calcROI()
                    }}
                    className="w-full accent-violet"
                  />
                </div>

                <div>
                  <label className="font-dm text-sm text-text-muted block mb-2">
                    {`Average Client Value: $${acv.toLocaleString()}`}
                  </label>
                  <input
                    type="range"
                    min={100}
                    max={10000}
                    step={100}
                    value={acv}
                    onChange={(e) => {
                      setAcv(Number(e.target.value))
                      calcROI()
                    }}
                    className="w-full accent-violet"
                  />
                </div>
              </div>
            </GlassCard>
          </RevealWrapper>

          <RevealWrapper delay={0.1}>
            <GlassCard className="p-8 bg-gradient-to-br from-violet/10 to-cyan/10">
              <h3 className="font-syne font-bold text-xl text-white mb-6">
                Projected Results with MH Builders Lab
              </h3>

              <div className="grid grid-cols-2 gap-6">
                <div>
                  <div className="font-dm text-sm text-text-muted mb-1">
                    Monthly Gain
                  </div>
                  <div className="font-syne font-bold text-3xl text-emerald">
                    {`$${results.monthlyGain.toLocaleString()}`}
                  </div>
                </div>

                <div>
                  <div className="font-dm text-sm text-text-muted mb-1">
                    Annual Gain
                  </div>
                  <div className="font-syne font-bold text-3xl text-emerald">
                    {`$${results.annualGain.toLocaleString()}`}
                  </div>
                </div>

                <div>
                  <div className="font-dm text-sm text-text-muted mb-1">
                    Extra Clients/Month
                  </div>
                  <div className="font-syne font-bold text-3xl text-cyan-light">
                    {results.extraClients}
                  </div>
                </div>

                <div>
                  <div className="font-dm text-sm text-text-muted mb-1">
                    ROI
                  </div>
                  <div className="font-syne font-bold text-3xl text-violet-light">
                    {`${results.roi}%`}
                  </div>
                </div>
              </div>

              <div className="mt-8 p-4 rounded-xl bg-white/[0.04] border border-white/[0.08]">
                <p className="font-dm text-sm text-text-muted leading-relaxed">
                  <span className="text-emerald font-medium">*Based on typical results:</span> 45% more leads, 50% better conversion rates, and 10% of your current revenue as investment.
                </p>
              </div>
            </GlassCard>
          </RevealWrapper>
        </div>
      </div>
    </section>
  )
}