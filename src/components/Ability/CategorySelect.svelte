<script>
  import { abilityCategorization } from '../../db'
  import categories from '../../data/categories.json'
  export let ability = {}

  $: selectedCategorySub = $abilityCategorization[ability.spellID] || ''
  $: selectedCategory = selectedCategorySub.split(';')[0]

  let isActive

  function updateSelected(event) {
    $abilityCategorization[ability.spellID] = event.target.value
    event.target.blur()
  }
</script>

<div class="flex justify-between items-center" class:talent={ability.isTalent}>
  <div class="flex whitespace-no-wrap p-1">
    <a
      href="https://www.wowhead.com/spell={ability.spellID}"
      data-wowhead="spell={ability.spellID}"
      class="flex">
      {ability.name}
    </a>
    {#if ability.subtext}<span class="ml-2">({ability.subtext})</span>{/if}
  </div>
  {#if !ability.isPassive}
    <div class="text-right">
      <select
        class="text-gray-200 border-0 bg-gray-700 focus:outline-none appearance-none"
        class:selected={!!selectedCategorySub}
        class:isActive
        on:input={updateSelected}
        on:focus={() => (isActive = true)}
        on:blur={() => (isActive = false)}
        style="background-color: {selectedCategory && categories[selectedCategory].color}"
        value={selectedCategorySub}>
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
    </div>
  {/if}
</div>

<style lang="postcss">
  .talent {
    @apply italic;
  }

  .selected {
    @apply text-gray-800;
  }

  .isActive {
    @apply bg-gray-700 !important;
  }
</style>
