import { get, writable } from 'svelte/store'

const ABILITY_CATEGORIZATION = 'ABILITY_CATEGORIZATION'
const KEYMAPS = 'KEYMAPS'

function createPersistedObjectStore(storeKey) {
  const { subscribe, set, ...store } = writable({})

  const json = window.localStorage.getItem(storeKey)
  const data = JSON.parse(json)

  if (data) {
    set(data)
  }

  subscribe((value) => {
    const json = JSON.stringify(value)
    window.localStorage.setItem(storeKey, json)
  })

  function remove(key) {
    store.update((value) => {
      delete value[key]
      return value
    })
  }

  return { subscribe, set, remove, ...store }
}

export const abilityCategorization = createPersistedObjectStore(
  ABILITY_CATEGORIZATION
)

export const keymaps = createPersistedObjectStore(KEYMAPS)
