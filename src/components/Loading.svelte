<script>
  import Icon from './Icon'

  import { onMount } from 'svelte'

  const COLORS = [
    'text-red-300',
    'text-orange-400',
    'text-yellow-500',
    'text-green-300',
    'text-blue-300',
    'text-indigo-300',
    'text-purple-300',
  ]

  let currentColorIndex = 0

  onMount(() => {
    const interval = setInterval(() => {
      currentColorIndex = (currentColorIndex + 1) % COLORS.length
    }, 100)

    return () => {
      clearInterval(interval)
    }
  })
</script>

<div
  class="p-4 flex justify-center text-3xl transition-colors duration-200 ease-in-out {COLORS[currentColorIndex]}">
  <Icon name="spinner-third" spin />
</div>
