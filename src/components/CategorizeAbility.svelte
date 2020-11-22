<script>
  import { abilityCategorization } from '../db'
  import CategorySelect from './CategorySelect'
  export let ability = {}

  $: selected = $abilityCategorization[ability.spellID]

  function updateSelected(category) {
    $abilityCategorization[ability.spellID] = category
  }
</script>

<div class="flex justify-between items-center" class:talent={ability.isTalent}>
  <div class="flex whitespace-nowrap p-1">
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
      <CategorySelect onChange={updateSelected} {selected} />
    </div>
  {/if}
</div>

<style lang="postcss">
  .talent {
    @apply italic;
  }
</style>
