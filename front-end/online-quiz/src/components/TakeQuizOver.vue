<template>
  <div class="over">
    <div class="title">
      Your score <span class="hightlight-text">{{ score * 10 }}</span>
      <span class="hightlight-text">({{ score * 100 }})</span
      ><span class="hightlight-text"> - Passed</span>
    </div>
    <div class="">
      Take another test
      <span class="action-button">
        <button class="action-button" @click="requiz">Start</button>
      </span>
    </div>
  </div>
</template>

<script>
import jwt_decode from "jwt-decode";
import Axios from "axios";
export default {
  name: "over",
  data() {
    return {
      score: 0,
      questions: [],
    };
  },
  mounted() {
      console.log(this.questions);

    if (this.$cookies.get("userAnswer") != null) {
      this.questions = JSON.parse(this.$cookies.get("userAnswer"));
      console.log(this.questions);
      this.getScore();
      let userId = this.getUserId();
      console.log(userId);
    }
  },
  methods: {
    getUserId() {
      if (this.$cookies.get("token") != null) {
        let token = this.$cookies.get("token");
        let decodeValue = jwt_decode(token);
        return decodeValue.Id;
      } else {
        return null;
      }
    },
    async getScore() {
      await Axios.post(
        `https://onlinequizapi.azurewebsites.net/api/Questions/GetMarkForQuestion`,
        this.questions
      )
        .then((response) => {
          this.score = response.data.toFixed(1);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    requiz() {
      this.$cookies.remove("userAnswer");
      this.$cookies.remove("questions");
      this.$router.replace({ name: "takequiz" });
    },
  },
};
</script>

<style lang="scss" scoped>
</style>