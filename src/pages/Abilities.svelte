<script>
  import PageHeader from '../components/PageHeader'
  import PlayableClassSelect from '../components/PlayableClassSelect'

  let currentClass
</script>

<PageHeader title="Class Abilities" />

<PlayableClassSelect bind:currentClass />

{#if currentClass}
  <h1 class="my-2 font-bold text-xl">{currentClass.name}</h1>
{/if}
