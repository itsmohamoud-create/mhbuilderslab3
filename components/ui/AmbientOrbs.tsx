"use client"
import { motion, useReducedMotion } from "framer-motion"

export default function AmbientOrbs() {
  const reduced = useReducedMotion()
  
  if (reduced) return null

  return (
    <>
      <motion.div
        className="fixed top-0 left-0 w-[600px] h-[600px] bg-violet/20 rounded-full blur-[120px] pointer-events-none z-0"
        animate={{ y: [0, -30, 0], scale: [1, 1.05, 1] }}
        transition={{ duration: 8, repeat: Infinity, ease: "easeInOut" }}
      />
      <motion.div
        className="fixed top-0 right-0 w-[500px] h-[500px] bg-cyan/15 rounded-full blur-[120px] pointer-events-none z-0"
        animate={{ y: [0, -30, 0], scale: [1, 1.05, 1] }}
        transition={{ duration: 8, repeat: Infinity, ease: "easeInOut", delay: 2.5 }}
      />
      <motion.div
        className="fixed bottom-0 left-0 w-[400px] h-[400px] bg-blue/15 rounded-full blur-[120px] pointer-events-none z-0"
        animate={{ y: [0, -30, 0], scale: [1, 1.05, 1] }}
        transition={{ duration: 8, repeat: Infinity, ease: "easeInOut", delay: 5 }}
      />
    </>
  )
}