<template>
  <div class="honor-display">
    <div class="honor-content">
      <!-- 左半部分 -->
      <div class="left-section">
        <div class="row">
          <div class="award-photo">
            <div class="photo-frame">
              <img src="/img/Wall/img_1.png" alt="Medal Photo" class="medal-image" />
            </div>
          </div>
          <div class="group-photo">
            <div class="photo-frame">
              <img src="/img/Wall/img.png" alt="Group Photo" class="group-image" />
            </div>
          </div>
        </div>
        <div class="row">
          <div class="competition-name">
            <p>2023 ICPC西安站 金牌队伍</p>
          </div>
        </div>
      </div>

      <!-- 右半部分 -->
      <div class="right-section">
        <div class="row">
          <div class="team-members">
            <div v-for="(member, index) in teamMembers" :key="index" class="member">
              <img :src="member.photo" :alt="member.name" class="member-photo" />
              <p class="member-name">{{ member.name }}</p>
            </div>
          </div>
        </div>
        <div class="row team-name">
          <p>{{ teamName }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HonorDisplay',
  data() {
    return {
      teamMembers: [
        { name: '梁航锋', photo: '/img/member/lhf.png' },
        { name: '梁航锋', photo: '/img/member/lhf.png' },
        { name: '梁航锋', photo: '/img/member/lhf.png' },
      ],
      teamName: '我们一起去',
    };
  },
};
</script>

<style scoped>
.honor-display {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

.honor-display h1 {
  text-align: center;
  font-size: 2em;
  margin-bottom: 20px;
}

.honor-content {
  display: flex;
  justify-content: space-between;
}

.left-section {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.right-section {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.award-photo, .group-photo {
  height: 150px;
}

.photo-frame {
  border: 2px solid #ccc;
  padding: 5px;
}

.medal-image {
  max-width: 100%;
  height:140px;
}

.group-image {
    max-width: 100%;
    height: 140px
  }

.competition-name {
  text-align: center;
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
}

.team-members {
  display: flex;
  justify-content: space-around;
}

.member {
  text-align: center;
}

.member-photo {
  width: 100px;
  height: 100px;
  object-fit: cover;
  border-radius: 50%;
}

.member-name {
  margin-top: 30px;
}

.team-name {
  text-align: center;
  align-items: center;
  display: flex;
  justify-content: center;
  height: 10px
}
</style>
