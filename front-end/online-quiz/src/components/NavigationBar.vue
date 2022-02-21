<template>
  <div class="navigation-container">
    
    <div class="navigation">
      <div class="link">
        <router-link :to="{ name: 'home' }">Home</router-link>
        <router-link :to="{ name: 'takequiz' }">Take Quiz</router-link>
        <router-link :to="{ name: 'makequiz' }">Make Quiz</router-link>
        <router-link :to="{ name: 'manage' }">Manage Quiz</router-link>
        <a @click="logOut">Log Out</a>
        
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "navigation-container",
  methods: {
    logOut() {
      this.$router.push("/");
      window.location.reload();
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.navigation-container {
  font-weight: bold;
  background-color: white;
}
.navigation {
  background-image: url(../assets/menu_bg.gif);
  background-repeat: no-repeat;
  height: 51px;
  width: 700px;
  margin-left: 20px;
}

.link {
  position: relative;
  top: 25%;
}
a {
  margin-left: 37px;
}
</style>
