<script>
  import router from 'page'
  import Abilities from './pages/Abilities'
  import Categories from './pages/Categories'
  import Keymaps from './pages/Keymaps'

  import Layout from './components/Layout'

  import { db } from './stores'

  const request = indexedDB.open('njor', 1)
  request.onerror = () => console.error('Could not open IndexedDB.')
  request.onsuccess = (event) => ($db = event.target.result)

  let page

  router('/abilities', () => (page = Abilities))
  router('/categories', () => (page = Categories))
  router('/keymaps', () => (page = Keymaps))
  router('/', () => router.redirect('/keymaps'))

  router.start()
</script>

<Layout>
  <svelte:component this={page} />
</Layout>
