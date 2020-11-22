<script>
  import { afterUpdate, beforeUpdate } from 'svelte'
  import PageHeader from '../components/PageHeader'
  import PlayableClassSelect from '../components/PlayableClassSelect'
  import SpecializationSelect from '../components/SpecializationSelect'
  import CategorizeAbility from '../components/CategorizeAbility'
  import abilities from '../data/abilities.json'

  let currentClass
  let currentSpec
  let currentAbilities = []

  afterUpdate(() => {
    window.$WowheadPower.refreshLinks()
  })

  beforeUpdate(() => {
    if (currentSpec) {
      currentAbilities = abilities[currentClass.name][currentSpec.name] || []
    }
  })
</script>

<PageHeader title="Class Abilities" />

<PlayableClassSelect bind:currentClass />

{#if currentClass}
  <SpecializationSelect {currentClass} bind:currentSpec />

  {#if currentSpec}
    <div class="my-4 text-xl">
      {#each currentAbilities as ability (ability.spellID)}
        <CategorizeAbility {ability} />
      {/each}
    </div>
  {/if}
{/if}
