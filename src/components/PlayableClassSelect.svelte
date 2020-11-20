<script>
  import { get } from '../util/api'
  import Loading from './Loading'

  export let currentClass

  async function loadPlayableClasses() {
    return (await get('/api/playable_classes')).result
  }
</script>

{#await loadPlayableClasses()}
  <Loading />
{:then playableClasses}
  <nav class="flex border-gray-500 border-8">
    {#each playableClasses as pc (pc.id)}
      <button
        on:click={() => (currentClass = pc)}
        class:active={currentClass === pc}
        class="p-2 opacity-25"
        style="background-color: {pc.color}">
        <img src={pc.iconPath} alt={pc.name} />
      </button>
    {/each}
  </nav>
{/await}

<style lang="postcss">
  button.active {
    @apply opacity-100;
  }
</style>
