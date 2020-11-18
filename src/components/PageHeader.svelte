<script>
  import Icon from './Icon'
  export let title
</script>

<svelte:head>
  <title>{title} - Njor</title>
</svelte:head>

<header class="py-4">
  <nav>
    <ul class="flex justify-center text-2xl">
      <li
        class="p-4 text-green-600"
        class:active={window.location.pathname === '/keymaps'}>
        <a href="/keymaps"><Icon name="keyboard" /></a>
      </li>
      <li
        class="p-4 text-indigo-600"
        class:active={window.location.pathname === '/categories'}>
        <a href="/categories"><Icon name="sitemap" /></a>
      </li>
    </ul>
  </nav>
  <h1 class="text-2xl font-bold">{title}</h1>
</header>

<style lang="postcss">
  .active {
    @apply opacity-25;
  }
</style>
