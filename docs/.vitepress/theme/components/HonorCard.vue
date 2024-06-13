<template>
  <div class="honor-card">
    <div class="honor-card__overlay"></div>
    <img class="honor-card__image" src="/img/lhfxa.png" />
    <div class="honor-card__content">
      <div>
        <img src="/img/Wall/img_2.png">
      </div>
      <div class="honor-card__header">
        <h1 class="honor-card__title">{{ title }}</h1>
        <h4 class="honor-card__info">{{ info }}</h4>
      </div>
      <p class="honor-card__desc">{{ description }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HonorCard',
  props: {
    title: String,
    info: String,
    description: String,
  },
};
</script>

<style scoped>
.honor-card {
  position: relative;
  width: 100%;
  height: 300px;
  margin: 20px;
  overflow: hidden;
  background-color: #f0f0f0;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.honor-card:hover {
  transform: scale(1.05);
}

.honor-card__overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.3);
  z-index: 1;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.honor-card:hover .honor-card__overlay {
  opacity: 1;
}

.honor-card__content {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 20px;
  color: #000000;
  z-index: 2;
}

.honor-card__header {
  margin-bottom: 10px;
}

.honor-card__title {
  font-size: 1.5em;
  margin-bottom: 5px;
}

.honor-card__info {
  font-size: 0.9em;
}

.honor-card__desc {
  font-size: 0.9em;
  line-height: 1.4;
  margin-bottom: 15px;
}

.honor-card__image {
  opacity: 0.4
}

</style>
