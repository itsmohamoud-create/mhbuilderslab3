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