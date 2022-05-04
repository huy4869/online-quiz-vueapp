<template>
  <div class="start">
    <div class="title">
      Welcome <span class="hightlight-text">{{ getName }}</span>
      <div class="time-count">
        Time remaining <span class="hightlight-time">10:03</span>
      </div>
    </div>
    <table class="">
      <tr>
        <td>{{ currentQuestion.questionContent }}</td>
      </tr>
      <div
        class="options"
        v-for="(op, index) in currentQuestion.options.$values"
        :key="index"
      >
        <tr>
          <td class="input-group">
            <input type="checkbox" :value="index" v-model="checkedOption" />
            <label for="option1"> {{ op.content }} </label>
          </td>
        </tr>
      </div>
    </table>

    <button
      v-if="currentQuestionIndex < questionCode.length - 1"
      @click="nextQuestion"
      class="action-button"
      id="btn-next"
    >
      Next
    </button>
    <button
      v-if="currentQuestionIndex == questionCode.length - 1"
      @click="finish"
      class="action-button"
      id="btn-next"
    >
      Finish
    </button>
  </div>
</template>

<script>
import Axios from "axios";
import jwt_decode from "jwt-decode";
export default {
  name: "start",
  props: {
    questionId: Number,
  },
  data() {
    return {
      currentQuestion: {},
      questionCode: [],
      currentQuestionIndex: 0,
      checkedOption: [],
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
  mounted() {
    this.getQuestion();
    this.questionCode = JSON.parse(this.$cookies.get("questionCode"));
  },
  watch: {
    questionId: function () {
      this.getQuestion();
    },
  },
  methods: {
    async getQuestion() {
      await Axios.get(
        `https://onlinequizapi.azurewebsites.net/api/Questions/${this.questionId}`
      )
        .then((response) => {
          console.log(response.data);
          this.currentQuestion = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },

    nextQuestion() {
      this.addQuestion();
      this.checkedOption = [];
      this.currentQuestionIndex += 1;
      this.$router.replace({
        name: "start",
        params: {
          questionId: this.questionCode[this.currentQuestionIndex],
        },
      });
    },
    addQuestion() {
      let userAnswer = null;
      if (this.$cookies.get("userAnswer") != null) {
        userAnswer = JSON.parse(this.$cookies.get("userAnswer"));
      } else {
        userAnswer = new Array();
      }
      let options = new Array();
      this.checkedOption.forEach((element) => {
        options.push({ id: element });
      });

      userAnswer.push({
        Id: this.questionCode[this.currentQuestionIndex],
        options: options,
      });
      console.log(userAnswer);
      console.log(JSON.stringify(userAnswer));

      this.$cookies.set(
        "userAnswer",
        JSON.stringify(userAnswer),
        `${this.questionCode.length}min`
      );
    },
    finish() {
      this.addQuestion();
      this.$router.replace({
        name: "over",
      });
    },
  },
};
</script>

<style lang="scss" scoped></style>
