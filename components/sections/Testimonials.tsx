"use client"
import { useState, useEffect, useCallback } from "react"
import { motion, AnimatePresence, useReducedMotion } from "framer-motion"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import SectionLabel from "@/components/ui/SectionLabel"
import { TESTIMONIALS } from "@/lib/constants"
import { slideIn } from "@/lib/animations"

export default function Testimonials() {
  const [currentIndex, setCurrentIndex] = useState(0)
  const [isPaused, setIsPaused] = useState(false)
  const reduced = useReducedMotion()

  const nextSlide = useCallback(() => {
    setCurrentIndex((prev) => (prev + 1) % TESTIMONIALS.length)
  }, [])

  useEffect(() => {
    if (isPaused || reduced) return
    const interval = setInterval(nextSlide, 4000)
    return () => clearInterval(interval)
  }, [isPaused, nextSlide, reduced])

  return (
    <section id="testimonials" className="py-24 px-6">
      <div className="max-w-4xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>Testimonials</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Trusted by <GradientText>Businesses Worldwide</GradientText>
          </h2>
        </div>

        <div
          onMouseEnter={() => setIsPaused(true)}
          onMouseLeave={() => setIsPaused(false)}
        >
          <AnimatePresence mode="wait">
            <motion.div
              key={currentIndex}
              initial={reduced ? {} : slideIn.initial}
              animate={reduced ? {} : slideIn.animate}
              exit={reduced ? {} : slideIn.exit}
              transition={slideIn.transition}
            >
              <GlassCard className="p-8 md:p-12 relative">
                <span className="font-syne text-9xl text-violet/20 absolute top-4 left-6">
                  &ldquo;
                </span>

                <div className="relative z-10">
                  <div className="text-amber text-2xl mb-6">â˜…â˜…â˜…â˜…â˜…</div>

                  <p className="font-dm text-lg md:text-xl text-text-base leading-relaxed mb-8 italic">
                    {TESTIMONIALS[currentIndex].quote}
                  </p>

                  <div className="flex items-center gap-4">
                    <div className="w-12 h-12 rounded-full bg-gradient-to-br from-violet to-cyan flex items-center justify-center font-syne font-bold text-white">
                      {TESTIMONIALS[currentIndex].initials}
                    </div>
                    <div>
                      <div className="font-syne font-bold text-white">
                        {TESTIMONIALS[currentIndex].name}
                      </div>
                      <div className="font-dm text-sm text-text-muted">
                        {TESTIMONIALS[currentIndex].role}
                      </div>
                    </div>
                  </div>
                </div>
              </GlassCard>
            </motion.div>
          </AnimatePresence>

          <div className="flex justify-center gap-2 mt-8">
            {TESTIMONIALS.map((_, index) => (
              <button
                key={index}
                onClick={() => setCurrentIndex(index)}
                className={`rounded-full transition-all duration-300 ${
                  index === currentIndex
                    ? "w-8 h-2 bg-gradient-to-r from-violet to-cyan"
                    : "w-2 h-2 bg-white/20 hover:bg-white/40"
                }`}
                aria-label={`Go to testimonial ${index + 1}`}
              />
            ))}
          </div>
        </div>
      </div>
    </section>
  )
}