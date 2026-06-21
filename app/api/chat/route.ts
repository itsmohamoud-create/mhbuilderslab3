import { NextRequest, NextResponse } from "next/server"
import type { ChatMessage } from "@/lib/types"

const SYSTEM_PROMPT = `You are MH Assistant, the AI assistant for MH Builders Lab, a premium digital agency founded by Mohamud Hassan that builds websites, apps, AI automation systems, and digital marketing solutions for small businesses worldwide.

Key facts:
- Services: Smart Websites, App Development, AI Automation, Digital Marketing, SEO, Brand Identity, AI Voice Agents, CRM Integration, Business Systems, Courses, Digital Products
- Process: Free Demo to Build in 10 days to Scale
- Contact: WhatsApp +254723783337 | itsmohamoud@gmail.com
- All demos are FREE, no commitment required
- Typical results: 3x revenue growth, 20h+ saved/week, live in 10 days
- Serves businesses globally, strong in Kenya, Africa, UK, UAE

Be warm, confident, helpful. Keep responses to 2 to 4 sentences. Always encourage booking a free demo for specific needs. Mention WhatsApp naturally when relevant.`

export async function POST(req: NextRequest) {
  try {
    const { messages }: { messages: ChatMessage[] } = await req.json()

    if (!messages || !Array.isArray(messages)) {
      return NextResponse.json({ error: "Invalid request" }, { status: 400 })
    }

    const userMessage = messages[messages.length - 1]?.content?.toLowerCase() || ""

    let response = "I'd love to help you with that! For specific details about your project, I recommend booking a free demo with our team. You can reach us on WhatsApp at +254 723 783 337, we'll get back to you within minutes!"

    if (userMessage.includes("service") || userMessage.includes("offer") || userMessage.includes("what do you")) {
      response = "We offer four main services: Smart Websites & Web Apps, AI & Automation Systems, Growth & Marketing, and Educational Courses & Digital Products. Each is designed to help your business scale. Want to know which one is right for you? Book a free demo and we'll show you!"
    } else if (userMessage.includes("cost") || userMessage.includes("price") || userMessage.includes("how much")) {
      response = "Pricing depends on your specific needs, but we have solutions starting from $500 for websites and $1,000 for automation packages. Every project begins with a free consultation where we'll give you an exact quote. No surprises, no pressure!"
    } else if (userMessage.includes("ai") || userMessage.includes("automation")) {
      response = "Our AI automation can save you 20+ hours per week! We build custom workflows using n8n, Make, and AI agents that handle everything from lead qualification to appointment booking. Many clients see ROI within the first month. Ready to automate?"
    } else if (userMessage.includes("website") || userMessage.includes("web")) {
      response = "Our websites aren't just pretty, they're revenue machines! Built with Next.js for speed, SEO-optimized, and designed to convert. Most clients see 3x more leads within 60 days. We deliver in just 10 days!"
    } else if (userMessage.includes("time") || userMessage.includes("long") || userMessage.includes("fast")) {
      response = "We're fast! Most projects are completed in 10 business days. Complex automation systems might take 2-3 weeks. We never compromise quality for speed though, you get both!"
    }

    return NextResponse.json({ content: response })
  } catch (error) {
    console.error("Chat API error:", error)
    return NextResponse.json(
      { error: "Something went wrong. Please reach us on WhatsApp at +254 723 783 337!" },
      { status: 500 }
    )
  }
}