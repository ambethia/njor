<script>
  import { afterUpdate } from 'svelte'
  import PageHeader from '../components/PageHeader'
  import PlayableClassSelect from '../components/PlayableClassSelect'
  import SpecializationSelect from '../components/SpecializationSelect'
  import AbilityCategorySelect from '../components/Ability/CategorySelect'

  let currentClass
  let currentSpec

  afterUpdate(() => {
    window.$WowheadPower.refreshLinks()
  })
</script>

<PageHeader title="Class Abilities" />

<PlayableClassSelect bind:currentClass />

{#if currentClass}
  <SpecializationSelect {currentClass} bind:currentSpec />

  {#if currentSpec}
    <div class="my-4 text-xl">
      {#each currentSpec.abilities as ability}
        <AbilityCategorySelect {ability} />
      {/each}
    </div>
  {/if}
{/if}
