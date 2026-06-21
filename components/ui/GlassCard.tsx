import { cn } from "@/lib/utils"
import type { GlassCardProps } from "@/lib/types"

export default function GlassCard({ children, className }: GlassCardProps) {
  return (
    <div className={cn(
      "rounded-2xl border backdrop-blur-xl",
      "bg-white/[0.04] border-white/[0.08]",
      "transition-all duration-300",
      "hover:-translate-y-1 hover:border-violet/30 hover:shadow-[0_0_40px_rgba(124,58,237,0.12)]",
      className
    )}>
      {children}
    </div>
  )
}