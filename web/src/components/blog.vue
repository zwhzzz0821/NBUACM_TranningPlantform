<template>
  <div>
    <el-container style="height: 100%; width: 100%">
        <el-header style="height: 80%;">
        <el-page-header @back="$router.back()">
          <template #content >
            Blog of &nbsp;
            <el-link
              type="primary"
              :href="generateLink()"
              target="_blank"
              size="large"
            >
            <img
              src="../assets/CF.png"
              alt="C"
              width="14"
              height="14"
            />{{ problem.name ? problem.name : "No Title" }}</el-link
            >
            &nbsp;&nbsp;&nbsp;&nbsp;Rating:&nbsp;
            <span :style="`color: ${getRatingColor(problem.rating)}`">
              <span :class="problem.rating >= 3000 ? `first-letter-black` : ``">
                {{ problem.rating ? problem.rating : "No rating" }}
              </span>
            </span>
            &nbsp;&nbsp;&nbsp;&nbsp;Tags:&nbsp;
            <span
              v-for="item of problem.tags.split(',')"
              :key="item"
              :underline="false"
            >
              <el-tag style="margin: 0 2px" size="small">
                {{ item }}
              </el-tag>
            </span>
          </template>
        </el-page-header>
      </el-header>
      <el-divider style="margin: 0" />
      <el-container style="width: 100%; margin: 15px;">
        <el-card style="width: 200%; margin: 0px">
          <v-md-editor :value="blogText" mode="preview"></v-md-editor>
        </el-card>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import { getRatingColor } from "../util/CFshow.js"
import request from "../util/request"
import { MathJax } from 'mathjax-vue'
export default {
data() {
  return {
    problemId: null,
    uid: null, 
    problem: null,
    rating: 0,
    blogText: "",
    BlogContent: "",
    ProblemId: 0,
  }
},
methods: {
  getRatingColor,
  generateLink() {
    return `https://codeforces.com/problemset/problem/${this.problem.contestId}/${this.problem.ProblemIndex}`;
  },
  GetProblem() {
    request.get(`/Problem/GetProblem/${this.problemId}`).then((res) => {
      this.problem = res.ProblemRet
    });
  },
  update() {
    request.get(`/Blog/GetBlog/${this.problemId}/${this.$store.state.uid}`).then((res) => {
      console.log(res)
      this.blogText = res.BlogContent.BlogContent
    });
  }
},
components: {
  MathJax,
},
created() {
  this.problemId = this.$route.params.problemId;
  this.uid = this.$route.params.uid;
  console.log(this.$route.params.uid)
  this.GetProblem();
  request.get(`/Blog/GetBlog/${this.problemId}/${this.$route.params.uid}`).then((res) => {
    console.log(res)
    if (res.BlogContent.BlogContent != null) {
      this.blogText = res.BlogContent.BlogContent
    }
  });
},
}
</script>

<style scoped>
.card-header {
display: flex;
justify-content: space-between;
align-items: center;
}
</style>