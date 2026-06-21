import type { Metadata } from "next"
import Services from "@/components/sections/Services"

export const metadata: Metadata = {
  title: "Services | MH Builders Lab",
  description: "Smart websites, AI automation, digital marketing, and growth systems for small businesses.",
  openGraph: {
    title: "Services | MH Builders Lab",
    description: "Smart websites, AI automation, digital marketing, and growth systems for small businesses.",
    url: "https://mhbuilderslab.com/services",
  },
}

export default function ServicesPage() {
  return (
    <main className="pt-24">
      <div className="max-w-7xl mx-auto px-6 mb-12 text-center">
        <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
          What We <span className="bg-gradient-to-r from-violet-light via-cyan-light to-blue-300 bg-clip-text text-transparent">Build</span>
        </h1>
        <p className="font-dm text-lg text-text-muted max-w-2xl mx-auto">
          Four comprehensive systems designed to transform your business from manual operations to automated growth.
        </p>
      </div>
      <Services />
    </main>
  )
}