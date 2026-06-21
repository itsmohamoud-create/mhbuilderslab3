"use client"
import { useEffect } from "react"
import { motion } from "framer-motion"

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    console.error(error)
  }, [error])

  return (
    <main className="min-h-screen flex items-center justify-center bg-[var(--bg)]">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        className="text-center p-8"
      >
        <h2 className="font-syne text-2xl font-bold text-white mb-4">
          Something went wrong
        </h2>
        <p className="text-text-muted mb-6">
          We hit an unexpected error. Please try again.
        </p>
        <button
          onClick={reset}
          className="bg-gradient-to-r from-violet to-cyan text-white rounded-full px-8 py-3 font-dm font-medium"
        >
          Try again
        </button>
      </motion.div>
    </main>
  )
}