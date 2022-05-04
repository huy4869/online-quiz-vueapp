<template>
  <div class="makequiz">
    <!-- <form action="" id="make-quiz" method="POST"> -->
    <table class="make-quiz" border="0">
      <tr class="question-content">
        <td>Question:</td>
        <td class="question">
          <textarea v-model="questionContent" rows="5" cols="55"></textarea>
        </td>
      </tr>
      <tr class="option-content">
        <td>Option1:</td>
        <td class="option-1">
          <textarea v-model="answerContent[0]" rows="3" cols="55"></textarea>
        </td>
      </tr>
      <tr class="option-content">
        <td>Option2:</td>
        <td class="option-1">
          <textarea v-model="answerContent[1]" rows="3" cols="55"></textarea>
        </td>
      </tr>
      <tr class="option-content">
        <td>Option3:</td>
        <td class="option-1">
          <textarea v-model="answerContent[2]" rows="3" cols="55"></textarea>
        </td>
      </tr>
      <tr class="option-content">
        <td>Option4:</td>
        <td class="option-1">
          <textarea v-model="answerContent[3]" rows="3" cols="55"></textarea>
        </td>
      </tr>
      <tr class="answer-group">
        <td>Answer(s):</td>
        <td>
          <input
            type="checkbox"
            v-model="checkedOption"
            name="option1"
            value="1"
          /><label for="option1">Option 1</label>
          <input
            type="checkbox"
            v-model="checkedOption"
            name="option2"
            value="2"
          /><label for="option2">Option 2</label>
          <input
            type="checkbox"
            v-model="checkedOption"
            name="option3"
            value="3"
          /><label for="option3">Option 3</label>
          <input
            type="checkbox"
            v-model="checkedOption"
            name="option4"
            value="4"
          /><label for="option4">Option 4</label>
        </td>
      </tr>
      <tr class="action-button">
        <td></td>
        <td><button @click="submit" class="action-button">Save</button></td>
      </tr>
    </table>
    <!-- </form> -->
  </div>
</template>

<script>
import jwt_decode from "jwt-decode";
import Axios from "axios";
export default {
  name: "makequiz",
  data() {
    return {
      questionContent: "Xin chao cac ban lai la Chao day",
      answerContent: ["xin", "chaoo", "Chao", "nha"],
      checkedOption: [2],
    };
  },
  mounted() {
    // this.submit();
  },
  methods: {
    async submit() {
      let options = [];
      for (let i = 0; i < this.answerContent.length; i++) {
        let isChecked = false;
        for (let j = 0; j < this.checkedOption.length; j++) {
          if (this.checkedOption[j] == i + 1) {
            isChecked = true;
          }
        }
        options.push({
          id: i,

          content: this.answerContent[i],
          isRight: isChecked,
        });
      }
      let question = {
        questionContent: this.questionContent,
        options: options,
      };
      console.log(question);
      await Axios.post(`https://onlinequizapi.azurewebsites.net/api/Questions`, question, {
        headers: {
          Authorization: `Bearer ${this.$cookies.get("token")}`,
        },
      })
        .then((response) => {
          console.log(response.data);
          alert("Successfully!");
          this.$router.push({ name: "makequiz" });
          window.location.reload();
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getUserID() {
      if (this.$cookies.get("token") == null) return null;
      if (this.$cookies.get("token") != null) {
        let token = this.$cookies.get("token");
        let decodeValue = jwt_decode(token);
        return decodeValue.Id;
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped></style>
