<template>
    <div>
        <el-container>
          <v-md-editor v-model="postText" height="400px"></v-md-editor>
        </el-container>
    </div>
</template>
  
<script>
  export default {
    data() {
      return {
        postText: ""
      }
    },
  }
</script>
  
<style scoped>
</style>
  