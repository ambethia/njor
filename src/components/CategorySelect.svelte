<script>
  import categories from '../data/categories.json'
  export let onChange
  export let selected = ''
  let isActive
  $: selectedCategory = selected.split(';')[0]

  function updateSelected(event) {
    event.target.blur()
    if (onChange) {
      onChange(event.target.value)
    }
  }
</script>

<select
  class="text-gray-200 border-0 bg-gray-700 focus:outline-none appearance-none"
  class:selected={!!selected}
  class:isActive
  on:input={updateSelected}
  on:focus={() => (isActive = true)}
  on:blur={() => (isActive = false)}
  style="background-color: {selectedCategory && categories[selectedCategory].color}"
  value={selected}>
  <option value="">&hellip;</option>
  {#each Object.keys(categories) as category}
    <optgroup
      label={category}
      class="text-gray-800 font-sans"
      style="color: {categories[category].color}">
      {#each categories[category].sub as sub}
        <option
          class="text-gray-800"
          style="background-color: {categories[category].color}"
          value="{category};{sub}">
          {sub}
        </option>
      {/each}
    </optgroup>
  {/each}
</select>

<style lang="postcss">
  .selected {
    @apply text-gray-800;
  }

  .isActive {
    @apply bg-gray-700 !important;
  }
</style>
