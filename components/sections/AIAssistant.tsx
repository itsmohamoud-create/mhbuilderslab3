"use client"
import { useState } from "react"
import { motion, useReducedMotion } from "framer-motion"
import GlassCard from "@/components/ui/GlassCard"
import SectionLabel from "@/components/ui/SectionLabel"
import type { ChatMessage } from "@/lib/types"

const QUICK_REPLIES = [
  "What services do you offer?",
  "How much does a website cost?",
  "Can you help with AI automation?",
]

export default function AIAssistant() {
  const [messages, setMessages] = useState<ChatMessage[]>([])
  const [input, setInput] = useState("")
  const [loading, setLoading] = useState(false)
  const [showQuickReplies, setShowQuickReplies] = useState(true)
  const reduced = useReducedMotion()

  const sendMessage = async (content: string) => {
    if (!content.trim() || loading) return
    setLoading(true)
    setShowQuickReplies(false)
    const updated: ChatMessage[] = [...messages, { role: "user", content }]
    setMessages(updated)
    setInput("")

    try {
      const res = await fetch("/api/chat", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ messages: updated }),
      })
      if (!res.ok) throw new Error("Network error")
      const data = await res.json()
      setMessages((prev) => [...prev, { role: "assistant", content: data.content }])
    } catch {
      setMessages((prev) => [
        ...prev,
        {
          role: "assistant",
          content:
            "Something went wrong on my end. Please reach us directly on WhatsApp at +254 723 783 337!",
        },
      ])
    } finally {
      setLoading(false)
    }
  }

  return (
    <section id="ask" className="py-24 px-6">
      <div className="max-w-[760px] mx-auto">
        <div className="text-center mb-12">
          <SectionLabel>Ask Us Anything</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Meet <span className="bg-gradient-to-r from-violet-light to-cyan-light bg-clip-text text-transparent">MH Assistant</span>
          </h2>
        </div>

        <GlassCard className="overflow-hidden">
          <div className="px-6 py-4 border-b border-white/[0.08] flex items-center gap-3">
            <div className="w-10 h-10 rounded-full bg-gradient-to-br from-violet to-cyan flex items-center justify-center text-lg">
              ðŸ¤–
            </div>
            <div>
              <div className="font-syne font-bold text-white text-sm">MH Assistant</div>
              <div className="font-dm text-xs text-text-muted flex items-center gap-2">
                Powered by Claude AI Â· Always online
                {!reduced && (
                  <span className="w-2 h-2 rounded-full bg-emerald animate-pulse" />
                )}
              </div>
            </div>
          </div>

          <div className="h-[280px] overflow-y-auto p-6 space-y-4">
            {messages.length === 0 && showQuickReplies && (
              <div className="text-center py-8">
                <p className="font-dm text-text-muted text-sm mb-4">
                  Ask me anything about our services, pricing, or process
                </p>
                <div className="flex flex-wrap gap-2 justify-center">
                  {QUICK_REPLIES.map((reply) => (
                    <button
                      key={reply}
                      onClick={() => sendMessage(reply)}
                      className="px-4 py-2 rounded-full border border-white/[0.08] text-sm font-dm text-text-muted hover:bg-white/[0.07] transition-colors"
                    >
                      {reply}
                    </button>
                  ))}
                </div>
              </div>
            )}

            {messages.map((msg, i) => (
              <div
                key={i}
                className={`flex ${msg.role === "user" ? "justify-end" : "justify-start"}`}
              >
                <div
                  className={`max-w-[80%] px-4 py-3 rounded-2xl font-dm text-sm ${
                    msg.role === "user"
                      ? "bg-gradient-to-r from-violet to-cyan text-white rounded-br-md"
                      : "bg-white/[0.04] border border-white/[0.08] text-text-base rounded-bl-md"
                  }`}
                >
                  {msg.content}
                </div>
              </div>
            ))}

            {loading && (
              <div className="flex justify-start">
                <div className="bg-white/[0.04] border border-white/[0.08] px-4 py-3 rounded-2xl rounded-bl-md">
                  {!reduced ? (
                    <div className="flex gap-1">
                      {[0, 1, 2].map((i) => (
                        <motion.span
                          key={i}
                          className="w-2 h-2 rounded-full bg-violet"
                          animate={{ y: [0, -8, 0], opacity: [0.4, 1, 0.4] }}
                          transition={{ duration: 0.8, repeat: Infinity, delay: i * 0.2 }}
                        />
                      ))}
                    </div>
                  ) : (
                    <span className="font-dm text-sm text-text-muted">Thinking...</span>
                  )}
                </div>
              </div>
            )}
          </div>

          <div className="px-6 py-4 border-t border-white/[0.08] flex gap-3">
            <input
              type="text"
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={(e) => e.key === "Enter" && sendMessage(input)}
              placeholder="Type your question..."
              className="flex-1 bg-white/[0.04] border border-white/[0.08] rounded-full px-4 py-2.5 font-dm text-sm text-white placeholder:text-text-faint focus:outline-none focus:border-violet/50"
            />
            <button
              onClick={() => sendMessage(input)}
              disabled={loading || !input.trim()}
              className="bg-gradient-to-r from-violet to-cyan text-white rounded-full px-6 py-2.5 font-dm text-sm font-medium disabled:opacity-50 disabled:cursor-not-allowed hover:shadow-[0_8px_32px_rgba(124,58,237,0.35)] transition-all"
            >
              Send â†’
            </button>
          </div>
        </GlassCard>
      </div>
    </section>
  )
}