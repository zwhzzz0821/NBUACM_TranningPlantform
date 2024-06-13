<template>
  <div class="honor-list">
    <h1>荣誉 殿堂</h1>
    <div class="honor-cards">
      <HonorCard
          v-for="(honor, index) in honorList"
          :key="index"
          :title="honor.title"
          :info="honor.info"
          :description="honor.description"
      />
    </div>
  </div>
</template>

<script>
import HonorCard from './HonorCard.vue';

export default {
  name: 'HonorList',
  components: {
    HonorCard,
  },
  data() {
    return {
      honorList: [
        {
          title: '2023 ICPC西安站-金奖队伍',
          info: '梁航锋 李浩 林成峰',
          description: '我们一起去提瓦提大冒险',
        },
        {
          title: '2023 ICPC西安站-金奖队伍',
          info: '梁航锋 李浩 林成峰',
          description: '我们一起去提瓦提大冒险',
        },
        {
          title: '2023 ICPC西安站-金奖队伍',
          info: '梁航锋 李浩 林成峰',
          description: '我们一起去提瓦提大冒险',
        },
        {
          title: '2023 ICPC西安站-金奖队伍',
          info: '梁航锋 李浩 林成峰',
          description: '我们一起去提瓦提大冒险',
        },
      ],
    };
  },
};
</script>

<style scoped>
.honor-list {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.honor-list h1 {
  text-align: center;
  font-size: 2em;
  margin-bottom: 20px;
}

.honor-cards {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

</style>
