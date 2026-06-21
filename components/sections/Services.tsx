"use client"
import { useState } from "react"
import { motion, AnimatePresence } from "framer-motion"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"

const SERVICES = [
  {
    icon: "ðŸŒ",
    title: "Digital Presence",
    color: "violet",
    description: "High-converting websites, landing pages, and web apps built for performance and growth.",
    tags: ["Websites", "Web Apps", "E-commerce", "Landing Pages"],
    details: [
      "Next.js & React development",
      "Mobile-first responsive design",
      "SEO-optimized architecture",
      "CMS integration (WordPress, Shopify, custom)",
      "Performance optimization (90+ Lighthouse)",
    ],
  },
  {
    icon: "ðŸ¤–",
    title: "AI & Automation",
    color: "cyan",
    description: "Intelligent systems that eliminate manual work and scale your operations 24/7.",
    tags: ["AI Agents", "Workflow Automation", "CRM Integration", "Chatbots"],
    details: [
      "Custom AI chatbots & voice agents",
      "n8n/Make/Zapier workflow automation",
      "CRM setup & integration (HubSpot, Salesforce, etc.)",
      "Automated lead nurturing sequences",
      "Data processing & reporting automation",
    ],
  },
  {
    icon: "ðŸ“ˆ",
    title: "Growth & Marketing",
    color: "amber",
    description: "Data-driven marketing that generates qualified leads and measurable ROI.",
    tags: ["Paid Ads", "SEO", "Email Marketing", "Funnels"],
    details: [
      "Meta, Google & TikTok ad management",
      "Local & national SEO strategies",
      "Email marketing automation",
      "Conversion funnel optimization",
      "Analytics & reporting dashboards",
    ],
  },
  {
    icon: "ðŸŽ¯",
    title: "Build Your Own",
    color: "emerald",
    description: "Courses, templates, and digital products to empower you to build and grow independently.",
    tags: ["Courses", "Templates", "Digital Products", "Community"],
    details: [
      "Website builder bootcamp (7 days)",
      "AI automation masterclass",
      "Ready-to-use Notion templates",
      "SEO & marketing playbooks",
      "Private community access",
    ],
  },
]

const COLOR_CLASSES: Record<string, string> = {
  violet: "from-violet to-violet-light",
  cyan: "from-cyan to-cyan-light",
  amber: "from-amber to-amber-300",
  emerald: "from-emerald to-emerald-300",
}

export default function Services() {
  const [hoveredIndex, setHoveredIndex] = useState<number | null>(null)

  return (
    <section id="services" className="py-24 px-6">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>What We Build</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Four Systems. <GradientText>Scale Beyond Limits.</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {SERVICES.map((service, index) => (
            <RevealWrapper key={service.title} delay={index * 0.1}>
              <GlassCard
                className="group p-8 h-full"
                onMouseEnter={() => setHoveredIndex(index)}
                onMouseLeave={() => setHoveredIndex(null)}
              >
                <div className="text-4xl mb-4">{service.icon}</div>
                <h3 className="font-syne font-bold text-xl text-white mb-3">
                  {service.title}
                </h3>
                <p className="font-dm text-text-muted leading-relaxed mb-4">
                  {service.description}
                </p>
                <div className="flex flex-wrap gap-2 mb-4">
                  {service.tags.map((tag) => (
                    <span
                      key={tag}
                      className={`px-3 py-1 rounded-full text-xs font-dm bg-gradient-to-r ${COLOR_CLASSES[service.color]} bg-clip-text text-transparent border border-white/[0.08]`}
                    >
                      {tag}
                    </span>
                  ))}
                </div>
                <AnimatePresence>
                  {hoveredIndex === index && (
                    <motion.div
                      initial={{ opacity: 0, height: 0 }}
                      animate={{ opacity: 1, height: "auto" }}
                      exit={{ opacity: 0, height: 0 }}
                      transition={{ duration: 0.3 }}
                    >
                      <ul className="space-y-2 pt-4 border-t border-white/[0.08]">
                        {service.details.map((detail) => (
                          <li key={detail} className="flex items-start gap-2">
                            <span className="text-emerald mt-0.5">âœ“</span>
                            <span className="font-dm text-sm text-text-muted">{detail}</span>
                          </li>
                        ))}
                      </ul>
                    </motion.div>
                  )}
                </AnimatePresence>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}