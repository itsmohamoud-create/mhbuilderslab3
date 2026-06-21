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
              ðŸ’¬
            </a>
            <a href={`mailto:${EMAIL}`} className="text-text-muted hover:text-violet-light transition-colors" aria-label="Email">
              âœ‰ï¸
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
            Â© 2026 MH Builders Lab. All rights reserved. Built to build builders.
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