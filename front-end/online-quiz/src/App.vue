<template>
  <div id="app">
    <WrapContainer />
  </div>
</template>

<script>
import WrapContainer from "./components/WrapContainer.vue";

export default {
  name: "App",
  data() {
    return {
      name: "chiu do",
    };
  },
  components: {
    WrapContainer,
  },
};
</script>

<style>
body {
  color: #3e6981;
  font-family: sans-serif;
  background-image: url(./assets/bg.jpg);
  background-repeat: repeat-x;
  margin: 20px;
  color: #67a5d4;
}
.warapper-container {
  background-image: url(./assets/top_box.gif);
  background-repeat: no-repeat;
  padding-top: 19px;
  width: 700px;
  margin: 0 auto;
}
.container {
  padding: 20px 20px 50px 20px;
  background-color: white;
}

.hightlight-text {
  color: #0000ff;
}

a {
  text-decoration: none;
  color: #61574c;
  font-size: 18px;
}

.content-container {
  margin: 30px;
}

.action-button {
  font-size: 15px;
  color: black;
}

.title {
  margin-bottom: 35px;
}

.time-count {
  padding-left: 250px;
}
.hightlight-time {
  color: red;
}
#btn-next {
  margin-left: 450px;
}

.register {
  color: #67a5d4;
  font-size: 15px;
  margin-left: 5px;
}

.login {
  background-color: #faffbd;
}
</style>
