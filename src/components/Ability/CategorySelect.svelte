<script>
  export let ability = {}
</script>

<div class="flex justify-between" class:talent={ability.isTalent}>
  <div class="flex whitespace-no-wrap p-1">
    <a
      href="https://www.wowhead.com/spell={ability.spellId}"
      data-wowhead="spell={ability.spellId}"
      class="flex">
      <img
        class="w-8 h-8 mr-2"
        src="/icons/{ability.icon}"
        alt={ability.name} />
      <span>{ability.name}</span>
    </a>
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
