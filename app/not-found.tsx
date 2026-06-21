import Link from "next/link"

export default function NotFound() {
  return (
    <main className="min-h-screen flex items-center justify-center bg-[var(--bg)] text-center px-6">
      <div>
        <p className="font-syne font-bold text-8xl bg-gradient-to-r from-violet-light to-cyan-light bg-clip-text text-transparent">
          404
        </p>
        <h2 className="font-syne font-bold text-2xl text-white mt-4 mb-3">
          Page not found
        </h2>
        <p className="text-text-muted mb-8 max-w-md mx-auto">
          This page doesn&apos;t exist or has been moved.
        </p>
        <Link
          href="/"
          className="bg-gradient-to-r from-violet to-cyan text-white rounded-full px-8 py-3.5 font-dm font-medium inline-block"
        >
          Back to Home
        </Link>
      </div>
    </main>
  )
}