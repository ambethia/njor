<script>
  import CategorySelect from './CategorySelect.svelte'
  import categories from '../data/categories.json'
  import { abbreviate } from '../util/string'

  export let category = ''
  export let hotkey = ''

  $: categoryName = category.split(';')[0]
  $: categoryColor = categoryName && categories[categoryName].color

  let editing = false

  function updateCategory(newCategory) {
    category = newCategory
  }

  function save() {
    editing = false
  }
</script>

<div class="relative w-16 h-16 bg-gray-200">
  <button
    on:click={() => (editing = true)}
    class="w-16 h-16 text-gray-800 flex flex-col items-center justify-center hover:opacity-75"
    style="background-color: {categoryColor}">
    <span class="text-lg font-bold">{hotkey}</span>
    <abbr
      class="text-sm"
      title={category.replace(';', ' - ')}>{abbreviate(category)}</abbr>
  </button>
  {#if editing}
    <div
      class="absolute flex top-0 left-0 p-2 transform translate-y-3 translate-x-3 bg-gray-700">
      <input class="text-gray-900 px-2 w-24" text="text" bind:value={hotkey} />
      <CategorySelect onChange={updateCategory} selected={category} />
      <button class="bg-indigo-500 px-2" on:click={save}>Save</button>
    </div>
  {/if}
</div>
