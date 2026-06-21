export interface Project {
  id: string
  icon: string
  name: string
  category: string
  tags: string[]
  metric: string
  shortDesc: string
  longDesc: string
}

export interface Testimonial {
  initials: string
  name: string
  role: string
  quote: string
}

export interface Product {
  badge: string
  badgeColor: string
  name: string
  desc: string
  format: string
  waMsg: string
}

export interface Course {
  title: string
  desc: string
  duration: string
  audience: string
  outcomes: string[]
  waMsg: string
}

export interface Integration {
  abbr: string
  name: string
  color: "violet" | "blue" | "emerald" | "amber" | "rose" | "cyan"
}

export interface ChatMessage {
  role: "user" | "assistant"
  content: string
}

export interface ROIResults {
  monthlyGain: number
  annualGain: number
  extraClients: number
  roi: number
}

export interface GlassCardProps {
  children: React.ReactNode
  className?: string
}

export interface RevealProps {
  children: React.ReactNode
  delay?: number
}