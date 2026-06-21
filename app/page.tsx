import dynamic from "next/dynamic"
import Hero from "@/components/sections/Hero"
import IntegrationsTicker from "@/components/sections/IntegrationsTicker"
import Services from "@/components/sections/Services"
import Industries from "@/components/sections/Industries"
import HowItWorks from "@/components/sections/HowItWorks"

const Portfolio = dynamic(() => import("@/components/sections/Portfolio"))
const Testimonials = dynamic(() => import("@/components/sections/Testimonials"))
const ROICalculator = dynamic(() => import("@/components/sections/ROICalculator"), { ssr: false })
const DigitalProducts = dynamic(() => import("@/components/sections/DigitalProducts"))
const Courses = dynamic(() => import("@/components/sections/Courses"))
const AIAssistant = dynamic(() => import("@/components/sections/AIAssistant"), { ssr: false })
const ZeroRiskCTA = dynamic(() => import("@/components/sections/ZeroRiskCTA"))

export default function Home() {
  return (
    <main>
      <Hero />
      <IntegrationsTicker />
      <Services />
      <Industries />
      <HowItWorks />
      <Portfolio />
      <Testimonials />
      <ROICalculator />
      <DigitalProducts />
      <Courses />
      <AIAssistant />
      <ZeroRiskCTA />
    </main>
  )
}