"use client"
import { motion, useReducedMotion } from "framer-motion"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"
import { COURSES, WA_LINK } from "@/lib/constants"

export default function Courses() {
  const reduced = useReducedMotion()

  return (
    <section id="courses" className="py-24 px-6 bg-[var(--bg2)]">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>Courses</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Learn to <GradientText>Build & Scale</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {COURSES.map((course, index) => (
            <RevealWrapper key={course.title} delay={index * 0.1}>
              <GlassCard className="p-6 h-full flex flex-col">
                <div className="mb-4">
                  <span className="inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-dm bg-amber/10 border border-amber/30 text-amber-300">
                    {!reduced && (
                      <motion.span
                        className="w-2 h-2 rounded-full bg-amber"
                        animate={{ opacity: [1, 0.6, 1], scale: [1, 1.3, 1] }}
                        transition={{ duration: 2, repeat: Infinity }}
                      />
                    )}
                    Waitlist Open
                  </span>
                </div>

                <h3 className="font-syne font-bold text-lg text-white mb-2">
                  {course.title}
                </h3>

                <p className="font-dm text-sm text-text-muted leading-relaxed mb-4">
                  {course.desc}
                </p>

                <div className="flex gap-4 mb-4 text-xs font-dm text-text-faint">
                  <span>ðŸ“… {course.duration}</span>
                  <span>ðŸ‘¥ {course.audience}</span>
                </div>

                <ul className="space-y-2 mb-6 flex-grow">
                  {course.outcomes.map((outcome) => (
                    <li key={outcome} className="flex items-start gap-2">
                      <span className="text-emerald mt-0.5">âœ“</span>
                      <span className="font-dm text-sm text-text-muted">{outcome}</span>
                    </li>
                  ))}
                </ul>

                <a
                  href={`${WA_LINK}?text=${encodeURIComponent(course.waMsg)}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="block text-center bg-gradient-to-r from-amber to-amber-600 text-white rounded-full px-6 py-3 font-dm font-medium hover:shadow-[0_8px_32px_rgba(245,158,11,0.35)] hover:-translate-y-0.5 transition-all duration-250"
                >
                  Join Waitlist â†’
                </a>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}