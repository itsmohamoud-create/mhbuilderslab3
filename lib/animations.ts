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