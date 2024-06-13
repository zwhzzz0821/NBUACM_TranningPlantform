<template>
<div>


    <el-container style="height: 100%; width: 100%">
        <el-card style="width: 100%; margin: 0px">
            <v-md-editor :value="notice.info" ></v-md-editor>
        </el-card>
    </el-container>
    <!-- 添加提交按钮 -->
    <el-button type="primary" @click="updateNotice">提交</el-button>
</div>
</template>
  
  <script>
  import { Toast } from "vant";
  import request from "../../util/request"
  import { MathJax } from 'mathjax-vue'
  export default {
  data() {
    return {
      notice: null,
      uid: null, 
      problem: null,
      rating: 0,
      blogText: "",
      info: "",
      id: 0,   //这个是通知的id
      title:""
    }
  },
  methods: {
    getNotice(id) {
      request.get('/Notice/getOne', {
        params:{
            id:id
        }
      }).then(res => {
        this.notice = res.notice;
        console.log(this.notice);
        console.log("现在的时间戳:", this.GetNowTimeStamp())
      });
    },

    updateNotice() {
        request.post('/Notice/updateOne', {
            id:this.notice.id,
            author:this.notice.author,
            date:this.GetNowTimeStamp(),
            title:this.notice.title,
            info:this.notice.info
        }).then(res => {
            if(res.code === 200) {
                Toast.success("修改成功");
            } else {
                Toast.fail("修改失败");
            }
        });
    },

    GetNowTimeStamp() {
        return Math.floor(Date.now() / 1000); // 获取当前时间的10位时间戳
    },



  },
  components: {
    MathJax,
  },
  created() {
    this.id = this.$route.params.id;
    this.getNotice(this.id);
    
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