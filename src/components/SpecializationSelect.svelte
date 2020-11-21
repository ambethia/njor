<script>
  import { beforeUpdate } from 'svelte'
  export let currentClass
  export let currentSpec = null

  beforeUpdate(() => {
    if (!currentClass.specs.includes(currentSpec)) {
      currentSpec = currentClass.specs[0]
    }
  })
</script>

<nav class="flex flex-col md:flex-row">
  {#each currentClass.specs as spec (spec.name)}
    <button
      on:click={() => (currentSpec = spec)}
      class:active={currentSpec === spec}
      class:class-title={currentClass.name === spec.name}
      class="p-2 opacity-25 flex-1 flex items-center"
      style="background-color: {currentClass.color}">
      <img class="h-8 w-8 mr-2" src="/icons/{spec.icon}" alt={spec.name} />
      <span>{spec.name}</span>
    </button>
  {/each}
</nav>

<style lang="postcss">
  button.active {
    @apply opacity-100;
  }

  .class-title {
    @apply font-bold text-xl;
  }
</style>
