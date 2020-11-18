<script>
  import Paginate from '../components/Paginate'
  import PageHeader from '../components/PageHeader'
  let categories = []
</script>

<PageHeader title="Ability Categories" />

<table class="w-full">
  <tbody>
    {#each categories as category (category.id)}
      <tr style="background-color: {category.color}">
        <td class="p-2">{category.main}</td>
        <td class="p-2">{category.name}</td>
      </tr>
    {/each}
  </tbody>
</table>

<Paginate bind:collection={categories} load="/api/categories" items={25} />
