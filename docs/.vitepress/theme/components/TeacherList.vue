<template>
  <div class="teacher-list">
    <TeacherCard
        v-for="teacher in teachers"
        :key="teacher.id"
        :teacher="teacher"
    />
  </div>
</template>

<script>
import TeacherCard from './TeacherCard.vue';

export default {
  name: 'TeacherList',
  components: {
    TeacherCard
  },
  data() {
    return {
      teachers: [
        {
          id: 1,
          name: '辛宇',
          photo: 'img/teacher/xy.png',
          brief: '副教授',
          details: '研究方向：人工智能，大数据'
        },
        {
          id: 2,
          name: '陈叶芳',
          photo: 'img/teacher/img.png',
          brief: '我是简要介绍',
          details: '我是详细介绍我是详细介绍'
        },
        {
          id: 2,
          name: '陈叶芳',
          photo: 'img/teacher/img.png',
          brief: '我是简要介绍',
          details: '我是详细介绍我是详细介'
        },
        {
          id: 2,
          name: '陈叶芳',
          photo: 'img/teacher/img.png',
          brief: '我是简要介绍',
          details: '我是详细介绍我是详细介绍'
        },
        {
          id: 2,
          name: '陈叶芳',
          photo: 'img/teacher/img.png',
          brief: '我是简要介绍',
          details: '我是详细介绍我是详细介绍'
        },
        {
          id: 2,
          name: '陈叶芳',
          photo: 'img/teacher/img.png',
          brief: '我是简要介绍',
          details: '我是详细介绍我是详细介绍'
        },
      ]
    };
  }
};
</script>

<style scoped>
.teacher-list {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 10px;
  padding: 10px;
}
</style>
