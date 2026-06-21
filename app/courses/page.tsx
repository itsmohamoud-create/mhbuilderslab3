import type { Metadata } from "next"
import Courses from "@/components/sections/Courses"

export const metadata: Metadata = {
  title: "Courses | MH Builders Lab",
  description: "Learn to build and scale with practical courses from industry practitioners.",
  openGraph: {
    title: "Courses | MH Builders Lab",
    description: "Learn to build and scale with practical courses from industry practitioners.",
    url: "https://mhbuilderslab.com/courses",
  },
}

export default function CoursesPage() {
  return (
    <main className="pt-24 pb-24 px-6">
      <div className="max-w-7xl mx-auto mb-12 text-center">
        <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
          Learn to <span className="bg-gradient-to-r from-violet-light via-cyan-light to-blue-300 bg-clip-text text-transparent">Build & Scale</span>
        </h1>
        <p className="font-dm text-lg text-text-muted max-w-2xl mx-auto">
          Practical courses designed for doers. No fluff, no theory, just actionable skills you can apply immediately.
        </p>
      </div>
      <Courses />
    </main>
  )
}