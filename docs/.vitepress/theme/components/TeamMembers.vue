<template>
  <div class="team-members">
    <div v-for="(row, rowIndex) in memberRows" :key="rowIndex" class="member-row">
      <div v-for="(member, index) in row" :key="member.id" :class="['member', { left: index === 0, right: index === 1 }]" @click="toggleDetails(rowIndex * 2 + index)">
        <img :src="member.image" alt="Member photo" class="member-image" />
        <div class="member-info">
          <h3>{{ member.name }}</h3>
          <p>{{ member.position }}</p>
          <transition name="fade">
            <p v-if="member.showDetails" class="details">{{ member.details }}</p>
          </transition>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      members: [
        {
          id: 1,
          name: '梁航锋',
          position: 'ACM协会会长',
          details: '梁航锋，中共预备党员，21级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',
          image: '.vitepress/theme/styles/img/member/lhf.png',
          showDetails: false
        },
        {
          id: 2,
          name: '林成峰',
          position: 'ACM协会副会长',
          details: '林成峰，共青团员，21级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',
          image: '.vitepress/theme/styles/img/member/IMG_1113.JPG',
          showDetails: false
        },
        {
          id: 3,
          name: '赵瑞杰',
          position: 'ACM协会副会长',
          details: '赵瑞杰，共青团员，21级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',
          image: '.vitepress/theme/styles/img/member/IMG_1112.JPG',
          showDetails: false
        },
        {
          id: 4,
          name: '朱文豪',
          position: 'ACM协会宣传部部长',
          details: '梁航锋，中共预备党员，21级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',
          image: '.vitepress/theme/styles/img/member/IMG_1111.JPG',
          showDetails: false
        },
        {
          id: 5,
          name: '赖诗亮',
          position: 'ACM协会成员',
          details: '赖诗亮，发展对象，22级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',
          image: '.vitepress/theme/styles/img/member/IMG_1114.JPG',
          showDetails: false
        },
        {
          id: 6,
          name: '陈炳灿',
          position: 'ACM协会社团部部长',
          details: '陈炳灿，22级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',
          image: '.vitepress/theme/styles/img/member/IMG_1116.JPG',
          showDetails: false
        },
      ]
    };
  },
  computed: {
    memberRows() {
      const rows = [];
      for (let i = 0; i < this.members.length; i += 2) {
        rows.push(this.members.slice(i, i + 2));
      }
      return rows;
    }
  },
  methods: {
    toggleDetails(index) {
      this.members[index].showDetails = !this.members[index].showDetails;
    }
  }
};
</script>

<style scoped>
.team-members {
  display: flex;
  flex-direction: column;
}

.member-row {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

.member {
  flex: 0 0 48%;
  display: flex;
  align-items: center;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 8px;
  transition: transform 0.3s;
  cursor: pointer;
}

.member:hover {
  transform: scale(1.05);
}

.left .member-image {
  margin-right: 15px;
}

.right .member-image {
  margin-left: 15px;
  order: 2;
}

.member-image {
  width: 100px;
  height: 100px;
  border-radius: 50%;
}

.member-info {
  flex: 1;
}

.details {
  margin-top: 10px;
  color: #555;
}

</style>
