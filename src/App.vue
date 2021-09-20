<template>
  <div>
    <the-header></the-header>
    <the-resources></the-resources>
  </div>
</template>

<script>

import TheHeader from "@/components/layouts/TheHeader";
import TheResources from "@/components/layouts/TheResources";


export default {

  components: {
    TheHeader,
    TheResources
  }
}
</script>


<style>
@import url(http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900);

* {
  box-sizing: border-box;
}

html {
  font-family: 'Roboto', sans-serif;
}

body {
  margin: 0;
}

</style>