<script>
  import router from 'page'
  import Categories from './pages/Categories'
  import Keymaps from './pages/Keymaps'

  import Layout from './components/Layout'

  let page

  router('/categories', () => (page = Categories))
  router('/keymaps', () => (page = Keymaps))
  router('/', () => router.redirect('/keymaps'))

  router.start()
</script>

<Layout>
  <svelte:component this={page} />
</Layout>
