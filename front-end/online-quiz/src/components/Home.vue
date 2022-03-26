<template>
  <div id="home">
    <div class="userbox" id="login">
      <div class="title"><h1 class="hightlight-text">Login Form</h1></div>
      <table border="0">
        <tr>
          <td>User Name:</td>
          <td>
            <input
              class="login"
              required
              type="email"
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
            <button class="action-button"  @click="login">Sign in</button>

            <a class="register" href="#" title="Register">Register</a>
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
      email: "email@email.com",
      password: "123456",
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
          this.$cookies.set("token", respose.data, "1d", "", "", [
            { httpOnly: true },
          ]);
          window.location.reload();
          this.$router.push({ name: "home" });
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style scoped></style>
