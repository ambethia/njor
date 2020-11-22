import { get, writable } from 'svelte/store'

const ABILITY_CATEGORIZATION = 'ABILITY_CATEGORIZATION'

function createPersistedObjectStore(storeKey) {
  const { subscribe, set, ...store } = writable({})

  const json = window.localStorage.getItem(storeKey)
  const data = JSON.parse(json)

  set(data)

  subscribe((value) => {
    const json = JSON.stringify(value)
    window.localStorage.setItem(storeKey, json)
  })

  return { subscribe, set, ...store }
}

export const abilityCategorization = createPersistedObjectStore(
  ABILITY_CATEGORIZATION
)
