<template>
  <div class="navigation-container">
    <div class="navigation">
      <div class="link">
        <router-link :to="{ name: 'home' }">Home</router-link>
        <span v-if="this.$cookies.get('token') != null">
        <router-link :to="{ name: 'takequiz' }">Take Quiz</router-link>
        <router-link :to="{ name: 'makequiz' }">Make Quiz</router-link>
        <router-link :to="{ name: 'manage', params: {pageIndex: 1} }">Manage Quiz</router-link>
        <a @click="logOut">Log Out</a>
        </span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "navigation-container",
  methods: {
    logOut() {
      let allCookies = this.$cookies.keys();
      allCookies.forEach((element) => {
        this.$cookies.remove(element);
      });
      this.$router.push("/home");
      window.location.reload();
    },
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
  cursor: pointer;
}
</style>
