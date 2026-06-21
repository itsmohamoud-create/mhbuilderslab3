import type { Project, Testimonial, Product, Course, Integration } from "./types"

export const WA_LINK = "https://wa.me/254723783337"
export const EMAIL   = "itsmohamoud@gmail.com"
export const PHONE   = "+254 723 783 337"
export const SITE_URL = "https://mhbuilderslab.com"
export const CALENDLY = "https://calendly.com/itsmohamoud"

export const PROJECTS: Project[] = [
  {
    id: "lumina",
    icon: "ðŸ ",
    name: "Lumina Realty",
    category: "Websites",
    tags: ["Website", "SEO"],
    metric: "+280% organic traffic",
    shortDesc: "Property agency site with integrated listings, booking & local SEO",
    longDesc: "Full property agency website with MLS-style listings, appointment booking, local SEO, and a custom lead capture funnel. Ranked on page 1 for 14 local keywords within 60 days of launch.",
  },
  {
    id: "shiftsync",
    icon: "ðŸ“±",
    name: "ShiftSync",
    category: "Apps",
    tags: ["App", "Systems"],
    metric: "15h saved/week",
    shortDesc: "Staff scheduling app for multi-location businesses",
    longDesc: "Custom React Native + Next.js web app handling shift scheduling, availability tracking, and automated WhatsApp notifications for a 4-location hospitality group.",
  },
  {
    id: "fitflow",
    icon: "ðŸŽ¯",
    name: "FitFlow Studio",
    category: "Marketing",
    tags: ["Marketing", "Ads"],
    metric: "$4.20 ROAS",
    shortDesc: "Meta ads campaign with high-converting funnel",
    longDesc: "Complete paid media strategy: Meta ads, landing page optimisation, email follow-up sequence. Achieved $4.20 ROAS in month one and cut cost-per-lead by 58%.",
  },
  {
    id: "retailpulse",
    icon: "ðŸ¤–",
    name: "RetailPulse",
    category: "AI & Auto",
    tags: ["AI/Auto", "Systems"],
    metric: "22h saved/week",
    shortDesc: "AI inventory management with auto reorder",
    longDesc: "n8n + OpenAI automation that monitors stock levels, predicts reorder points from sales velocity, and automatically raises POs. Integrated with Shopify and a local ERP system.",
  },
  {
    id: "serviceflow",
    icon: "âš¡",
    name: "ServiceFlow AI",
    category: "AI & Auto",
    tags: ["AI/Auto", "CRM"],
    metric: "30h saved/week",
    shortDesc: "End-to-end business automation + CRM sync",
    longDesc: "Full-stack automation for a service business: AI voice agent handles inbound calls, qualifies leads, books appointments into Google Calendar, syncs to HubSpot, and triggers a WhatsApp follow-up sequence.",
  },
  {
    id: "aura",
    icon: "âœ¨",
    name: "Aura Wellness",
    category: "Branding",
    tags: ["Branding", "Content"],
    metric: "2Ã— pricing power",
    shortDesc: "Full brand identity overhaul, premium positioning",
    longDesc: "Complete brand identity: logo, colour system, typography, brand guidelines, social templates, and website redesign. Repositioned as a premium brand â€” enabled a 2Ã— price increase with zero client churn.",
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
    quote: "Our online orders increased 200% after the new website went live. The WhatsApp automation handles everything now. From concept to launch in 10 days â€” exceeded every expectation.",
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
    quote: "From concept to launch in 3 weeks. The app handles 500+ appointments daily without a single issue. The AI automation is next level â€” I only wish I found MH Builders Lab sooner.",
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
    name: "CRM in Notion â€” Business OS",
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
    desc: "Automate your business operations using AI â€” no coding required.",
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