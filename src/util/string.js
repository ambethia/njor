export function abbreviate(str) {
  if (str) {
    const abbr = str.split(';')[1]
    if (abbr.length > 6) {
      return abbr
        .split(/ \W? ?/)
        .map((s) => (s === 'Cooldown' ? 'CD' : s.slice(0, 3)))
        .join(' ')
    } else {
      return abbr
    }
  }
}
