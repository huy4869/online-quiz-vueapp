<template>
  <div class="wrapper-container">
    <div class="userbox" id="login">
      <div class="title"><h1 class="hightlight-text">Login Form</h1></div>
      <!-- <form action="" id="user_login" method="POST"> -->
      <table border="0">
        <tr>
          <td>User Name:</td>
          <td>
            <input
              required
              type="text"
              v-model="userName"
              name="username"
              id="user_name"
            />
          </td>
        </tr>
        <tr>
          <td>Password:</td>
          <td>
            <input
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
          <td>User Type:</td>
          <td>
            <select v-model="role" name="type">
              <option value="1">Teacher</option>
              <option value="0">Student</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Email</td>
          <td>
            <input
              v-model="email"
              required
              type="email"
              name="email"
              id="user_email"
            />
          </td>
        </tr>
        <tr>
          <td></td>
          <td>
            <button @click="register" class="action-button">Register</button>
          </td>
        </tr>
      </table>
      <!-- </form> -->
    </div>
  </div>
</template>

<script>
import Axios from "axios";

export default {
  name: "register",
  data() {
    return {
      userName: "test",
      password: "1",
      role: 1,
      email: "studenttest@gmail.com",
    };
  },
  methods: {
    async register() {
      let newUser = {
        userName: this.userName,
        password: this.password,
        role: this.role,
        email: this.email,
      };
      if (this.userName == "" || this.password == "" || this.email == "") {
        alert("Please fill all the fields!");
      } else {
        await Axios.post("https://localhost:44312/api/Users", newUser)
          .then((response) => {
            console.log(response.data);
            if (response.data == "") {
              alert("Email is dupplicated!");
            }
            if (response.data != "") {
              if (confirm("Registration success. Do you want to log in now?") == true) {
                this.$router.push("/");
              }
            }
          })
          .catch((error) => {
            console.log(error);
            alert("Success")
          });
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
