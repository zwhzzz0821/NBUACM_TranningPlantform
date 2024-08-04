<template>
<div>
    <el-button type="primary" @click="routerBack">返回</el-button>
    <el-container style="width: 100%; margin: 15px;">
        <el-card style="width: 200%; margin: 0px">
            <el-form label-width="80px" :model="notice">
                <el-form-item label="id">
                    <el-input v-model="notice.id" disabled></el-input>
                </el-form-item>
                <el-form-item label="发布人">
                    <el-input v-model="notice.author" disabled></el-input>
                </el-form-item>
                <el-form-item label="主题">
                    <el-input v-model="notice.title"></el-input>
                </el-form-item>
            </el-form>
        </el-card>
    </el-container>
    

    <el-container style="width: 100%; margin: 15px;">
          <el-card style="width: 200%; margin: 0px">
            <v-md-editor :value="notice.info" mode="preview"></v-md-editor>
          </el-card>
    </el-container>

    <el-container style="width: 100%; margin: 15px">
          <v-md-editor v-model="NewInfo" height="px"></v-md-editor>
          <el-button type="primary" @click="updateNotice">更新通知内容</el-button>
    </el-container>
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
      NewInfo: "",
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
        if(res.code === 200) {
          this.notice = res.notice;
          this.NewInfo = this.notice.info;
          console.log(this.notice);
          console.log("现在的时间戳:", this.GetNowTimeStamp())
        } else {
          Toast.fail('获取数据失败');
        }
        
      });
    },

    updateNotice() {
        console.log("info:", this.notice.info);
        request.post('/Notice/updateOne', {
            id:this.notice.id,
            author:this.notice.author,
            date:this.GetNowTimeStamp(),
            title:this.notice.title,
            info:this.NewInfo
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

    routerBack() {
      this.$router.back()
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