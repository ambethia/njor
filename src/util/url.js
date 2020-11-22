export function encode(str) {
  return encodeURIComponent(str).replace('%20', '+')
}

export function decode(str) {
  return decodeURIComponent(str.replace('+', '%20'))
}
