<template>
  <div class="makequiz">
    <form action="" id="make-quiz" method="POST">
      <table class="make-quiz" border="0">
        <tr class="question-content">
          <td>Question:</td>
          <td class="question"><textarea rows="5" cols="55"></textarea></td>
        </tr>
        <tr class="option-content">
          <td>Option1:</td>
          <td class="option-1"><textarea rows="3" cols="55"></textarea></td>
        </tr>
        <tr class="option-content">
          <td>Option2:</td>
          <td class="option-1"><textarea rows="3" cols="55"></textarea></td>
        </tr>
        <tr class="option-content">
          <td>Option3:</td>
          <td class="option-1"><textarea rows="3" cols="55"></textarea></td>
        </tr>
        <tr class="option-content">
          <td>Option4:</td>
          <td class="option-1"><textarea rows="3" cols="55"></textarea></td>
        </tr>
        <tr class="answer-group">
          <td>Answer(s):</td>
          <td>
            <input type="checkbox" id="option1" name="option1" /><label
              for="option1"
              >Option 1</label
            >
            <input type="checkbox" id="option2" name="option2" /><label
              for="option2"
              >Option 2</label
            >
            <input type="checkbox" id="option3" name="option3" /><label
              for="option3"
              >Option 3</label
            >
            <input type="checkbox" id="option4" name="option4" /><label
              for="option4"
              >Option 4</label
            >
          </td>
        </tr>
        <tr class="action-button">
          <td></td>
          <td><input class="action-button" value="Save" type="submit" /></td>
        </tr>
      </table>
    </form>
  </div>
</template>

<script>
export default {};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped></style>
