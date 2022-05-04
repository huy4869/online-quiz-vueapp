<template>
  <div class="welcome">
    <div class="title">
      Welcome <span class="hightlight-text">{{ getName }}</span>
    </div>
    <div class="">
      Enter number of questions:
      <div class="input-group">
        <input type="number" v-model="questionNumber" name="totalquestion" />
      </div>
      <div class="action-button">
        <button @click="doQuiz" class="action-button">Start</button>
      </div>
    </div>
  </div>
</template>

<script>
import Axios from "axios";
import jwt_decode from "jwt-decode";
export default {
  name: "TakeQuiz",
  data() {
    return {
      questionNumber: 4,
    };
  },
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
  methods: {
    async doQuiz() {
      await Axios.get(`https://onlinequizapi.azurewebsites.net/api/Questions/GetToTalQuestion`)
        .then((response) => {
          if (
            this.questionNumber <= parseInt(response.data) &&
            this.questionNumber > 0
          ) {
            this.getQuestions();
          } else {
            alert("Please enter again");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    async getQuestions() {
      let questionCodes = new Array();
      await Axios.get(
        `https://onlinequizapi.azurewebsites.net/api/Questions/GetQuestionCodes`,
        {
          params: {
            numberOfQuestion: this.questionNumber,
          },
        }
      )
        .then((response) => {
          console.log(response.data);
          questionCodes = response.data.$values;
          console.log(questionCodes);
        })
        .catch((error) => {
          console.log(error);
        });

      this.$cookies.set(
        "questionCode",
        JSON.stringify(questionCodes),
        `${this.questionNumber}min`,
        "",
        "",
        [{ httpOnly: true }]
      );
      this.$router.replace({
        name: "start",
        params: {
          questionId: questionCodes[0],
        },
      });
    },
  },
};
</script>

<style lang="scss" scoped>
</style>