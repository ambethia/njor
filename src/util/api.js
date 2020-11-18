export async function get(path, params = {}) {
  try {
    const query = new URLSearchParams(params).toString()
    if (query.length > 0) path += '?' + query
    const response = await fetch(path, {
      headers: { 'Content-Type': 'application/json' },
    })
    const result = await response.json()
    const count = parseInt(response.headers.get('Total-Count'))
    const total = parseInt(response.headers.get('Total-Pages'))
    const items = parseInt(response.headers.get('Page-Items'))
    const current = parseInt(response.headers.get('Current-Page'))
    const { first, next, prev, last } = parseLinks(response.headers.get('Link'))

    return {
      result,
      pages: { first, next, prev, last, count, total, items, current },
    }
  } catch (error) {
    return { error }
  }
}

function parseLinks(link) {
  if (typeof link !== 'string') return {}
  return link.split(', ').reduce((result, part) => {
    let match = part.match('<(.*?)>; rel="(.*?)"')
    const url = new URL(match[1])
    url.host = window.location.host
    if (match && match.length === 3) result[match[2]] = url.href
    return result
  }, {})
}
