<script>
  import PageHeader from '../components/PageHeader'
  import Icon from '../components/Icon'
</script>

<PageHeader title="Keymaps" />

<h3 class="font-bold">New Keymap</h3>
<form class="flex">
  <input
    class="text-gray-800 focus:ring-indigo-500 focus:border-indigo-500"
    type="text"
    placeholder="Name" />
  <button type="submit" class="ring-2 h-12 w-12 bg-indigo-500">
    <Icon name="plus" />
  </button>
</form>
