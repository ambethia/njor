<script>
  let i = 0

  function up() {
    i += 1
  }
</script>

<style global lang="postcss">
  /* purgecss start ignore */
  @tailwind base;
  @tailwind components;
  /* purgecss end ignore */

  @tailwind utilities;
</style>

<p on:click={() => (i += 1)}>Hello, World, {i}</p>
