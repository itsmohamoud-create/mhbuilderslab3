import type { Metadata } from "next"
import Portfolio from "@/components/sections/Portfolio"

export const metadata: Metadata = {
  title: "Portfolio | MH Builders Lab",
  description: "Real results from real businesses. See how we've helped companies scale with digital systems.",
  openGraph: {
    title: "Portfolio | MH Builders Lab",
    description: "Real results from real businesses. See how we've helped companies scale with digital systems.",
    url: "https://mhbuilderslab.com/portfolio",
  },
}

export default function PortfolioPage() {
  return (
    <main className="pt-24">
      <div className="max-w-7xl mx-auto px-6 mb-12 text-center">
        <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
          Our <span className="bg-gradient-to-r from-violet-light via-cyan-light to-blue-300 bg-clip-text text-transparent">Work</span>
        </h1>
        <p className="font-dm text-lg text-text-muted max-w-2xl mx-auto">
          Every project tells a story of transformation. Here are some of our favorites.
        </p>
      </div>
      <Portfolio />
    </main>
  )
}