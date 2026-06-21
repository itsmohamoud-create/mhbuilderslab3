export default function SectionLabel({ children }: { children: React.ReactNode }) {
  return (
    <p className="font-dm text-[0.82rem] tracking-[0.15em] uppercase text-violet-light mb-4">
      {children}
    </p>
  )
}