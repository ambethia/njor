<script>
  import { onMount } from 'svelte'
  import { get } from '../util/api'
  import Icon from './Icon'

  export let collection
  export let load
  export let items = 20
  let pages = {}

  async function loadCollection(path) {
    const data = await get(path, { items })
    if (!data.error) {
      collection = data.result
      pages = data.pages
      console.log({ pages })
    }
  }

  onMount(() => loadCollection(load))
</script>

{#if pages.total > 1}
  <nav class="flex justify-between items-center">
    <ul class="flex">
      <li class="page-item">
        <button
          on:click={() => loadCollection(pages.first)}
          disabled={pages.current == 1}>
          <Icon name="angle-double-left" />
        </button>
      </li>

      {#if pages.prev}
        <li class="page-item ml-2">
          <button on:click={() => loadCollection(pages.prev)}>
            <Icon name="angle-left" />
          </button>
        </li>
      {/if}
    </ul>

    <p class="text-gray-600">Page {pages.current} of {pages.total}</p>

    <ul class="flex">
      {#if pages.next}
        <li class="page-item mr-2">
          <button on:click={() => loadCollection(pages.next)}>
            <Icon name="angle-right" />
          </button>
        </li>
      {/if}

      <li class="page-item">
        <button
          on:click={() => loadCollection(pages.last)}
          disabled={pages.current == pages.total}>
          <Icon name="angle-double-right" />
        </button>
      </li>
    </ul>
  </nav>
{/if}

<style lang="postcss">
  .page-item {
    @apply py-2;

    button {
      @apply bg-blue-200 h-8 w-8;

      &:hover {
        @apply bg-blue-300;
      }

      &[disabled] {
        @apply opacity-25 bg-gray-300;
      }
    }
  }
</style>
