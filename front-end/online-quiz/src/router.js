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
      path: "/",
      name: "home",
      component: Home,
    },
    {
      path: "/makequiz",
      name: "makequiz",
      component: MakeQuiz,
    },
    {
      path: "/takequiz",
      name: "takequiz",
      component: TakeQuizWelcome,
    },
    {
      path: "/start",
      name: "start",
      component: TakeQuizStart,
    },
    {
      path: "/over",
      name: "over",
      component: TakeQuizOver,
    },
    {
      path: "/manage",
      name: "manage",
      component: ManagerQuiz,
    },
    {
      path: "/register",
      name: "register",
      component: Register
    },
  ],
});
