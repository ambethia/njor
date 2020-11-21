<script>
  import PageHeader from '../components/PageHeader'
  import categories from '../data/categories.json'
</script>

<PageHeader title="Ability Categories" />

<table class="w-full text-gray-900">
  <tbody>
    {#each Object.keys(categories) as name}
      <tr style="background-color: {categories[name].color}">
        <th class="p-2 whitespace-no-wrap text-left">{name}</th>
        <td>
          <ul class="flex flex-wrap">
            {#each categories[name].sub as sub}
              <li class="m-1 p-1 bg-white bg-opacity-25">{sub}</li>
            {/each}
          </ul>
        </td>
      </tr>
    {/each}
  </tbody>
</table>
