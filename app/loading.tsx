import { motion } from "framer-motion"

export default function Loading() {
  return (
    <main className="min-h-screen flex items-center justify-center bg-[var(--bg)]">
      <motion.div className="flex gap-2" initial="hidden" animate="visible">
        {[0, 1, 2].map((i) => (
          <motion.span
            key={i}
            className="w-3 h-3 rounded-full bg-violet"
            animate={{ y: [0, -12, 0], opacity: [0.4, 1, 0.4] }}
            transition={{ duration: 0.8, repeat: Infinity, delay: i * 0.2 }}
          />
        ))}
      </motion.div>
    </main>
  )
}