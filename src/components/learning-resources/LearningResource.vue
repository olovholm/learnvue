<template>
  <li>
    <base-card>
      <header>
        <h3> {{ title }}</h3>
        <base-button>Delete</base-button>
      </header>
    <p> {{ description }}</p>
    <nav>
      <a :href="link">View resource</a>
    </nav>
    </base-card>
  </li>
</template>


<script>
import BaseCard from "@/components/UI/BaseCard";
import BaseButton from "@/components/UI/BaseButton";
export default {
  components: {BaseButton, BaseCard},
  props: ['title','description','link']
}
</script>


<style scoped>
li {
  margin: auto;
  max-width: 40rem;
}

header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

</style>