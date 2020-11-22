<script>
  import { onMount } from 'svelte'
  import PageHeader from '../components/PageHeader'
  import HotkeyEditor from '../components/HotkeyEditor'
  import { keymaps } from '../db'
  import { decode } from '../util/url'

  export let params
  let name
  $: currentKeymap = $keymaps[name]

  onMount(() => (name = decode(params.name)))

  const headings = [
    'Main Bar',
    'Bottom Left',
    'Bottom Right',
    'Right 1',
    'Right 2',
  ]
</script>

<PageHeader title="Keymap: {name}" />

<HotkeyEditor />
