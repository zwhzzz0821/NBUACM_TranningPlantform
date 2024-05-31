<template>
  <div class="teacher-card">
    <div @click="toggleDetails" class="card-header">
      <img :src="teacher.photo" alt="Teacher Photo" class="teacher-photo">
      <div class="card-info">
        <h3 class="teacher-name">{{ teacher.name }}</h3>
        <p class="teacher-brief">{{ teacher.brief }}</p>
      </div>
    </div>
    <div v-if="showDetails" class="card-details">
      <p>{{ teacher.details }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TeacherCard',
  props: {
    teacher: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      showDetails: false
    };
  },
  methods: {
    toggleDetails() {
      this.showDetails = !this.showDetails;
    }
  }
};
</script>

<style scoped>
.teacher-card {
  border: 1px solid #ddd;
  border-radius: 8px;
  overflow: hidden;
  margin: 10px;
  width: 100%;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}
.card-header {
  cursor: pointer;
}
.teacher-photo {
  width: 100%;
  height: 300px;
  object-fit: cover;
}
.card-info {
  padding: 10px;
}
.teacher-name {
  font-size: 1.2em;
  margin: 0;
}
.teacher-brief {
  color: #666;
  margin: 5px 0 0;
}
.card-details {
  padding: 10px;
  border-top: 1px solid #ddd;
}
</style>
