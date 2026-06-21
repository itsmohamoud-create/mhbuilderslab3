"use client"
import { motion, useReducedMotion } from "framer-motion"
import { WA_LINK } from "@/lib/constants"

export default function UrgencyBar() {
  const reduced = useReducedMotion()

  return (
    <div className="sticky top-0 z-[100] bg-gradient-to-r from-violet/15 to-cyan/15 border-b border-violet/20">
      <div className="max-w-7xl mx-auto px-6 py-2 flex items-center justify-center gap-3">
        {!reduced && (
          <motion.div
            className="w-2 h-2 rounded-full bg-emerald"
            animate={{ opacity: [1, 0.6, 1], scale: [1, 1.3, 1] }}
            transition={{ duration: 2, repeat: Infinity }}
          />
        )}
        <p className="font-dm text-[0.82rem] tracking-wide text-text-muted">
          10 client slots remaining this month â€” We only take on select projects to guarantee quality.
        </p>
        <a
          href={WA_LINK}
          target="_blank"
          rel="noopener noreferrer"
          className="font-dm text-[0.82rem] tracking-wide text-violet-light hover:text-violet-light/80 transition-colors"
        >
          Secure your spot â†’
        </a>
      </div>
    </div>
  )
}