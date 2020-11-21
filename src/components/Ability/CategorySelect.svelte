<script>
  export let ability = {}
</script>

<div class="flex justify-between" class:talent={ability.isTalent}>
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
    <div class="text-right">Category Select</div>
  {/if}
</div>

<style lang="postcss">
  .talent {
    @apply italic;
  }
</style>
