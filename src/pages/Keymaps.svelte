<script>
  import PageHeader from '../components/PageHeader'
  import Icon from '../components/Icon'
  import { keymaps } from '../db'
  import { encode } from '../util/url'

  let newKeymapName

  function createKeymap() {
    if (!$keymaps[newKeymapName]) {
      $keymaps[newKeymapName] = new Array(5 * 12).fill([])
    } else {
      alert(`Keymap "${newKeymapName}" Exists`)
    }
    newKeymapName = ''
  }

  function destroyKeymap(name) {
    if (window.confirm('Sure?')) {
      keymaps.remove(name)
    }
  }
</script>

<PageHeader title="Keymaps" />

<ul>
  {#each Object.keys($keymaps) as name}
    <li class="my-2 flex bg-green-500 text-green-900">
      <a class="p-4 text-xl flex-1" href="/keymaps/{encode(name)}">{name}</a>
      <button class="p-4 text-xl" on:click={() => destroyKeymap(name)}><Icon
          name="times-circle" /></button>
    </li>
  {/each}
</ul>

<hr class="border-2 border-gray-700 my-2" />

<h3 class="font-bold text-xl">New Keymap</h3>
<form class="flex" on:submit|preventDefault={createKeymap}>
  <input
    class="text-gray-800 text-xl bg-indigo-100 opacity-50 focus:opacity-100 p-2"
    type="text"
    bind:value={newKeymapName}
    placeholder="Name" />
</form>
