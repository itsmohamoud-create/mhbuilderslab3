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
  title: "MH Builders Lab â€” Build. Automate. Scale.",
  description: "AI-powered digital systems for small business growth. High-converting websites, AI automation, apps, and digital marketing that turns traffic into revenue.",
  metadataBase: new URL("https://mhbuilderslab.com"),
  openGraph: {
    title: "MH Builders Lab â€” Build. Automate. Scale.",
    description: "AI-powered digital systems for small business growth.",
    url: "https://mhbuilderslab.com",
    siteName: "MH Builders Lab",
    images: [{ url: "/og-image.png", width: 1200, height: 630 }],
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "MH Builders Lab â€” Build. Automate. Scale.",
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