#Requires -Version 5.1
# ═══════════════════════════════════════════════════════════════
# MH BUILDERS LAB — COMPLETE PROJECT GENERATOR (PowerShell)
# Run: Right-click → "Run with PowerShell"  OR  pwsh ./setup.ps1
# ═══════════════════════════════════════════════════════════════

$ErrorActionPreference = "Stop"
$PROJECT_NAME = "mhbuilderslab"

Write-Host "Creating MH Builders Lab project..." -ForegroundColor Cyan

# Create project directory
New-Item -ItemType Directory -Force -Path $PROJECT_NAME | Out-Null
Set-Location $PROJECT_NAME

# ═══════════════════════════════════════════════════════════════
# HELPER FUNCTION: Write file with UTF-8 (no BOM) encoding
# ═══════════════════════════════════════════════════════════════
function Write-ProjectFile {
    param(
        [string]$Path,
        [string]$Content
    )
    # Resolve to a full path relative to the CURRENT location every time.
    # This avoids .NET's WriteAllText silently using a stale/different
    # working directory than PowerShell's Set-Location.
    $fullPath = Join-Path -Path (Get-Location).Path -ChildPath $Path
    $dir = Split-Path -Parent $fullPath
    if ($dir -and !(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($fullPath, $Content, $utf8NoBom)
}

# ═══════════════════════════════════════════════════════════════
# CONFIG FILES
# ═══════════════════════════════════════════════════════════════
Write-ProjectFile -Path "package.json" -Content @'
{
  "name": "mhbuilderslab",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev --turbopack",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "^15.0.0",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "framer-motion": "^11.0.0",
    "lucide-react": "^0.400.0",
    "@radix-ui/react-dialog": "^1.1.0",
    "@radix-ui/react-navigation-menu": "^1.2.0",
    "@radix-ui/react-accordion": "^1.2.0",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.1.0",
    "tailwind-merge": "^2.5.0",
    "@anthropic-ai/sdk": "^0.30.0"
  },
  "devDependencies": {
    "@types/node": "^22.0.0",
    "@types/react": "^19.0.0",
    "@types/react-dom": "^19.0.0",
    "typescript": "^5.6.0",
    "tailwindcss": "^4.0.0",
    "@tailwindcss/postcss": "^4.0.0",
    "postcss": "^8.4.0"
  }
}
'@

Write-ProjectFile -Path "tsconfig.json" -Content @'
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [{ "name": "next" }],
    "paths": { "@/*": ["./*"] },
    "noImplicitAny": true
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
'@

Write-ProjectFile -Path "next.config.ts" -Content @'
import type { NextConfig } from "next"
const nextConfig: NextConfig = {
  images: {
    formats: ["image/avif", "image/webp"],
  },
}
export default nextConfig
'@

Write-ProjectFile -Path "postcss.config.mjs" -Content @'
/** @type {import('postcss-load-config').Config} */
const config = {
  plugins: {
    "@tailwindcss/postcss": {},
  },
};
export default config;
'@

Write-ProjectFile -Path ".env.local" -Content @'
ANTHROPIC_API_KEY=your_key_here
'@

Write-ProjectFile -Path ".gitignore" -Content @'
node_modules/
.next/
out/
.env.local
.env*.local
*.tsbuildinfo
next-env.d.ts
'@

# ═══════════════════════════════════════════════════════════════
# PUBLIC ASSETS
# ═══════════════════════════════════════════════════════════════
New-Item -ItemType Directory -Force -Path "public" | Out-Null

Write-ProjectFile -Path "public/logo.svg" -Content @'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 280 80" fill="none">
  <defs>
    <linearGradient id="logoGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#7C3AED"/>
      <stop offset="50%" style="stop-color:#06B6D4"/>
      <stop offset="100%" style="stop-color:#3B82F6"/>
    </linearGradient>
  </defs>
  <rect x="0" y="10" width="60" height="60" rx="15" fill="url(#logoGrad)"/>
  <text x="30" y="52" font-family="Arial, sans-serif" font-size="32" font-weight="bold" fill="white" text-anchor="middle">MH</text>
  <text x="75" y="38" font-family="Arial, sans-serif" font-size="22" font-weight="bold" fill="#f0eff8">MH Builders</text>
  <text x="75" y="58" font-family="Arial, sans-serif" font-size="14" fill="#a78bfa">LAB</text>
</svg>
'@

Write-ProjectFile -Path "public/favicon.svg" -Content @'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" fill="none">
  <defs>
    <linearGradient id="favGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#7C3AED"/>
      <stop offset="100%" style="stop-color:#06B6D4"/>
    </linearGradient>
  </defs>
  <rect width="32" height="32" rx="8" fill="url(#favGrad)"/>
  <text x="16" y="23" font-family="Arial, sans-serif" font-size="18" font-weight="bold" fill="white" text-anchor="middle">M</text>
</svg>
'@

Write-ProjectFile -Path "public/logo.png" -Content @'
PNG placeholder - Replace with actual logo from designer
'@

Write-ProjectFile -Path "public/mo.png" -Content @'
PNG placeholder - Replace with founder photo
'@

# ═══════════════════════════════════════════════════════════════
# CREATE DIRECTORY STRUCTURE
# ═══════════════════════════════════════════════════════════════
$dirs = @(
    "app/api/chat",
    "app/services",
    "app/portfolio",
    "app/about",
    "app/products",
    "app/courses",
    "app/blog",
    "components/layout",
    "components/sections",
    "components/ui",
    "lib"
)
foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

# ═══════════════════════════════════════════════════════════════
# GLOBAL STYLES
# ═══════════════════════════════════════════════════════════════
Write-ProjectFile -Path "app/globals.css" -Content @'
@import "tailwindcss";

@layer base {
  :root {
    --bg:            #0A0A0F;
    --bg2:           #0f0f18;
    --bg3:           #13131f;
    --glass:         rgba(255,255,255,0.04);
    --glass-border:  rgba(255,255,255,0.08);
    --glass-hover:   rgba(255,255,255,0.07);
    --text:          #f0eff8;
    --text-muted:    rgba(240,239,248,0.55);
    --text-faint:    rgba(240,239,248,0.30);
    --violet:        #7C3AED;
    --violet-light:  #a78bfa;
    --cyan:          #06B6D4;
    --cyan-light:    #67e8f9;
    --blue:          #3B82F6;
    --emerald:       #10B981;
    --amber:         #F59E0B;
    --rose:          #F43F5E;
    --grad-text:     linear-gradient(135deg, #a78bfa 0%, #67e8f9 50%, #93c5fd 100%);
    --grad-btn:      linear-gradient(135deg, #7C3AED, #06B6D4);
  }
}

@theme {
  --color-bg-base: var(--bg);
  --color-bg2: var(--bg2);
  --color-bg3: var(--bg3);
  --color-text-base: var(--text);
  --color-text-muted: var(--text-muted);
  --color-text-faint: var(--text-faint);
  --color-violet: var(--violet);
  --color-violet-light: var(--violet-light);
  --color-cyan: var(--cyan);
  --color-cyan-light: var(--cyan-light);
  --color-blue: var(--blue);
  --color-emerald: var(--emerald);
  --color-amber: var(--amber);
  --color-rose: var(--rose);
  --font-syne: var(--font-syne), sans-serif;
  --font-dm: var(--font-dm-sans), sans-serif;
}

html {
  scroll-behavior: smooth;
}

body {
  background: var(--bg);
  color: var(--text);
  font-family: var(--font-dm-sans), sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  overflow-x: hidden;
}

.grid-pattern {
  background-image: 
    linear-gradient(rgba(124, 58, 237, 0.03) 1px, transparent 1px),
    linear-gradient(90deg, rgba(124, 58, 237, 0.03) 1px, transparent 1px);
  background-size: 60px 60px;
  mask-image: radial-gradient(ellipse at center, black 30%, transparent 70%);
}

@keyframes ticker {
  from { transform: translateX(0); }
  to { transform: translateX(-50%); }
}

.ticker-row {
  animation: ticker 35s linear infinite;
}

.ticker-row-reverse {
  animation: ticker 40s linear infinite reverse;
}

@media (prefers-reduced-motion: reduce) {
  .ticker-row,
  .ticker-row-reverse {
    animation: none;
  }
}

::-webkit-scrollbar {
  width: 8px;
}

::-webkit-scrollbar-track {
  background: var(--bg);
}

::-webkit-scrollbar-thumb {
  background: rgba(124, 58, 237, 0.3);
  border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
  background: rgba(124, 58, 237, 0.5);
}
'@

# ═══════════════════════════════════════════════════════════════
# LIBRARY FILES
# ═══════════════════════════════════════════════════════════════
Write-ProjectFile -Path "lib/types.ts" -Content @'
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
'@

Write-ProjectFile -Path "lib/animations.ts" -Content @'
export const fadeUp = {
  hidden: { opacity: 0, y: 28 },
  visible: (delay = 0) => ({
    opacity: 1, y: 0,
    transition: { duration: 0.7, ease: "easeOut" as const, delay }
  })
}

export const staggerContainer = {
  hidden: {},
  visible: { transition: { staggerChildren: 0.1 } }
}

export const orbFloat = {
  animate: {
    y: [0, -30, 0],
    scale: [1, 1.05, 1],
    transition: { duration: 8, repeat: Infinity, ease: "easeInOut" as const }
  }
}

export const pulseDot = {
  animate: {
    opacity: [1, 0.6, 1],
    scale: [1, 1.3, 1],
    transition: { duration: 2, repeat: Infinity }
  }
}

export const slideIn = {
  initial: { opacity: 0, x: 60 },
  animate: { opacity: 1, x: 0 },
  exit:    { opacity: 0, x: -60 },
  transition: { duration: 0.4, ease: "easeOut" as const }
}
'@

Write-ProjectFile -Path "lib/constants.ts" -Content @'
import type { Project, Testimonial, Product, Course, Integration } from "./types"

export const WA_LINK = "https://wa.me/254723783337"
export const EMAIL   = "itsmohamoud@gmail.com"
export const PHONE   = "+254 723 783 337"
export const SITE_URL = "https://mhbuilderslab.com"
export const CALENDLY = "https://calendly.com/itsmohamoud"

export const PROJECTS: Project[] = [
  {
    id: "lumina",
    icon: "🏠",
    name: "Lumina Realty",
    category: "Websites",
    tags: ["Website", "SEO"],
    metric: "+280% organic traffic",
    shortDesc: "Property agency site with integrated listings, booking & local SEO",
    longDesc: "Full property agency website with MLS-style listings, appointment booking, local SEO, and a custom lead capture funnel. Ranked on page 1 for 14 local keywords within 60 days of launch.",
  },
  {
    id: "shiftsync",
    icon: "📱",
    name: "ShiftSync",
    category: "Apps",
    tags: ["App", "Systems"],
    metric: "15h saved/week",
    shortDesc: "Staff scheduling app for multi-location businesses",
    longDesc: "Custom React Native + Next.js web app handling shift scheduling, availability tracking, and automated WhatsApp notifications for a 4-location hospitality group.",
  },
  {
    id: "fitflow",
    icon: "🎯",
    name: "FitFlow Studio",
    category: "Marketing",
    tags: ["Marketing", "Ads"],
    metric: "$4.20 ROAS",
    shortDesc: "Meta ads campaign with high-converting funnel",
    longDesc: "Complete paid media strategy: Meta ads, landing page optimisation, email follow-up sequence. Achieved $4.20 ROAS in month one and cut cost-per-lead by 58%.",
  },
  {
    id: "retailpulse",
    icon: "🤖",
    name: "RetailPulse",
    category: "AI & Auto",
    tags: ["AI/Auto", "Systems"],
    metric: "22h saved/week",
    shortDesc: "AI inventory management with auto reorder",
    longDesc: "n8n + OpenAI automation that monitors stock levels, predicts reorder points from sales velocity, and automatically raises POs. Integrated with Shopify and a local ERP system.",
  },
  {
    id: "serviceflow",
    icon: "⚡",
    name: "ServiceFlow AI",
    category: "AI & Auto",
    tags: ["AI/Auto", "CRM"],
    metric: "30h saved/week",
    shortDesc: "End-to-end business automation + CRM sync",
    longDesc: "Full-stack automation for a service business: AI voice agent handles inbound calls, qualifies leads, books appointments into Google Calendar, syncs to HubSpot, and triggers a WhatsApp follow-up sequence.",
  },
  {
    id: "aura",
    icon: "✨",
    name: "Aura Wellness",
    category: "Branding",
    tags: ["Branding", "Content"],
    metric: "2× pricing power",
    shortDesc: "Full brand identity overhaul, premium positioning",
    longDesc: "Complete brand identity: logo, colour system, typography, brand guidelines, social templates, and website redesign. Repositioned as a premium brand — enabled a 2× price increase with zero client churn.",
  },
]

export const TESTIMONIALS: Testimonial[] = [
  {
    initials: "AT",
    name: "Amara T.",
    role: "E-commerce Founder, Lagos",
    quote: "MH Builders Lab transformed our online store. The automation system alone saves us 15 hours a week. Revenue is up 3x since we started working together. Mohamud genuinely cares about your results.",
  },
  {
    initials: "JK",
    name: "James K.",
    role: "Contractor, Nairobi",
    quote: "Finally, a team that understands construction businesses. Our new site ranks number 1 for 'contractors Nairobi' and leads come in daily without ad spend. Best investment we've made in years.",
  },
  {
    initials: "PS",
    name: "Priya S.",
    role: "Business Coach, London",
    quote: "The course platform they built is incredible. I launched my first digital product and made back my investment in the first week. The attention to detail and quality of work is world-class.",
  },
  {
    initials: "JM",
    name: "James Mwangi",
    role: "Restaurant Owner, Mombasa",
    quote: "Our online orders increased 200% after the new website went live. The WhatsApp automation handles everything now. From concept to launch in 10 days — exceeded every expectation.",
  },
  {
    initials: "JS",
    name: "Jamal Sayed",
    role: "Real Estate Agent, Dubai",
    quote: "Professional, fast, and they actually understand marketing. The lead generation system brings in 30+ qualified buyers every month completely on autopilot.",
  },
  {
    initials: "AN",
    name: "Ayan Noor",
    role: "Healthcare CEO, Nairobi",
    quote: "From concept to launch in 3 weeks. The app handles 500+ appointments daily without a single issue. The AI automation is next level — I only wish I found MH Builders Lab sooner.",
  },
]

export const PRODUCTS: Product[] = [
  {
    badge: "AI Automation",
    badgeColor: "cyan",
    name: "The Automation Starter Kit",
    desc: "15 ready-to-deploy n8n/Make automation workflows for small businesses.",
    format: "Workflow files + setup guide PDF",
    waMsg: "Hi, I want The Automation Starter Kit",
  },
  {
    badge: "Web Dev",
    badgeColor: "violet",
    name: "Website Launch Pack",
    desc: "Next.js starter template (dark, modern, mobile-first) + Figma design file.",
    format: "Code + Figma",
    waMsg: "Hi, I want Website Launch Pack",
  },
  {
    badge: "SEO",
    badgeColor: "emerald",
    name: "SEO Domination Guide",
    desc: "90-day local SEO playbook for service businesses. Checklists, templates, trackers.",
    format: "PDF + Notion template",
    waMsg: "Hi, I want The SEO Domination Guide",
  },
  {
    badge: "AI Tools",
    badgeColor: "cyan",
    name: "AI Prompt Library for Business",
    desc: "200+ tested ChatGPT/Claude prompts for marketing, sales, ops, and content.",
    format: "Notion database",
    waMsg: "Hi, I want AI Prompt Library for Business",
  },
  {
    badge: "Business Systems",
    badgeColor: "amber",
    name: "CRM in Notion — Business OS",
    desc: "Full client management: pipeline, invoicing, onboarding, follow-ups.",
    format: "Notion template",
    waMsg: "Hi, I want CRM in Notion Business OS",
  },
  {
    badge: "Marketing",
    badgeColor: "rose",
    name: "Digital Marketing Funnel Blueprint",
    desc: "Funnel map + email sequence templates + ad copy swipe file.",
    format: "PDF + Notion",
    waMsg: "Hi, I want Digital Marketing Funnel Blueprint",
  },
]

export const COURSES: Course[] = [
  {
    title: "Website Builder Bootcamp",
    desc: "Build professional websites from scratch, even as a complete beginner.",
    duration: "7 days",
    audience: "Beginners",
    outcomes: ["HTML/CSS Fundamentals", "Modern JavaScript", "Next.js Basics", "Deployment & Launch"],
    waMsg: "Hi, I want to join the Website Builder Bootcamp waitlist",
  },
  {
    title: "AI Business Automation 101",
    desc: "Automate your business operations using AI — no coding required.",
    duration: "5 days",
    audience: "Business owners",
    outcomes: ["Automation Fundamentals", "n8n/Make Setup", "AI Integration", "Workflow Templates"],
    waMsg: "Hi, I want to join the AI Business Automation 101 waitlist",
  },
  {
    title: "Digital Marketing Mastery",
    desc: "Master paid ads, SEO, funnels and email marketing from first principles.",
    duration: "14 days",
    audience: "Entrepreneurs",
    outcomes: ["Marketing Foundations", "Paid Ads Mastery", "SEO & Content", "Funnels & Conversion"],
    waMsg: "Hi, I want to join the Digital Marketing Mastery waitlist",
  },
]

export const INTEGRATIONS_ROW1: Integration[] = [
  { abbr: "HS", name: "HubSpot",       color: "violet" },
  { abbr: "SF", name: "Salesforce",    color: "violet" },
  { abbr: "ZC", name: "Zoho CRM",      color: "violet" },
  { abbr: "PD", name: "Pipedrive",     color: "violet" },
  { abbr: "GH", name: "GoHighLevel",   color: "violet" },
  { abbr: "MN", name: "Monday.com",    color: "violet" },
  { abbr: "GC", name: "Google Cal",    color: "blue"   },
  { abbr: "OL", name: "Outlook",       color: "blue"   },
  { abbr: "CL", name: "Calendly",      color: "blue"   },
  { abbr: "WA", name: "WhatsApp",      color: "emerald"},
  { abbr: "TW", name: "Twilio",        color: "emerald"},
  { abbr: "SL", name: "Slack",         color: "emerald"},
  { abbr: "MA", name: "Meta Ads",      color: "amber"  },
  { abbr: "GA", name: "Google Ads",    color: "amber"  },
  { abbr: "TT", name: "TikTok Ads",    color: "amber"  },
  { abbr: "MC", name: "Mailchimp",     color: "rose"   },
  { abbr: "AC", name: "ActiveCampaign",color: "rose"   },
  { abbr: "AI", name: "OpenAI",        color: "cyan"   },
  { abbr: "N8", name: "n8n",           color: "cyan"   },
  { abbr: "MK", name: "Make.com",      color: "cyan"   },
]

export const INTEGRATIONS_ROW2: Integration[] = [
  { abbr: "ZP", name: "Zapier",        color: "cyan"   },
  { abbr: "RA", name: "Retell AI",     color: "cyan"   },
  { abbr: "TF", name: "Typeform",      color: "blue"   },
  { abbr: "JF", name: "Jotform",       color: "blue"   },
  { abbr: "GS", name: "Google Sheets", color: "emerald"},
  { abbr: "AT", name: "Airtable",      color: "emerald"},
  { abbr: "NT", name: "Notion",        color: "blue"   },
  { abbr: "MS", name: "Microsoft 365", color: "blue"   },
  { abbr: "ST", name: "Stripe",        color: "violet" },
  { abbr: "SQ", name: "Square",        color: "violet" },
  { abbr: "PP", name: "PayPal",        color: "blue"   },
  { abbr: "SP", name: "Shopify",       color: "emerald"},
  { abbr: "WF", name: "Webflow",       color: "cyan"   },
  { abbr: "WP", name: "WordPress",     color: "blue"   },
  { abbr: "KL", name: "Klaviyo",       color: "rose"   },
  { abbr: "BR", name: "Brevo",         color: "rose"   },
  { abbr: "LI", name: "LinkedIn Ads",  color: "amber"  },
  { abbr: "GM", name: "Gmail",         color: "emerald"},
  { abbr: "FB", name: "FB Messenger",  color: "emerald"},
  { abbr: "CV", name: "ConvertKit",    color: "rose"   },
]
'@

Write-ProjectFile -Path "lib/utils.ts" -Content @'
import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
'@

Write-Host "Library files created" -ForegroundColor Green

# ═══════════════════════════════════════════════════════════════
# UI COMPONENTS
# ═══════════════════════════════════════════════════════════════
Write-ProjectFile -Path "components/ui/GlassCard.tsx" -Content @'
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
'@

Write-ProjectFile -Path "components/ui/GradientText.tsx" -Content @'
export default function GradientText({ children }: { children: React.ReactNode }) {
  return (
    <span className="bg-gradient-to-r from-violet-light via-cyan-light to-blue-300 bg-clip-text text-transparent">
      {children}
    </span>
  )
}
'@

Write-ProjectFile -Path "components/ui/RevealWrapper.tsx" -Content @'
"use client"
import { motion, useInView, useReducedMotion } from "framer-motion"
import { useRef } from "react"
import type { RevealProps } from "@/lib/types"

export default function RevealWrapper({ children, delay = 0 }: RevealProps) {
  const ref = useRef(null)
  const inView = useInView(ref, { once: true, margin: "-80px" })
  const reduced = useReducedMotion()
  return (
    <motion.div
      ref={ref}
      initial={reduced ? {} : { opacity: 0, y: 28 }}
      animate={inView ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.7, ease: "easeOut", delay: reduced ? 0 : delay }}
    >
      {children}
    </motion.div>
  )
}
'@

Write-ProjectFile -Path "components/ui/AmbientOrbs.tsx" -Content @'
"use client"
import { motion, useReducedMotion } from "framer-motion"

export default function AmbientOrbs() {
  const reduced = useReducedMotion()
  
  if (reduced) return null

  return (
    <>
      <motion.div
        className="fixed top-0 left-0 w-[600px] h-[600px] bg-violet/20 rounded-full blur-[120px] pointer-events-none z-0"
        animate={{ y: [0, -30, 0], scale: [1, 1.05, 1] }}
        transition={{ duration: 8, repeat: Infinity, ease: "easeInOut" }}
      />
      <motion.div
        className="fixed top-0 right-0 w-[500px] h-[500px] bg-cyan/15 rounded-full blur-[120px] pointer-events-none z-0"
        animate={{ y: [0, -30, 0], scale: [1, 1.05, 1] }}
        transition={{ duration: 8, repeat: Infinity, ease: "easeInOut", delay: 2.5 }}
      />
      <motion.div
        className="fixed bottom-0 left-0 w-[400px] h-[400px] bg-blue/15 rounded-full blur-[120px] pointer-events-none z-0"
        animate={{ y: [0, -30, 0], scale: [1, 1.05, 1] }}
        transition={{ duration: 8, repeat: Infinity, ease: "easeInOut", delay: 5 }}
      />
    </>
  )
}
'@

Write-ProjectFile -Path "components/ui/SectionLabel.tsx" -Content @'
export default function SectionLabel({ children }: { children: React.ReactNode }) {
  return (
    <p className="font-dm text-[0.82rem] tracking-[0.15em] uppercase text-violet-light mb-4">
      {children}
    </p>
  )
}
'@

Write-Host "UI components created" -ForegroundColor Green

# ═══════════════════════════════════════════════════════════════
# LAYOUT COMPONENTS
# ═══════════════════════════════════════════════════════════════
Write-ProjectFile -Path "components/layout/Navbar.tsx" -Content @'
"use client"
import { useState } from "react"
import { motion, AnimatePresence } from "framer-motion"
import Image from "next/image"
import Link from "next/link"
import { WA_LINK, CALENDLY } from "@/lib/constants"

const NAV_LINKS = [
  { href: "/", label: "Home" },
  { href: "/#services", label: "Services" },
  { href: "/#industries", label: "Industries" },
  { href: "/#portfolio", label: "Portfolio" },
  { href: "/about", label: "About" },
  { href: "/blog", label: "Blog" },
]

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false)

  return (
    <nav className="sticky top-0 z-[90] bg-[var(--bg)]/75 backdrop-blur-2xl border-b border-white/[0.08] h-[72px]">
      <div className="max-w-7xl mx-auto px-6 h-full flex items-center justify-between">
        <Link href="/" className="flex items-center gap-3">
          <Image
            src="/logo.svg"
            alt="MH Builders Lab"
            width={140}
            height={40}
            priority
            className="h-10 w-auto"
          />
        </Link>

        <div className="hidden lg:flex items-center gap-8">
          {NAV_LINKS.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              className="font-dm text-sm text-text-muted hover:text-violet-light transition-colors"
            >
              {link.label}
            </Link>
          ))}
          <a
            href={CALENDLY}
            target="_blank"
            rel="noopener noreferrer"
            className="font-dm text-sm text-text-muted hover:text-violet-light transition-colors"
          >
            Schedule a Call
          </a>
        </div>

        <a
          href={WA_LINK}
          target="_blank"
          rel="noopener noreferrer"
          className="hidden lg:inline-flex bg-gradient-to-r from-violet to-cyan text-white rounded-full px-8 py-3.5 font-dm font-medium shadow-[0_8px_32px_rgba(124,58,237,0.35)] hover:shadow-[0_12px_40px_rgba(124,58,237,0.5)] hover:-translate-y-0.5 transition-all duration-250"
        >
          Book Free Demo
        </a>

        <button
          onClick={() => setIsOpen(!isOpen)}
          className="lg:hidden text-white p-2"
          aria-label="Toggle menu"
        >
          {isOpen ? "✕" : "☰"}
        </button>
      </div>

      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            className="lg:hidden fixed inset-0 top-[72px] bg-[var(--bg)]/98 backdrop-blur-2xl z-[95] flex flex-col items-center justify-center gap-6"
          >
            {NAV_LINKS.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                onClick={() => setIsOpen(false)}
                className="font-syne text-2xl font-bold text-white hover:text-violet-light transition-colors"
              >
                {link.label}
              </Link>
            ))}
            <a
              href={WA_LINK}
              target="_blank"
              rel="noopener noreferrer"
              onClick={() => setIsOpen(false)}
              className="mt-4 bg-gradient-to-r from-violet to-cyan text-white rounded-full px-8 py-3.5 font-dm font-medium"
            >
              Book Free Demo →
            </a>
          </motion.div>
        )}
      </AnimatePresence>
    </nav>
  )
}
'@

Write-ProjectFile -Path "components/layout/UrgencyBar.tsx" -Content @'
"use client"
import { motion, useReducedMotion } from "framer-motion"
import { WA_LINK } from "@/lib/constants"

export default function UrgencyBar() {
  const reduced = useReducedMotion()

  return (
    <div className="sticky top-0 z-[100] bg-gradient-to-r from-violet/15 to-cyan/15 border-b border-violet/20">
      <div className="max-w-7xl mx-auto px-6 py-2 flex items-center justify-center gap-3">
        {!reduced && (
          <motion.div
            className="w-2 h-2 rounded-full bg-emerald"
            animate={{ opacity: [1, 0.6, 1], scale: [1, 1.3, 1] }}
            transition={{ duration: 2, repeat: Infinity }}
          />
        )}
        <p className="font-dm text-[0.82rem] tracking-wide text-text-muted">
          10 client slots remaining this month — We only take on select projects to guarantee quality.
        </p>
        <a
          href={WA_LINK}
          target="_blank"
          rel="noopener noreferrer"
          className="font-dm text-[0.82rem] tracking-wide text-violet-light hover:text-violet-light/80 transition-colors"
        >
          Secure your spot →
        </a>
      </div>
    </div>
  )
}
'@

Write-ProjectFile -Path "components/layout/Footer.tsx" -Content @'
import Link from "next/link"
import Image from "next/image"
import { WA_LINK, EMAIL, PHONE } from "@/lib/constants"

export default function Footer() {
  return (
    <footer className="border-t border-white/[0.08] bg-[var(--bg)]">
      <div className="max-w-7xl mx-auto px-8 py-16 grid grid-cols-1 md:grid-cols-3 lg:grid-cols-5 gap-10">
        <div className="lg:col-span-1">
          <Image src="/logo.svg" alt="MH Builders Lab" width={140} height={40} className="mb-4" />
          <p className="font-dm text-sm text-text-muted leading-relaxed">
            AI-powered digital systems for small business growth. Built to build builders.
          </p>
          <div className="flex gap-3 mt-6">
            <a href={WA_LINK} target="_blank" rel="noopener noreferrer" className="text-text-muted hover:text-violet-light transition-colors" aria-label="WhatsApp">
              💬
            </a>
            <a href={`mailto:${EMAIL}`} className="text-text-muted hover:text-violet-light transition-colors" aria-label="Email">
              ✉️
            </a>
          </div>
        </div>

        <div>
          <h3 className="font-syne font-bold text-white mb-4">Services</h3>
          <ul className="space-y-2">
            {["Smart Websites", "App Development", "AI Automation", "Digital Marketing"].map((item) => (
              <li key={item}>
                <Link href="/#services" className="font-dm text-sm text-text-muted hover:text-violet-light transition-colors">
                  {item}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        <div>
          <h3 className="font-syne font-bold text-white mb-4">Industries</h3>
          <ul className="space-y-2">
            {["Real Estate", "Healthcare", "E-commerce", "Restaurants", "Contractors"].map((item) => (
              <li key={item}>
                <Link href="/#industries" className="font-dm text-sm text-text-muted hover:text-violet-light transition-colors">
                  {item}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        <div>
          <h3 className="font-syne font-bold text-white mb-4">Resources</h3>
          <ul className="space-y-2">
            {[
              { label: "Products", href: "/products" },
              { label: "Courses", href: "/courses" },
              { label: "Blog", href: "/blog" },
              { label: "Case Studies", href: "/#portfolio" },
            ].map((item) => (
              <li key={item.label}>
                <Link href={item.href} className="font-dm text-sm text-text-muted hover:text-violet-light transition-colors">
                  {item.label}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        <div>
          <h3 className="font-syne font-bold text-white mb-4">Contact</h3>
          <ul className="space-y-3">
            <li>
              <a href={`mailto:${EMAIL}`} className="font-dm text-sm text-text-muted hover:text-violet-light transition-colors">
                {EMAIL}
              </a>
            </li>
            <li>
              <a href={`tel:${PHONE.replace(/\s/g, "")}`} className="font-dm text-sm text-text-muted hover:text-violet-light transition-colors">
                {PHONE}
              </a>
            </li>
            <li>
              <a
                href={WA_LINK}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-block mt-2 bg-gradient-to-r from-violet to-cyan text-white rounded-full px-6 py-2.5 font-dm text-sm font-medium"
              >
                Book Free Demo
              </a>
            </li>
          </ul>
        </div>
      </div>

      <div className="border-t border-white/[0.08] py-6 px-8">
        <div className="max-w-7xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
          <p className="font-dm text-xs text-text-faint">
            © 2026 MH Builders Lab. All rights reserved. Built to build builders.
          </p>
          <div className="flex gap-6">
            <Link href="#" className="font-dm text-xs text-text-faint hover:text-violet-light transition-colors">
              Privacy Policy
            </Link>
            <Link href="#" className="font-dm text-xs text-text-faint hover:text-violet-light transition-colors">
              Terms of Service
            </Link>
          </div>
        </div>
      </div>
    </footer>
  )
}
'@

Write-Host "Layout components created" -ForegroundColor Green

# ═══════════════════════════════════════════════════════════════
# SECTION COMPONENTS
# ═══════════════════════════════════════════════════════════════
Write-ProjectFile -Path "components/sections/Hero.tsx" -Content @'
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import { WA_LINK } from "@/lib/constants"

const STATS = [
  { value: "10", label: "Days to go live" },
  { value: "20h+", label: "Saved per week" },
  { value: "3x", label: "Revenue growth" },
  { value: "50+", label: "Integrations" },
]

export default function Hero() {
  return (
    <section id="home" className="min-h-screen flex items-center justify-center relative overflow-hidden">
      <div className="absolute inset-0 grid-pattern" />
      
      <div className="relative z-10 max-w-6xl mx-auto px-6 py-32 text-center">
        <RevealWrapper>
          <div className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-violet/12 border border-violet/25 mb-8">
            <span className="w-2 h-2 rounded-full bg-emerald animate-pulse" />
            <span className="font-dm text-sm text-violet-light">
              Done-for-you digital systems for serious business growth
            </span>
          </div>
        </RevealWrapper>

        <RevealWrapper delay={0.1}>
          <h1 className="font-syne font-extrabold tracking-tight text-[clamp(2.8rem,6vw,5.2rem)] leading-[1.1] mb-6">
            Build. Automate.
            <br />
            <GradientText>Scale Beyond Limits.</GradientText>
          </h1>
        </RevealWrapper>

        <RevealWrapper delay={0.2}>
          <p className="font-dm font-light text-text-muted leading-loose max-w-2xl mx-auto text-lg mb-10">
            We engineer the digital systems that grow your business — high-converting websites, intelligent AI automations, apps, and growth marketing that turn traffic into revenue.
          </p>
        </RevealWrapper>

        <RevealWrapper delay={0.3}>
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-16">
            <a
              href={WA_LINK}
              target="_blank"
              rel="noopener noreferrer"
              className="bg-gradient-to-r from-violet to-cyan text-white rounded-full px-8 py-3.5 font-dm font-medium shadow-[0_8px_32px_rgba(124,58,237,0.35)] hover:shadow-[0_12px_40px_rgba(124,58,237,0.5)] hover:-translate-y-0.5 transition-all duration-250"
            >
              Book Free Demo →
            </a>
            <a
              href="#services"
              className="border border-white/[0.08] text-white rounded-full px-8 py-3.5 font-dm font-medium hover:bg-white/[0.07] transition-all duration-250"
            >
              Explore Services
            </a>
          </div>
        </RevealWrapper>

        <RevealWrapper delay={0.4}>
          <GlassCard className="p-8 max-w-3xl mx-auto">
            <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
              {STATS.map((stat) => (
                <div key={stat.label} className="text-center">
                  <div className="font-syne font-bold text-3xl md:text-4xl bg-gradient-to-r from-violet-light to-cyan-light bg-clip-text text-transparent">
                    {stat.value}
                  </div>
                  <div className="font-dm text-sm text-text-muted mt-1">
                    {stat.label}
                  </div>
                </div>
              ))}
            </div>
          </GlassCard>
        </RevealWrapper>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/IntegrationsTicker.tsx" -Content @'
"use client"
import { INTEGRATIONS_ROW1, INTEGRATIONS_ROW2 } from "@/lib/constants"
import SectionLabel from "@/components/ui/SectionLabel"

const COLOR_MAP: Record<string, string> = {
  violet: "border-violet/30 text-violet-light shadow-[0_0_12px_rgba(124,58,237,0.2)]",
  blue: "border-blue/30 text-blue-300 shadow-[0_0_12px_rgba(59,130,246,0.2)]",
  emerald: "border-emerald/30 text-emerald-300 shadow-[0_0_12px_rgba(16,185,129,0.2)]",
  amber: "border-amber/30 text-amber-300 shadow-[0_0_12px_rgba(245,158,11,0.2)]",
  rose: "border-rose/30 text-rose-300 shadow-[0_0_12px_rgba(244,63,94,0.2)]",
  cyan: "border-cyan/30 text-cyan-light shadow-[0_0_12px_rgba(6,182,212,0.2)]",
}

function IntegrationBadge({ abbr, name, color }: { abbr: string; name: string; color: string }) {
  return (
    <div className={`inline-flex items-center gap-2 px-4 py-2 rounded-full border mx-3 flex-shrink-0 ${COLOR_MAP[color]}`}>
      <span className="font-syne font-bold text-xs">{abbr}</span>
      <span className="font-dm text-xs">{name}</span>
    </div>
  )
}

export default function IntegrationsTicker() {
  const row1 = [...INTEGRATIONS_ROW1, ...INTEGRATIONS_ROW1]
  const row2 = [...INTEGRATIONS_ROW2, ...INTEGRATIONS_ROW2]

  return (
    <section className="py-12 overflow-hidden">
      <div className="text-center mb-8">
        <SectionLabel>Powered by & Integrates With 50+ Platforms</SectionLabel>
      </div>
      
      <div className="space-y-4">
        <div className="ticker-row flex whitespace-nowrap">
          {row1.map((item, i) => (
            <IntegrationBadge key={`${item.abbr}-${i}`} {...item} />
          ))}
        </div>
        <div className="ticker-row-reverse flex whitespace-nowrap">
          {row2.map((item, i) => (
            <IntegrationBadge key={`${item.abbr}-${i}`} {...item} />
          ))}
        </div>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/Services.tsx" -Content @'
"use client"
import { useState } from "react"
import { motion, AnimatePresence } from "framer-motion"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"

const SERVICES = [
  {
    icon: "🌐",
    title: "Digital Presence",
    color: "violet",
    description: "High-converting websites, landing pages, and web apps built for performance and growth.",
    tags: ["Websites", "Web Apps", "E-commerce", "Landing Pages"],
    details: [
      "Next.js & React development",
      "Mobile-first responsive design",
      "SEO-optimized architecture",
      "CMS integration (WordPress, Shopify, custom)",
      "Performance optimization (90+ Lighthouse)",
    ],
  },
  {
    icon: "🤖",
    title: "AI & Automation",
    color: "cyan",
    description: "Intelligent systems that eliminate manual work and scale your operations 24/7.",
    tags: ["AI Agents", "Workflow Automation", "CRM Integration", "Chatbots"],
    details: [
      "Custom AI chatbots & voice agents",
      "n8n/Make/Zapier workflow automation",
      "CRM setup & integration (HubSpot, Salesforce, etc.)",
      "Automated lead nurturing sequences",
      "Data processing & reporting automation",
    ],
  },
  {
    icon: "📈",
    title: "Growth & Marketing",
    color: "amber",
    description: "Data-driven marketing that generates qualified leads and measurable ROI.",
    tags: ["Paid Ads", "SEO", "Email Marketing", "Funnels"],
    details: [
      "Meta, Google & TikTok ad management",
      "Local & national SEO strategies",
      "Email marketing automation",
      "Conversion funnel optimization",
      "Analytics & reporting dashboards",
    ],
  },
  {
    icon: "🎯",
    title: "Build Your Own",
    color: "emerald",
    description: "Courses, templates, and digital products to empower you to build and grow independently.",
    tags: ["Courses", "Templates", "Digital Products", "Community"],
    details: [
      "Website builder bootcamp (7 days)",
      "AI automation masterclass",
      "Ready-to-use Notion templates",
      "SEO & marketing playbooks",
      "Private community access",
    ],
  },
]

const COLOR_CLASSES: Record<string, string> = {
  violet: "from-violet to-violet-light",
  cyan: "from-cyan to-cyan-light",
  amber: "from-amber to-amber-300",
  emerald: "from-emerald to-emerald-300",
}

export default function Services() {
  const [hoveredIndex, setHoveredIndex] = useState<number | null>(null)

  return (
    <section id="services" className="py-24 px-6">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>What We Build</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Four Systems. <GradientText>Scale Beyond Limits.</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {SERVICES.map((service, index) => (
            <RevealWrapper key={service.title} delay={index * 0.1}>
              <GlassCard
                className="group p-8 h-full"
                onMouseEnter={() => setHoveredIndex(index)}
                onMouseLeave={() => setHoveredIndex(null)}
              >
                <div className="text-4xl mb-4">{service.icon}</div>
                <h3 className="font-syne font-bold text-xl text-white mb-3">
                  {service.title}
                </h3>
                <p className="font-dm text-text-muted leading-relaxed mb-4">
                  {service.description}
                </p>
                <div className="flex flex-wrap gap-2 mb-4">
                  {service.tags.map((tag) => (
                    <span
                      key={tag}
                      className={`px-3 py-1 rounded-full text-xs font-dm bg-gradient-to-r ${COLOR_CLASSES[service.color]} bg-clip-text text-transparent border border-white/[0.08]`}
                    >
                      {tag}
                    </span>
                  ))}
                </div>
                <AnimatePresence>
                  {hoveredIndex === index && (
                    <motion.div
                      initial={{ opacity: 0, height: 0 }}
                      animate={{ opacity: 1, height: "auto" }}
                      exit={{ opacity: 0, height: 0 }}
                      transition={{ duration: 0.3 }}
                    >
                      <ul className="space-y-2 pt-4 border-t border-white/[0.08]">
                        {service.details.map((detail) => (
                          <li key={detail} className="flex items-start gap-2">
                            <span className="text-emerald mt-0.5">✓</span>
                            <span className="font-dm text-sm text-text-muted">{detail}</span>
                          </li>
                        ))}
                      </ul>
                    </motion.div>
                  )}
                </AnimatePresence>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/Industries.tsx" -Content @'
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"

const INDUSTRIES = [
  { icon: "🏨", label: "Hotels & Restaurants" },
  { icon: "💆", label: "Med Spas & Wellness" },
  { icon: "🏠", label: "Real Estate" },
  { icon: "⚖️", label: "Legal Services" },
  { icon: "🏥", label: "Healthcare" },
  { icon: "🛒", label: "E-commerce" },
  { icon: "🏗️", label: "Contractors" },
  { icon: "❤️", label: "Charities & NGOs" },
  { icon: "🎯", label: "Coaches" },
  { icon: "🚗", label: "Automotive" },
  { icon: "🎓", label: "Education" },
  { icon: "🚌", label: "Transport & Logistics" },
]

export default function Industries() {
  return (
    <section id="industries" className="py-24 px-6 bg-[var(--bg2)]">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>Who We Serve</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Built For <GradientText>Your Industry</GradientText>
          </h2>
        </div>

        <div className="flex flex-wrap gap-3 justify-center">
          {INDUSTRIES.map((industry, index) => (
            <RevealWrapper key={industry.label} delay={index * 0.05}>
              <GlassCard className="px-6 py-4 hover:border-cyan/30">
                <div className="flex items-center gap-3">
                  <span className="text-2xl">{industry.icon}</span>
                  <span className="font-dm text-sm font-medium text-white">{industry.label}</span>
                </div>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/HowItWorks.tsx" -Content @'
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"

const STEPS = [
  {
    number: "01",
    title: "Book Free Demo",
    description: "Schedule a 30-minute call. We'll analyze your business, identify gaps, and show you exactly what's possible — no commitment required.",
  },
  {
    number: "02",
    title: "We Build the System",
    description: "Our team designs and builds your complete digital system in just 10 days. Websites, automations, apps — delivered ready to deploy.",
  },
  {
    number: "03",
    title: "You Grow",
    description: "Launch with confidence. Watch your leads increase, manual work decrease, and revenue scale. We provide ongoing support as you expand.",
  },
]

export default function HowItWorks() {
  return (
    <section id="process" className="py-24 px-6">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>The Process</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Up & Running <GradientText>in 10 Days</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 relative">
          <div className="hidden md:block absolute top-24 left-[20%] right-[20%] h-px bg-gradient-to-r from-violet via-cyan to-blue" />

          {STEPS.map((step, index) => (
            <RevealWrapper key={step.number} delay={index * 0.15}>
              <div className="relative text-center">
                <div className="font-syne font-bold text-6xl bg-gradient-to-r from-violet-light to-cyan-light bg-clip-text text-transparent mb-6">
                  {step.number}
                </div>
                <GlassCard className="p-8">
                  <h3 className="font-syne font-bold text-xl text-white mb-3">
                    {step.title}
                  </h3>
                  <p className="font-dm text-text-muted leading-relaxed">
                    {step.description}
                  </p>
                </GlassCard>
              </div>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/Portfolio.tsx" -Content @'
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
                      <span className="font-dm text-white font-medium">View Case Study →</span>
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
                    ✕
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
                  🎯 {selectedProject.metric}
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
'@

Write-ProjectFile -Path "components/sections/Testimonials.tsx" -Content @'
"use client"
import { useState, useEffect, useCallback } from "react"
import { motion, AnimatePresence, useReducedMotion } from "framer-motion"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import SectionLabel from "@/components/ui/SectionLabel"
import { TESTIMONIALS } from "@/lib/constants"
import { slideIn } from "@/lib/animations"

export default function Testimonials() {
  const [currentIndex, setCurrentIndex] = useState(0)
  const [isPaused, setIsPaused] = useState(false)
  const reduced = useReducedMotion()

  const nextSlide = useCallback(() => {
    setCurrentIndex((prev) => (prev + 1) % TESTIMONIALS.length)
  }, [])

  useEffect(() => {
    if (isPaused || reduced) return
    const interval = setInterval(nextSlide, 4000)
    return () => clearInterval(interval)
  }, [isPaused, nextSlide, reduced])

  return (
    <section id="testimonials" className="py-24 px-6">
      <div className="max-w-4xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>Testimonials</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Trusted by <GradientText>Businesses Worldwide</GradientText>
          </h2>
        </div>

        <div
          onMouseEnter={() => setIsPaused(true)}
          onMouseLeave={() => setIsPaused(false)}
        >
          <AnimatePresence mode="wait">
            <motion.div
              key={currentIndex}
              initial={reduced ? {} : slideIn.initial}
              animate={reduced ? {} : slideIn.animate}
              exit={reduced ? {} : slideIn.exit}
              transition={slideIn.transition}
            >
              <GlassCard className="p-8 md:p-12 relative">
                <span className="font-syne text-9xl text-violet/20 absolute top-4 left-6">
                  &ldquo;
                </span>

                <div className="relative z-10">
                  <div className="text-amber text-2xl mb-6">★★★★★</div>

                  <p className="font-dm text-lg md:text-xl text-text-base leading-relaxed mb-8 italic">
                    {TESTIMONIALS[currentIndex].quote}
                  </p>

                  <div className="flex items-center gap-4">
                    <div className="w-12 h-12 rounded-full bg-gradient-to-br from-violet to-cyan flex items-center justify-center font-syne font-bold text-white">
                      {TESTIMONIALS[currentIndex].initials}
                    </div>
                    <div>
                      <div className="font-syne font-bold text-white">
                        {TESTIMONIALS[currentIndex].name}
                      </div>
                      <div className="font-dm text-sm text-text-muted">
                        {TESTIMONIALS[currentIndex].role}
                      </div>
                    </div>
                  </div>
                </div>
              </GlassCard>
            </motion.div>
          </AnimatePresence>

          <div className="flex justify-center gap-2 mt-8">
            {TESTIMONIALS.map((_, index) => (
              <button
                key={index}
                onClick={() => setCurrentIndex(index)}
                className={`rounded-full transition-all duration-300 ${
                  index === currentIndex
                    ? "w-8 h-2 bg-gradient-to-r from-violet to-cyan"
                    : "w-2 h-2 bg-white/20 hover:bg-white/40"
                }`}
                aria-label={`Go to testimonial ${index + 1}`}
              />
            ))}
          </div>
        </div>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/ROICalculator.tsx" -Content @'
"use client"
import { useState } from "react"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"
import type { ROIResults } from "@/lib/types"

export default function ROICalculator() {
  const [rev, setRev] = useState(50000)
  const [leads, setLeads] = useState(100)
  const [conv, setConv] = useState(5)
  const [acv, setAcv] = useState(500)
  const [results, setResults] = useState<ROIResults>({
    monthlyGain: 0,
    annualGain: 0,
    extraClients: 0,
    roi: 0,
  })

  const calcROI = () => {
    const improvedLeads = leads * 1.45
    const improvedConv = Math.min(conv * 1.5, 75)
    const extraClients =
      (improvedLeads * improvedConv) / 100 - (leads * conv) / 100
    const monthlyGain = Math.round(extraClients * acv)
    const annualGain = monthlyGain * 12
    const roi = rev > 0 ? Math.round((monthlyGain / (rev * 0.1)) * 100) : 0
    setResults({
      monthlyGain,
      annualGain,
      extraClients: Math.round(extraClients),
      roi,
    })
  }

  return (
    <section id="roi" className="py-24 px-6 bg-[var(--bg2)]">
      <div className="max-w-6xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>ROI Calculator</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            See Your <GradientText>Potential ROI</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <RevealWrapper>
            <GlassCard className="p-8">
              <h3 className="font-syne font-bold text-xl text-white mb-6">
                Your Current Numbers
              </h3>

              <div className="space-y-6">
                <div>
                  <label className="font-dm text-sm text-text-muted block mb-2">
                    {`Monthly Revenue: $${rev.toLocaleString()}`}
                  </label>
                  <input
                    type="range"
                    min={10000}
                    max={500000}
                    step={5000}
                    value={rev}
                    onChange={(e) => {
                      setRev(Number(e.target.value))
                      calcROI()
                    }}
                    className="w-full accent-violet"
                  />
                </div>

                <div>
                  <label className="font-dm text-sm text-text-muted block mb-2">
                    {`Monthly Leads: ${leads}`}
                  </label>
                  <input
                    type="range"
                    min={10}
                    max={1000}
                    step={10}
                    value={leads}
                    onChange={(e) => {
                      setLeads(Number(e.target.value))
                      calcROI()
                    }}
                    className="w-full accent-violet"
                  />
                </div>

                <div>
                  <label className="font-dm text-sm text-text-muted block mb-2">
                    {`Conversion Rate: ${conv}%`}
                  </label>
                  <input
                    type="range"
                    min={1}
                    max={30}
                    step={1}
                    value={conv}
                    onChange={(e) => {
                      setConv(Number(e.target.value))
                      calcROI()
                    }}
                    className="w-full accent-violet"
                  />
                </div>

                <div>
                  <label className="font-dm text-sm text-text-muted block mb-2">
                    {`Average Client Value: $${acv.toLocaleString()}`}
                  </label>
                  <input
                    type="range"
                    min={100}
                    max={10000}
                    step={100}
                    value={acv}
                    onChange={(e) => {
                      setAcv(Number(e.target.value))
                      calcROI()
                    }}
                    className="w-full accent-violet"
                  />
                </div>
              </div>
            </GlassCard>
          </RevealWrapper>

          <RevealWrapper delay={0.1}>
            <GlassCard className="p-8 bg-gradient-to-br from-violet/10 to-cyan/10">
              <h3 className="font-syne font-bold text-xl text-white mb-6">
                Projected Results with MH Builders Lab
              </h3>

              <div className="grid grid-cols-2 gap-6">
                <div>
                  <div className="font-dm text-sm text-text-muted mb-1">
                    Monthly Gain
                  </div>
                  <div className="font-syne font-bold text-3xl text-emerald">
                    {`$${results.monthlyGain.toLocaleString()}`}
                  </div>
                </div>

                <div>
                  <div className="font-dm text-sm text-text-muted mb-1">
                    Annual Gain
                  </div>
                  <div className="font-syne font-bold text-3xl text-emerald">
                    {`$${results.annualGain.toLocaleString()}`}
                  </div>
                </div>

                <div>
                  <div className="font-dm text-sm text-text-muted mb-1">
                    Extra Clients/Month
                  </div>
                  <div className="font-syne font-bold text-3xl text-cyan-light">
                    {results.extraClients}
                  </div>
                </div>

                <div>
                  <div className="font-dm text-sm text-text-muted mb-1">
                    ROI
                  </div>
                  <div className="font-syne font-bold text-3xl text-violet-light">
                    {`${results.roi}%`}
                  </div>
                </div>
              </div>

              <div className="mt-8 p-4 rounded-xl bg-white/[0.04] border border-white/[0.08]">
                <p className="font-dm text-sm text-text-muted leading-relaxed">
                  <span className="text-emerald font-medium">*Based on typical results:</span> 45% more leads, 50% better conversion rates, and 10% of your current revenue as investment.
                </p>
              </div>
            </GlassCard>
          </RevealWrapper>
        </div>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/DigitalProducts.tsx" -Content @'
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"
import { PRODUCTS, WA_LINK } from "@/lib/constants"

const BADGE_COLORS: Record<string, string> = {
  cyan: "bg-cyan/10 border-cyan/30 text-cyan-light",
  violet: "bg-violet/10 border-violet/30 text-violet-light",
  emerald: "bg-emerald/10 border-emerald/30 text-emerald",
  amber: "bg-amber/10 border-amber/30 text-amber-300",
  rose: "bg-rose/10 border-rose/30 text-rose-300",
}

export default function DigitalProducts() {
  return (
    <section id="products" className="py-24 px-6">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>Digital Products</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Instant Access. <GradientText>Immediate Impact.</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {PRODUCTS.map((product, index) => (
            <RevealWrapper key={product.name} delay={index * 0.1}>
              <GlassCard className="p-6 h-full flex flex-col">
                <div className="mb-4">
                  <span
                    className={`inline-block px-3 py-1 rounded-full text-xs font-dm border ${BADGE_COLORS[product.badgeColor]}`}
                  >
                    {product.badge}
                  </span>
                </div>

                <h3 className="font-syne font-bold text-lg text-white mb-2">
                  {product.name}
                </h3>

                <p className="font-dm text-sm text-text-muted leading-relaxed mb-4 flex-grow">
                  {product.desc}
                </p>

                <div className="flex items-center justify-between pt-4 border-t border-white/[0.08]">
                  <span className="font-dm text-xs text-text-faint">
                    {product.format}
                  </span>
                  <a
                    href={`${WA_LINK}?text=${encodeURIComponent(product.waMsg)}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="font-dm text-sm text-violet-light hover:text-violet-light/80 transition-colors"
                  >
                    Get this →
                  </a>
                </div>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/Courses.tsx" -Content @'
"use client"
import { motion, useReducedMotion } from "framer-motion"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import SectionLabel from "@/components/ui/SectionLabel"
import { COURSES, WA_LINK } from "@/lib/constants"

export default function Courses() {
  const reduced = useReducedMotion()

  return (
    <section id="courses" className="py-24 px-6 bg-[var(--bg2)]">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <SectionLabel>Courses</SectionLabel>
          <h2 className="font-syne font-bold text-[clamp(1.8rem,4vw,2.8rem)] tracking-tight">
            Learn to <GradientText>Build & Scale</GradientText>
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {COURSES.map((course, index) => (
            <RevealWrapper key={course.title} delay={index * 0.1}>
              <GlassCard className="p-6 h-full flex flex-col">
                <div className="mb-4">
                  <span className="inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-dm bg-amber/10 border border-amber/30 text-amber-300">
                    {!reduced && (
                      <motion.span
                        className="w-2 h-2 rounded-full bg-amber"
                        animate={{ opacity: [1, 0.6, 1], scale: [1, 1.3, 1] }}
                        transition={{ duration: 2, repeat: Infinity }}
                      />
                    )}
                    Waitlist Open
                  </span>
                </div>

                <h3 className="font-syne font-bold text-lg text-white mb-2">
                  {course.title}
                </h3>

                <p className="font-dm text-sm text-text-muted leading-relaxed mb-4">
                  {course.desc}
                </p>

                <div className="flex gap-4 mb-4 text-xs font-dm text-text-faint">
                  <span>📅 {course.duration}</span>
                  <span>👥 {course.audience}</span>
                </div>

                <ul className="space-y-2 mb-6 flex-grow">
                  {course.outcomes.map((outcome) => (
                    <li key={outcome} className="flex items-start gap-2">
                      <span className="text-emerald mt-0.5">✓</span>
                      <span className="font-dm text-sm text-text-muted">{outcome}</span>
                    </li>
                  ))}
                </ul>

                <a
                  href={`${WA_LINK}?text=${encodeURIComponent(course.waMsg)}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="block text-center bg-gradient-to-r from-amber to-amber-600 text-white rounded-full px-6 py-3 font-dm font-medium hover:shadow-[0_8px_32px_rgba(245,158,11,0.35)] hover:-translate-y-0.5 transition-all duration-250"
                >
                  Join Waitlist →
                </a>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/AIAssistant.tsx" -Content @'
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
              🤖
            </div>
            <div>
              <div className="font-syne font-bold text-white text-sm">MH Assistant</div>
              <div className="font-dm text-xs text-text-muted flex items-center gap-2">
                Powered by Claude AI · Always online
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
              Send →
            </button>
          </div>
        </GlassCard>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/ZeroRiskCTA.tsx" -Content @'
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"
import { WA_LINK } from "@/lib/constants"

const TRUST_CHIPS = [
  "✓ Free consultation",
  "✓ No commitment required",
  "✓ Results in 10 days",
  "✓ Ongoing support",
]

export default function ZeroRiskCTA() {
  return (
    <section id="cta" className="py-24 px-6">
      <div className="max-w-4xl mx-auto">
        <RevealWrapper>
          <GlassCard className="rounded-[28px] p-8 md:p-16 bg-gradient-to-br from-violet/10 via-transparent to-cyan/10 border-violet/20">
            <div className="text-center">
              <h2 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-6">
                Ready to <GradientText>Scale Your Business?</GradientText>
              </h2>

              <p className="font-dm text-lg text-text-muted leading-relaxed max-w-2xl mx-auto mb-8">
                Join 50+ businesses that have transformed their operations with MH Builders Lab. Your free demo is just one click away.
              </p>

              <div className="flex flex-wrap gap-3 justify-center mb-10">
                {TRUST_CHIPS.map((chip) => (
                  <span
                    key={chip}
                    className="px-4 py-2 rounded-full bg-emerald/10 border border-emerald/30 text-emerald text-sm font-dm"
                  >
                    {chip}
                  </span>
                ))}
              </div>

              <a
                href={WA_LINK}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-block bg-gradient-to-r from-violet to-cyan text-white rounded-full px-12 py-4 font-dm font-medium text-lg shadow-[0_8px_32px_rgba(124,58,237,0.35)] hover:shadow-[0_12px_40px_rgba(124,58,237,0.5)] hover:-translate-y-0.5 transition-all duration-250"
              >
                Book Your Free Demo →
              </a>

              <p className="font-dm text-xs text-text-faint mt-6">
                No credit card required · 30-minute call · Instant clarity on what is possible
              </p>
            </div>
          </GlassCard>
        </RevealWrapper>
      </div>
    </section>
  )
}
'@

Write-ProjectFile -Path "components/sections/FloatingWhatsApp.tsx" -Content @'
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
      💬
    </motion.a>
  )
}
'@

Write-Host "Section components created" -ForegroundColor Green

# ═══════════════════════════════════════════════════════════════
# APP FILES
# ═══════════════════════════════════════════════════════════════
Write-ProjectFile -Path "app/layout.tsx" -Content @'
import { Syne, DM_Sans } from "next/font/google"
import type { Metadata } from "next"
import "./globals.css"
import AmbientOrbs from "@/components/ui/AmbientOrbs"
import UrgencyBar from "@/components/layout/UrgencyBar"
import Navbar from "@/components/layout/Navbar"
import Footer from "@/components/layout/Footer"
import FloatingWhatsApp from "@/components/sections/FloatingWhatsApp"

const syne = Syne({
  subsets: ["latin"],
  weight: ["400", "600", "700", "800"],
  variable: "--font-syne",
  display: "swap",
})

const dmSans = DM_Sans({
  subsets: ["latin"],
  weight: ["300", "400", "500"],
  variable: "--font-dm-sans",
  display: "swap",
})

export const metadata: Metadata = {
  title: "MH Builders Lab — Build. Automate. Scale.",
  description: "AI-powered digital systems for small business growth. High-converting websites, AI automation, apps, and digital marketing that turns traffic into revenue.",
  metadataBase: new URL("https://mhbuilderslab.com"),
  openGraph: {
    title: "MH Builders Lab — Build. Automate. Scale.",
    description: "AI-powered digital systems for small business growth.",
    url: "https://mhbuilderslab.com",
    siteName: "MH Builders Lab",
    images: [{ url: "/og-image.png", width: 1200, height: 630 }],
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "MH Builders Lab — Build. Automate. Scale.",
    description: "AI-powered digital systems for small business growth.",
    images: ["/og-image.png"],
  },
  icons: { icon: "/favicon.svg" },
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${syne.variable} ${dmSans.variable} scroll-smooth`}>
      <body className="bg-[var(--bg)] text-[var(--text)] font-dm antialiased overflow-x-hidden">
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "Organization",
              name: "MH Builders Lab",
              url: "https://mhbuilderslab.com",
              logo: "https://mhbuilderslab.com/logo.svg",
              contactPoint: {
                "@type": "ContactPoint",
                telephone: "+254723783337",
                contactType: "customer service",
              },
            }),
          }}
        />
        <AmbientOrbs />
        <UrgencyBar />
        <Navbar />
        {children}
        <Footer />
        <FloatingWhatsApp />
      </body>
    </html>
  )
}
'@

Write-ProjectFile -Path "app/page.tsx" -Content @'
import dynamic from "next/dynamic"
import Hero from "@/components/sections/Hero"
import IntegrationsTicker from "@/components/sections/IntegrationsTicker"
import Services from "@/components/sections/Services"
import Industries from "@/components/sections/Industries"
import HowItWorks from "@/components/sections/HowItWorks"

const Portfolio = dynamic(() => import("@/components/sections/Portfolio"))
const Testimonials = dynamic(() => import("@/components/sections/Testimonials"))
const ROICalculator = dynamic(() => import("@/components/sections/ROICalculator"), { ssr: false })
const DigitalProducts = dynamic(() => import("@/components/sections/DigitalProducts"))
const Courses = dynamic(() => import("@/components/sections/Courses"))
const AIAssistant = dynamic(() => import("@/components/sections/AIAssistant"), { ssr: false })
const ZeroRiskCTA = dynamic(() => import("@/components/sections/ZeroRiskCTA"))

export default function Home() {
  return (
    <main>
      <Hero />
      <IntegrationsTicker />
      <Services />
      <Industries />
      <HowItWorks />
      <Portfolio />
      <Testimonials />
      <ROICalculator />
      <DigitalProducts />
      <Courses />
      <AIAssistant />
      <ZeroRiskCTA />
    </main>
  )
}
'@

Write-ProjectFile -Path "app/error.tsx" -Content @'
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
'@

Write-ProjectFile -Path "app/loading.tsx" -Content @'
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
'@

Write-ProjectFile -Path "app/not-found.tsx" -Content @'
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
'@

Write-ProjectFile -Path "app/sitemap.ts" -Content @'
import { MetadataRoute } from "next"

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    { url: "https://mhbuilderslab.com", lastModified: new Date() },
    { url: "https://mhbuilderslab.com/services", lastModified: new Date() },
    { url: "https://mhbuilderslab.com/portfolio", lastModified: new Date() },
    { url: "https://mhbuilderslab.com/about", lastModified: new Date() },
    { url: "https://mhbuilderslab.com/products", lastModified: new Date() },
    { url: "https://mhbuilderslab.com/courses", lastModified: new Date() },
    { url: "https://mhbuilderslab.com/blog", lastModified: new Date() },
  ]
}
'@

Write-ProjectFile -Path "app/robots.ts" -Content @'
import { MetadataRoute } from "next"

export default function robots(): MetadataRoute.Robots {
  return {
    rules: { userAgent: "*", allow: "/" },
    sitemap: "https://mhbuilderslab.com/sitemap.xml",
  }
}
'@

# API Route (BUG FIXED: userResponse -> userMessage)
Write-ProjectFile -Path "app/api/chat/route.ts" -Content @'
import { NextRequest, NextResponse } from "next/server"
import type { ChatMessage } from "@/lib/types"

const SYSTEM_PROMPT = `You are MH Assistant, the AI assistant for MH Builders Lab, a premium digital agency founded by Mohamud Hassan that builds websites, apps, AI automation systems, and digital marketing solutions for small businesses worldwide.

Key facts:
- Services: Smart Websites, App Development, AI Automation, Digital Marketing, SEO, Brand Identity, AI Voice Agents, CRM Integration, Business Systems, Courses, Digital Products
- Process: Free Demo to Build in 10 days to Scale
- Contact: WhatsApp +254723783337 | itsmohamoud@gmail.com
- All demos are FREE, no commitment required
- Typical results: 3x revenue growth, 20h+ saved/week, live in 10 days
- Serves businesses globally, strong in Kenya, Africa, UK, UAE

Be warm, confident, helpful. Keep responses to 2 to 4 sentences. Always encourage booking a free demo for specific needs. Mention WhatsApp naturally when relevant.`

export async function POST(req: NextRequest) {
  try {
    const { messages }: { messages: ChatMessage[] } = await req.json()

    if (!messages || !Array.isArray(messages)) {
      return NextResponse.json({ error: "Invalid request" }, { status: 400 })
    }

    const userMessage = messages[messages.length - 1]?.content?.toLowerCase() || ""

    let response = "I'd love to help you with that! For specific details about your project, I recommend booking a free demo with our team. You can reach us on WhatsApp at +254 723 783 337, we'll get back to you within minutes!"

    if (userMessage.includes("service") || userMessage.includes("offer") || userMessage.includes("what do you")) {
      response = "We offer four main services: Smart Websites & Web Apps, AI & Automation Systems, Growth & Marketing, and Educational Courses & Digital Products. Each is designed to help your business scale. Want to know which one is right for you? Book a free demo and we'll show you!"
    } else if (userMessage.includes("cost") || userMessage.includes("price") || userMessage.includes("how much")) {
      response = "Pricing depends on your specific needs, but we have solutions starting from $500 for websites and $1,000 for automation packages. Every project begins with a free consultation where we'll give you an exact quote. No surprises, no pressure!"
    } else if (userMessage.includes("ai") || userMessage.includes("automation")) {
      response = "Our AI automation can save you 20+ hours per week! We build custom workflows using n8n, Make, and AI agents that handle everything from lead qualification to appointment booking. Many clients see ROI within the first month. Ready to automate?"
    } else if (userMessage.includes("website") || userMessage.includes("web")) {
      response = "Our websites aren't just pretty, they're revenue machines! Built with Next.js for speed, SEO-optimized, and designed to convert. Most clients see 3x more leads within 60 days. We deliver in just 10 days!"
    } else if (userMessage.includes("time") || userMessage.includes("long") || userMessage.includes("fast")) {
      response = "We're fast! Most projects are completed in 10 business days. Complex automation systems might take 2-3 weeks. We never compromise quality for speed though, you get both!"
    }

    return NextResponse.json({ content: response })
  } catch (error) {
    console.error("Chat API error:", error)
    return NextResponse.json(
      { error: "Something went wrong. Please reach us on WhatsApp at +254 723 783 337!" },
      { status: 500 }
    )
  }
}
'@

Write-Host "App core files created" -ForegroundColor Green

# ═══════════════════════════════════════════════════════════════
# ADDITIONAL PAGES
# ═══════════════════════════════════════════════════════════════
Write-ProjectFile -Path "app/services/page.tsx" -Content @'
import type { Metadata } from "next"
import Services from "@/components/sections/Services"

export const metadata: Metadata = {
  title: "Services | MH Builders Lab",
  description: "Smart websites, AI automation, digital marketing, and growth systems for small businesses.",
  openGraph: {
    title: "Services | MH Builders Lab",
    description: "Smart websites, AI automation, digital marketing, and growth systems for small businesses.",
    url: "https://mhbuilderslab.com/services",
  },
}

export default function ServicesPage() {
  return (
    <main className="pt-24">
      <div className="max-w-7xl mx-auto px-6 mb-12 text-center">
        <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
          What We <span className="bg-gradient-to-r from-violet-light via-cyan-light to-blue-300 bg-clip-text text-transparent">Build</span>
        </h1>
        <p className="font-dm text-lg text-text-muted max-w-2xl mx-auto">
          Four comprehensive systems designed to transform your business from manual operations to automated growth.
        </p>
      </div>
      <Services />
    </main>
  )
}
'@

Write-ProjectFile -Path "app/portfolio/page.tsx" -Content @'
import type { Metadata } from "next"
import Portfolio from "@/components/sections/Portfolio"

export const metadata: Metadata = {
  title: "Portfolio | MH Builders Lab",
  description: "Real results from real businesses. See how we've helped companies scale with digital systems.",
  openGraph: {
    title: "Portfolio | MH Builders Lab",
    description: "Real results from real businesses. See how we've helped companies scale with digital systems.",
    url: "https://mhbuilderslab.com/portfolio",
  },
}

export default function PortfolioPage() {
  return (
    <main className="pt-24">
      <div className="max-w-7xl mx-auto px-6 mb-12 text-center">
        <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
          Our <span className="bg-gradient-to-r from-violet-light via-cyan-light to-blue-300 bg-clip-text text-transparent">Work</span>
        </h1>
        <p className="font-dm text-lg text-text-muted max-w-2xl mx-auto">
          Every project tells a story of transformation. Here are some of our favorites.
        </p>
      </div>
      <Portfolio />
    </main>
  )
}
'@

Write-ProjectFile -Path "app/about/page.tsx" -Content @'
import type { Metadata } from "next"
import GlassCard from "@/components/ui/GlassCard"
import GradientText from "@/components/ui/GradientText"
import RevealWrapper from "@/components/ui/RevealWrapper"

export const metadata: Metadata = {
  title: "About | MH Builders Lab",
  description: "Learn about Mohamud Hassan and the mission behind MH Builders Lab.",
  openGraph: {
    title: "About | MH Builders Lab",
    description: "Learn about Mohamud Hassan and the mission behind MH Builders Lab.",
    url: "https://mhbuilderslab.com/about",
  },
}

const VALUES = [
  { icon: "🎯", title: "Results-First", desc: "Every decision is measured by the impact on your business growth." },
  { icon: "⚡", title: "Speed Without Compromise", desc: "10-day delivery without cutting corners on quality." },
  { icon: "🤝", title: "Partnership Mindset", desc: "We succeed when you succeed. Your growth is our reputation." },
  { icon: "🔮", title: "Future-Ready", desc: "Built with modern tech that scales as you grow." },
]

export default function AboutPage() {
  return (
    <main className="pt-24 pb-24 px-6">
      <div className="max-w-6xl mx-auto">
        <div className="text-center mb-16">
          <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
            Built by <GradientText>Builders</GradientText>
          </h1>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center mb-20">
          <RevealWrapper>
            <div className="relative">
              <div className="aspect-square max-w-md mx-auto rounded-2xl bg-gradient-to-br from-violet/20 to-cyan/20 flex items-center justify-center overflow-hidden">
                <div className="text-center p-8">
                  <div className="text-8xl mb-4">👨‍💻</div>
                  <p className="font-dm text-sm text-text-muted">Founder photo placeholder</p>
                  <p className="font-dm text-xs text-text-faint mt-2">Replace mo.png with actual photo</p>
                </div>
              </div>
            </div>
          </RevealWrapper>

          <RevealWrapper delay={0.1}>
            <div>
              <h2 className="font-syne font-bold text-3xl text-white mb-6">
                Mohamud Hassan
              </h2>
              <p className="font-dm text-violet-light mb-4 font-medium">
                Founder & CEO
              </p>
              <p className="font-dm text-text-muted leading-relaxed mb-4">
                I started MH Builders Lab with a simple belief: every small business deserves access to the same digital systems that power Fortune 500 companies.
              </p>
              <p className="font-dm text-text-muted leading-relaxed mb-6">
                After years of building systems for companies across Africa, the UK, and the UAE, I saw a pattern, the businesses that thrived weren&apos;t necessarily the biggest, but the ones that leveraged technology most effectively.
              </p>
              <p className="font-dm text-text-muted leading-relaxed">
                Today, we&apos;re on a mission to democratize digital transformation. No jargon, no bloated budgets, no long timelines. Just systems that work.
              </p>
            </div>
          </RevealWrapper>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-20">
          {VALUES.map((value, index) => (
            <RevealWrapper key={value.title} delay={index * 0.1}>
              <GlassCard className="p-6 h-full text-center">
                <div className="text-4xl mb-4">{value.icon}</div>
                <h3 className="font-syne font-bold text-white mb-2">{value.title}</h3>
                <p className="font-dm text-sm text-text-muted">{value.desc}</p>
              </GlassCard>
            </RevealWrapper>
          ))}
        </div>

        <RevealWrapper>
          <GlassCard className="p-8 md:p-12 bg-gradient-to-br from-violet/10 via-transparent to-cyan/10">
            <div className="text-center">
              <h2 className="font-syne font-bold text-2xl text-white mb-4">
                The Numbers Speak
              </h2>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-8 mt-8">
                {[
                  { value: "50+", label: "Projects Delivered" },
                  { value: "12", label: "Countries Served" },
                  { value: "3+", label: "Years Active" },
                  { value: "98%", label: "Client Satisfaction" },
                ].map((stat) => (
                  <div key={stat.label}>
                    <div className="font-syne font-bold text-3xl md:text-4xl bg-gradient-to-r from-violet-light to-cyan-light bg-clip-text text-transparent">
                      {stat.value}
                    </div>
                    <div className="font-dm text-sm text-text-muted mt-1">{stat.label}</div>
                  </div>
                ))}
              </div>
            </div>
          </GlassCard>
        </RevealWrapper>
      </div>
    </main>
  )
}
'@

Write-ProjectFile -Path "app/products/page.tsx" -Content @'
import type { Metadata } from "next"
import DigitalProducts from "@/components/sections/DigitalProducts"

export const metadata: Metadata = {
  title: "Digital Products | MH Builders Lab",
  description: "Instant-access digital products to accelerate your business growth.",
  openGraph: {
    title: "Digital Products | MH Builders Lab",
    description: "Instant-access digital products to accelerate your business growth.",
    url: "https://mhbuilderslab.com/products",
  },
}

export default function ProductsPage() {
  return (
    <main className="pt-24 pb-24 px-6">
      <div className="max-w-7xl mx-auto mb-12 text-center">
        <h1 className="font-syne font-bold text-[clamp(2rem,5vw,3.5rem)] tracking-tight mb-4">
          Digital <span className="bg-gradient-to-r from-violet-light via-cyan-light to-blue-300 bg-clip-text text-transparent">Products</span>
        </h1>
        <p className="font-dm text-lg text-text-muted max-w-2xl mx-auto">
          Skip the wait. Get immediate access to templates, guides, and tools built from real-world experience.
        </p>
      </div>
      <DigitalProducts />
    </main>
  )
}
'@

Write-ProjectFile -Path "app/courses/page.tsx" -Content @'
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
'@

Write-ProjectFile -Path "app/blog/page.tsx" -Content @'
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
                      Read more →
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
'@

Write-Host "All app pages created" -ForegroundColor Green

# ═══════════════════════════════════════════════════════════════
# FINAL SUMMARY
# ═══════════════════════════════════════════════════════════════
Write-Host ""
Write-Host "===================================================================" -ForegroundColor Cyan
Write-Host "MH BUILDERS LAB PROJECT CREATED SUCCESSFULLY!" -ForegroundColor Green
Write-Host "===================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Project location: $(Get-Location)" -ForegroundColor Yellow
Write-Host ""
Write-Host "TO GET STARTED:" -ForegroundColor White
Write-Host ""
Write-Host "   npm install" -ForegroundColor Gray
Write-Host "   npm run dev" -ForegroundColor Gray
Write-Host ""
Write-Host "Then open: http://localhost:3000" -ForegroundColor White
Write-Host ""
Write-Host "NOTES:" -ForegroundColor White
Write-Host "1. Logo/favicon SVGs are in public/ and work out of the box."
Write-Host "2. Replace public/mo.png with your real founder photo."
Write-Host "3. The chat widget works without an API key (canned responses)."
Write-Host "   Add your real ANTHROPIC_API_KEY to .env.local to go live with Claude."
Write-Host "4. Deploy: push to GitHub, connect to Vercel, add env vars, deploy."
Write-Host ""
Write-Host "===================================================================" -ForegroundColor Cyan
Write-Host "Built with love for your daughter's future, King." -ForegroundColor Magenta
Write-Host "===================================================================" -ForegroundColor Cyan
