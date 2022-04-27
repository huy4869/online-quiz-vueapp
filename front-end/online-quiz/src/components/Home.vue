<template>
  <div id="home">
    <div class="title" v-if="this.$cookies.get('token') != null">
      Welcome <span class="hightlight-text">{{ getName }}</span>
    </div>
    <div v-if="this.$cookies.get('token') == null" class="userbox" id="login">
      <div class="title"><h1 class="hightlight-text">Login Form</h1></div>
      <table border="0">
        <tr>
          <td>User Name:</td>
          <td>
            <input
              class="login"
              requiredtype="email"
              v-model="email"
              name="username"
              id="user_name"
            />
          </td>
        </tr>
        <tr>
          <td>Password:</td>
          <td>
            <input
              class="login"
              required
              v-model="password"
              type="password"
              name="password"
              id="user_password"
            />
          </td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td>
            <!-- <input class="action-button" value="Sign in" @click="login" /> -->
            <button class="action-button" @click="login">Sign in</button>

            <router-link to="register" class="register">Register</router-link>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import Axios from "axios";
import jwt_decode from "jwt-decode";
export default {
  name: "home",
  components: {},
  computed: {
    getName() {
      if (this.$cookies.get("token") != null) {
        let token = this.$cookies.get("token");
        let decodeValue = jwt_decode(token);
        return decodeValue.UserName;
      } else {
        return null;
      }
    },
  },
  data() {
    return {
      email: "teacher@gmail.com",
      password: "1",
    };
  },
  methods: {
    async login() {
      await Axios.post(`https://localhost:44312/api/Token`, {
        Email: this.email,
        Password: this.password,
      })
        .then((respose) => {
          console.log(respose.data);
          //store token into cookies
          this.$cookies.set("token", respose.data, "1d", "", "", [
            { httpOnly: true },
          ]);
          this.$router.push({ name: "takequiz" });
          window.location.reload();
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style scoped></style>
