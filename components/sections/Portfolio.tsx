"use client"
import { useState } from "react"
import { motion, AnimatePresence } from "framer-motion"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"
import { PROJECTS } from "@/lib/constants"
import type { Project } from "@/lib/types"

const CATEGORIES = ["All", "Websites", "Apps", "AI & Auto", "Marketing", "Branding"]

export default function Portfolio() {
  const [filter, setFilter] = useState("All")
  const [selectedProject, setSelectedProject] = useState<Project | null>(null)

  const filteredProjects = PROJECTS.filter(
    (p) => filter === "All" || p.category === filter
  )

  return (
    <section id="portfolio" className="py-24 px-6 bg-[var(--bg2)]">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-12">
          <SectionLabel>Our Work</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Real Results. <GradientText>Real Businesses.</GradientText>
          </h2>
        </div>

        <div className="flex flex-wrap gap-2 justify-center mb-12">
          {CATEGORIES.map((cat) => (
            <button
              key={cat}
              onClick={() => setFilter(cat)}
              className={`px-5 py-2 rounded-full font-dm text-sm transition-all ${
                filter === cat
                  ? "bg-gradient-to-r from-violet to-cyan text-white"
                  : "border border-white/[0.08] text-text-muted hover:bg-white/[0.07]"
              }`}
            >
              {cat}
            </button>
          ))}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <AnimatePresence mode="popLayout">
            {filteredProjects.map((project) => (
              <motion.div
                key={project.id}
                layout
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                exit={{ opacity: 0, scale: 0.9 }}
                transition={{ duration: 0.3 }}
              >
                <GlassCard
                  className="group cursor-pointer overflow-hidden h-full"
                  onClick={() => setSelectedProject(project)}
                >
                  <div className="h-48 bg-gradient-to-br from-violet/20 to-cyan/20 flex items-center justify-center text-6xl relative">
                    {project.icon}
                    <div className="absolute inset-0 bg-black/60 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
                      <span className="font-dm text-white font-medium">View Case Study â†’</span>
                    </div>
                  </div>
                  <div className="p-6">
                    <div className="flex flex-wrap gap-2 mb-3">
                      {project.tags.map((tag) => (
                        <span
                          key={tag}
                          className="px-2 py-1 rounded-full text-xs font-dm bg-white/[0.05] text-text-muted"
                        >
                          {tag}
                        </span>
                      ))}
                    </div>
                    <h3 className="font-syne font-bold text-lg text-white mb-2">
                      {project.name}
                    </h3>
                    <p className="font-dm text-sm text-text-muted mb-3">
                      {project.shortDesc}
                    </p>
                    <div className="inline-block px-3 py-1 rounded-full bg-emerald/10 border border-emerald/30 text-emerald text-xs font-dm">
                      {project.metric}
                    </div>
                  </div>
                </GlassCard>
              </motion.div>
            ))}
          </AnimatePresence>
        </div>

        <AnimatePresence>
          {selectedProject && (
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="fixed inset-0 z-[200] flex items-center justify-center p-6 bg-black/80 backdrop-blur-sm"
              onClick={() => setSelectedProject(null)}
            >
              <motion.div
                initial={{ scale: 0.9, opacity: 0 }}
                animate={{ scale: 1, opacity: 1 }}
                exit={{ scale: 0.9, opacity: 0 }}
                className="bg-[var(--bg3)] border border-white/[0.08] rounded-2xl p-8 max-w-2xl w-full max-h-[80vh] overflow-y-auto"
                onClick={(e) => e.stopPropagation()}
              >
                <div className="flex items-start justify-between mb-6">
                  <div>
                    <div className="text-5xl mb-3">{selectedProject.icon}</div>
                    <h3 className="font-syne font-bold text-2xl text-white">
                      {selectedProject.name}
                    </h3>
                  </div>
                  <button
                    onClick={() => setSelectedProject(null)}
                    className="text-text-muted hover:text-white text-2xl"
                    aria-label="Close modal"
                  >
                    âœ•
                  </button>
                </div>
                <div className="flex flex-wrap gap-2 mb-4">
                  {selectedProject.tags.map((tag) => (
                    <span
                      key={tag}
                      className="px-3 py-1 rounded-full text-sm font-dm bg-violet/10 border border-violet/30 text-violet-light"
                    >
                      {tag}
                    </span>
                  ))}
                </div>
                <div className="inline-block px-4 py-2 rounded-full bg-emerald/10 border border-emerald/30 text-emerald text-sm font-dm mb-6">
                  ðŸŽ¯ {selectedProject.metric}
                </div>
                <p className="font-dm text-text-muted leading-relaxed">
                  {selectedProject.longDesc}
                </p>
              </motion.div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </section>
  )
}