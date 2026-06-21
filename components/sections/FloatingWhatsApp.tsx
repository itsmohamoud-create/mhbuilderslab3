"use client"
import { motion, useReducedMotion } from "framer-motion"
import { WA_LINK } from "@/lib/constants"

export default function FloatingWhatsApp() {
  const reduced = useReducedMotion()

  return (
    <motion.a
      href={WA_LINK}
      target="_blank"
      rel="noopener noreferrer"
      className="fixed bottom-7 right-7 z-[200] w-14 h-14 rounded-full bg-[#25D366] flex items-center justify-center text-2xl shadow-[0_8px_32px_rgba(37,211,102,0.4)] hover:scale-110 transition-transform"
      animate={reduced ? {} : { y: [0, -6, 0] }}
      transition={{ duration: 3, repeat: Infinity, ease: "easeInOut" }}
      aria-label="Chat with MH Builders Lab on WhatsApp"
    >
      ðŸ’¬
    </motion.a>
  )
}