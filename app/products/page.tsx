import type { Metadata } from "next"
import DigitalProducts from "@/components/sections/DigitalProducts"

export const metadata: Metadata = {
  title: "Digital Products | MH Builders Lab",
  description: "Instant-access digital products to accelerate your business growth.",
  openGraph: {
    title: "Digital Products | MH Builders Lab",
    description: "Instant-access digital products to accelerate your business growth.",
    url: "https://mhbuilderslab.com/products",
  },
}

export default function ProductsPage() {
  return (
    <main className="pt-24 pb-24 px-6">
      <div className="max-w-7xl mx-auto mb-12 text-center">
        <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
          Digital <span className="bg-gradient-to-r from-violet-light via-cyan-light to-blue-300 bg-clip-text text-transparent">Products</span>
        </h1>
        <p className="font-dm text-lg text-text-muted max-w-2xl mx-auto">
          Skip the wait. Get immediate access to templates, guides, and tools built from real-world experience.
        </p>
      </div>
      <DigitalProducts />
    </main>
  )
}