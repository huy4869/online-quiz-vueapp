<template>
  <div class="manage">
    <div class="title">
      Number of questions: <span class="hightlight-text">1</span>
    </div>
    <table class="manager-quiz" border="0">
      <tr>
        <td class="hightlight-text">Question</td>
        <td class="hightlight-text">DateCreated</td>
      </tr>

      <tr v-for="(question, index) in questions.$values" :key="index">
        <td>
          {{ question.id }}
        </td>
        <td>
          {{ question.questionContent }}
        </td>
        <td>{{ question.createdAt | moment }}</td>
        <td>
          <div class="link" @click="deleteQuestion(question.id)">
            Delete
          </div>
        </td>
      </tr>
      <!-- <tr>
        <td>Xin chao cac ban lai la Chao day la cau hoi cua</td>
        <td>20-Apr-2016</td>
      </tr> -->
    </table>
    <div class="paging">
      <router-link 
        v-for="page in pages" 
        :to="{ name: 'manage', params: { pageIndex: page } }"
        :key="page"
        :class="{ active: page == pageIndex }"
      >
        {{ page }}
      </router-link>
    </div>
  </div>
</template>

<script>
const size = 3;

// import jwt_decode from "jwt-decode";
import Axios from "axios";
import moment from "moment";
export default {
  name: "manager",
  props: {
    pageIndex: Number
  },
  data() {
    return {
      questions: [],
      pages: 1,
    };
  },
  created() {
    this.getQuestions();
    this.getPages();
  },
  watch: {
    pageIndex: function () {
      this.getQuestions();
    },
  },

  methods: {
    async getQuestions() {
      let token = this.$cookies.get("token");
      if (this.pageIndex == null) this.pageIndex = 1;
      await Axios.get(
        "https://localhost:44312/api/Questions/GetPagingQuestion",
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
          params: {
            pageIndex: this.pageIndex,
            pageSize: size,
          },
        }
      )
        .then((response) => {


          this.questions = JSON.parse(JSON.stringify(response.data));
          // this.questions = response.data;
          console.log(response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    // formatDate(createdAt) {
    //   return moment(createdAt).format("YYYY-MM-DD");
    // },
    async getPages() {
      let token = this.$cookies.get("token");
      await Axios.get(
        `https://localhost:44312/api/Questions/GetTotalQuestion`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      ).then((response) => {
        console.log(this.pageIndex);
        if (response.data % size == 0) {
          this.pages = response.data / size;
        } else {
          this.pages = Math.floor(response.data / size) + 1;
        }
      });
    },
    async deleteQuestion(id) {
      let token = this.$cookies.get("token");
      await Axios.delete(
        `https://localhost:44312/api/Questions/${id}`,
        {
          headers: {
            Authorization: `Bearer ${token}`
          }
        }
      ).then (response => {
        console.log(response.data)
      })
      .catch(error => {
        console.log(error);
      })
      this.getQuestions();
    }
  },
  filters: {
    moment: function (date) {
      return moment(date).format("YYYY/MM/DD");
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
table .manager-quiz {
  table-layout: fixed;
  width: 130%;
}

.manager-quiz td {
  width: 500px;
  padding: 0 50px 0 0;
}
.paging {
  margin-top: 30px;
  text-align: center;
}
.active {
  font-weight: bold;
  color: blue;
  border: 2px solid #436478;
}

.link {
  font-weight: lighter;
  text-decoration: underline;
  cursor: pointer;
}
</style>
