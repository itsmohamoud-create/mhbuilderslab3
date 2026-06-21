import type { Metadata } from "next"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"

export const metadata: Metadata = {
  title: "Blog | MH Builders Lab",
  description: "Insights, tutorials, and strategies for digital business growth.",
  openGraph: {
    title: "Blog | MH Builders Lab",
    description: "Insights, tutorials, and strategies for digital business growth.",
    url: "https://mhbuilderslab.com/blog",
  },
}

const BLOG_POSTS = [
  {
    title: "How AI Automation Saved a Restaurant 30 Hours Per Week",
    excerpt: "A real case study showing how we automated orders, reservations, and inventory for a Mombasa restaurant.",
    category: "Case Study",
    date: "Dec 15, 2025",
  },
  {
    title: "The 10-Day Website: Our Proven Process",
    excerpt: "Behind the scenes of how we deliver production-ready websites in just 10 business days.",
    category: "Process",
    date: "Dec 10, 2025",
  },
  {
    title: "Local SEO in 2026: What Actually Works",
    excerpt: "Forget outdated tactics. Here's the SEO strategy that's getting our clients to page 1.",
    category: "SEO",
    date: "Dec 5, 2025",
  },
]

export default function BlogPage() {
  return (
    <main className="pt-24 pb-24 px-6">
      <div className="max-w-4xl mx-auto">
        <div className="text-center mb-16">
          <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
            The <GradientText>Lab Notes</GradientText>
          </h1>
          <p className="font-dm text-lg text-text-muted">
            Insights, tutorials, and strategies from the front lines of digital transformation.
          </p>
        </div>

        <div className="space-y-6">
          {BLOG_POSTS.map((post, index) => (
            <RevealWrapper key={post.title} delay={index * 0.1}>
              <article>
                <GlassCard className="p-6 md:p-8 hover:border-violet/30">
                  <div className="flex items-center gap-3 mb-3">
                    <span className="px-3 py-1 rounded-full text-xs font-dm bg-violet/10 border border-violet/30 text-violet-light">
                      {post.category}
                    </span>
                    <span className="font-dm text-xs text-text-faint">{post.date}</span>
                  </div>
                  <h2 className="font-syne font-bold text-xl text-white mb-3">
                    {post.title}
                  </h2>
                  <p className="font-dm text-text-muted leading-relaxed">
                    {post.excerpt}
                  </p>
                  <div className="mt-4">
                    <span className="font-dm text-sm text-violet-light hover:text-violet-light/80 transition-colors cursor-pointer">
                      Read more â†’
                    </span>
                  </div>
                </GlassCard>
              </article>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </main>
  )
}