"use client"
import { motion, useInView, useReducedMotion } from "framer-motion"
import { useRef } from "react"
import type { RevealProps } from "@/lib/types"

export default function RevealWrapper({ children, delay = 0 }: RevealProps) {
  const ref = useRef(null)
  const inView = useInView(ref, { once: true, margin: "-80px" })
  const reduced = useReducedMotion()
  return (
    <motion.div
      ref={ref}
      initial={reduced ? {} : { opacity: 0, y: 28 }}
      animate={inView ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.7, ease: "easeOut", delay: reduced ? 0 : delay }}
    >
      {children}
    </motion.div>
  )
}