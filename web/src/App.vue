<template>
  <div>
     <router-view v-if="showRouter"></router-view>
  </div>
</template>
<script>

export default {
  provide (){
    return {
      reload: this.reload
    }
  },
   data (){
    return {
      showRouter: true
    }
  },
  methods: {
    reload (){
      this.showRouter = false
      this.$nextTick(function(){
        this.showRouter = true
      })
    }
  }
}
</script>

<style>

</style>
