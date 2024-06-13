<template>
  <div class="parent-container">
    <div class="left-panel">
      <Activities />
    </div>
    <div class="right-panel">
      <Notification />
    </div>
  </div>
</template>

<script>
import Activities from './Activities.vue';
import Notification from './Notification.vue';

export default {
  components: {
    Activities,
    Notification
  }
};
</script>

<style scoped>
.parent-container {
  display: flex;
  justify-content: space-between;
  width: 100%;
}

.left-panel {
  flex: 1;
  margin-right: 10px;
}

.right-panel {
  flex: 1;
  margin-left: 10px;
}
</style>
