<script>
  import classes from '../data/classes.json'
  export let currentClass = classes[0]
</script>

<nav class="flex">
  {#each classes as playableClass (playableClass.name)}
    <button
      on:click={() => (currentClass = playableClass)}
      class:active={currentClass === playableClass}
      class="p-2 opacity-25"
      style="background-color: {playableClass.color}">
      <img src="/icons/{playableClass.icon}" alt={playableClass.name} />
    </button>
  {/each}
</nav>

<style lang="postcss">
  .active {
    @apply opacity-100;
  }
</style>
