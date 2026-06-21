export default function GradientText({ children }: { children: React.ReactNode }) {
  return (
    <span className="bg-gradient-to-r from-violet-light via-cyan-light to-blue-300 bg-clip-text text-transparent">
      {children}
    </span>
  )
}