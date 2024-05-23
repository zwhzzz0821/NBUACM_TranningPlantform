<template>
    <div>
      <el-container style="height: 100%; width: 100%">
          <el-header style="height: 80%;">
          <el-page-header @back="this.$router.back()">
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
        <el-container style="width: 100%; margin: 15px">
          <v-md-editor v-model="postText" height="px"></v-md-editor>
          <el-button type="primary" @click="updatePost">发布</el-button>
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
      problem_id: null,
      problem: null,
      rating: 0,
      postText: "> Problem: []() \n [TOC] \n # 思路 \n > 讲述看到这一题的思路 \n # 解题方法 \n> 描述你的解题方法 \n # 复杂度 \n 时间复杂度: \n > 添加时间复杂度, 示例： $O(n)$ \n 空间复杂度: \n > 添加空间复杂度, 示例： $O(n)$ \n # Code \n ``` \n cpp \n``` ",
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
      request.get(`/Problem/GetProblem/${this.problem_id}`).then((res) => {
        this.problem = res.ProblemRet
      });
    },
    updatePost() {
      try {
        console.log(this.postText)
        request.post(`/Blog/Insert/${this.problem_id}/${this.$store.state.uid}`, {
          uid: this.$store.state.uid,
          username: this.$store.state.username,
          blogContent: this.postText,
          problemId: this.problem_id,
        }).then((res) => {
          this.$message({
            message: '发布成功',
            type: 'success'
          });
          this.update()
        });
      } catch (error) {
        console.log(error)
        this.$message({
            message: '发布失败',
            type: 'error'
        })
      }
    },
    update() {
      request.get(`/Blog/GetBlog/${this.problem_id}/${this.$store.state.uid}`).then((res) => {
        console.log(res)
        this.blogText = res.BlogContent.BlogContent
      });
    }
  },
  components: {
    MathJax,
  },
  created() {
    this.problem_id = this.$route.params.problemId;
    this.GetProblem();
    request.get(`/Blog/GetBlog/${this.problem_id}/${this.$store.state.uid}`).then((res) => {
      console.log(res)
      if (res.BlogContent.BlogContent != null) {
        this.blogText = res.BlogContent.BlogContent
        this.postText = res.BlogContent.BlogContent
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