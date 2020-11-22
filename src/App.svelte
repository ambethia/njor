<script>
  import router from 'page'
  import Abilities from './pages/Abilities'
  import Categories from './pages/Categories'
  import Keymaps from './pages/Keymaps'
  import Keymap from './pages/Keymap'
  import Layout from './components/Layout'

  let page
  let params = {}

  router('/abilities', () => (page = Abilities))
  router('/categories', () => (page = Categories))
  router('/keymaps', () => (page = Keymaps))
  router(
    '/keymaps/:name',
    (ctx, next) => (params = ctx.params) && next(),
    () => (page = Keymap)
  )
  router('/', () => router.redirect('/keymaps'))

  router.start()
</script>

<Layout>
  <svelte:component this={page} bind:params />
</Layout>
