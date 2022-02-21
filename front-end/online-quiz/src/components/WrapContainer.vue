<template>
  <div class="warapper-container">
    <navigation-bar />
    <div class="container">
      <div class="content-container">
        <router-view /> 
      </div>
    </div>
  </div>
</template>

<script>
import NavigationBar from "./NavigationBar.vue";
export default {
  name: "warapper-container",
  components: {
    NavigationBar,
  },
};
</script>

<style lang="scss" scoped></style>
