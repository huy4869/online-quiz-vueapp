import Vue from "vue";
import VueRouter from "vue-router";
import Home from "./components/Home.vue";
import TakeQuizWelcome from "./components/TakeQuizWelcome.vue";
import TakeQuizStart from "./components/TakeQuizStart.vue";
import TakeQuizOver from "./components/TakeQuizOver.vue";
import MakeQuiz from "./components/MakeQuiz.vue";
import ManagerQuiz from "./components/ManagerQuiz.vue";
import Register from "./components/Register.vue";

Vue.use(VueRouter);

export const router = new VueRouter({
  base: "/",
  mode: "history",
  routes: [
    {
      path: "/home",
      name: "home",
      component: Home,
      props: true,
    },
    {
      path: "/makequiz",
      name: "makequiz",
      component: MakeQuiz,
      props: true,
    },
    {
      path: "/takequiz",
      name: "takequiz",
      component: TakeQuizWelcome,
      props: true,
    },
    {
      path: "/start/:questionId",
      name: "start",
      component: TakeQuizStart,
      props: true,
    },
    {
      path: "/over",
      name: "over",
      component: TakeQuizOver,
      props: true,
    },
    {
      path: "/manage/:pageIndex",
      name: "manage",
      component: ManagerQuiz,
      props: true,
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      props: true,
    },
  ],
});
