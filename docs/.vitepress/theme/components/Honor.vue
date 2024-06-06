<template>
  <div class="options">
    <div
        v-for="(option, index) in options"
        :key="index"
        :class="['option', { active: index === activeIndex }]"
        :style="{ '--optionBackground': `url(${option.background})` }"
        @click="setActive(index)"
    >
      <div class="shadow"></div>
      <div class="label">
        <div class="icon">
          <i :class="option.icon"></i>
        </div>
        <div class="info">
          <div class="main">{{ option.main }}</div>
          <div class="sub">{{ option.sub }}</div>
        </div>
      </div>
    </div>
  </div>
  <a
      href="http://victorofvalencia-blog.tumblr.com"
      target="_blank"
      class="credit"
  >
  </a>
</template>

<script>
export default {
  data() {
    return {
      activeIndex: 0,
      options: [
        {
          background:
              '.vitepress/theme/styles/img/cyb.JPG',
          icon: 'fas fa-walking',
          main: 'ICPC武汉邀请赛 铜奖',
          sub: '陈一波 严齐航 胡健山',
        },
        {
          background:
              '.vitepress/theme/styles/img/zwhjn.JPG',
          icon: 'fas fa-snowflake',
          main: 'ICPC济南区域赛 银奖',
          sub: '朱文豪 赵瑞杰 李嘉琪',
        },
        {
          background:
              '.vitepress/theme/styles/img/zwhnj.JPG',
          icon: 'fas fa-tree',
          main: 'ICPC济南区域赛 银奖',
          sub: '朱文豪 赵瑞杰 李嘉琪',
        },
        {
          background:
              '.vitepress/theme/styles/img/lhfxa.JPG',
          icon: 'fas fa-tint',
          main: 'ICPC西安区域赛 银奖',
          sub: '梁航锋 李浩 林成峰',
        },
        {
          background:
              '.vitepress/theme/styles/img/zwhqhd.JPG',
          icon: 'fas fa-tint',
          main: 'ICPC济南区域赛 银奖',
          sub: '朱文豪 赵瑞杰 李嘉琪',
        },
        {
          background:
              '.vitepress/theme/styles/img/hzwsy.JPG',
          icon: 'fas fa-tint',
          main: 'ICPC沈阳区域赛 银奖',
          sub: '胡值闻 蒋一波 吴凯晟',
        },
        {
          background:
              '.vitepress/theme/styles/img/zwhqhd.JPG',
          icon: 'fas fa-tint',
          main: 'ICPC济南区域赛 银奖',
          sub: '朱文豪 赵瑞杰 李嘉琪',
        },
      ],
    };
  },
  methods: {
    setActive(index) {
      this.activeIndex = index;
    },
  },
};
</script>

<style scoped>


body {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  height: 100vh;

  font-family: 'Roboto', sans-serif;
  transition: 0.25s;
}

.credit {
  position: absolute;
  bottom: 20px;
  left: 20px;
  color: inherit;
}

.options {
  display: flex;
  flex-direction: row;
  align-items: stretch;
  overflow: hidden;
  padding-top: 20px;
  padding-bottom: 60px;
  min-width: 1150px;
  max-width: 1600px;
  width: calc(100% - 100px);
  height: 450px;

}

.option {
  position: relative;
  overflow: hidden;
  min-width: 80px;
  margin: 10px;
  background: var(--optionBackground, var(--defaultBackground, #E6E9ED));
  background-size: auto 120%;
  background-position: center;
  cursor: pointer;
  transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);

&:nth-child(1) {
   --defaultBackground: #ED5565;
 }
&:nth-child(2) {
   --defaultBackground: #FC6E51;
 }
&:nth-child(3) {
   --defaultBackground: #FFCE54;
 }
&:nth-child(4) {
   --defaultBackground: #2ECC71;
 }
&:nth-child(5) {
   --defaultBackground: #5D9CEC;
 }

&.active {
   flex-grow: 10000;
   transform: scale(1);
   max-width: 600px;
   margin: 0;
   border-radius: 40px;
   background-size: auto 100%;

.shadow {
  box-shadow: inset 0 -120px 120px -120px black, inset 0 -120px 120px -100px black;
}
.label {
  bottom: 20px;
  left: 20px;

.info > div {
  left: 0;
  opacity: 1;
}
}
}

&:not(.active) {
   flex-grow: 1;
   border-radius: 30px;

.shadow {
  bottom: -40px;
  box-shadow: inset 0 -120px 0px -120px black, inset 0 -120px 0px -100px black;
}

.label {
  bottom: 10px;
  left: 10px;

.info > div {
  left: 20px;
  opacity: 0;
}
}
}

.shadow {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 120px;
  transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);
}

.label {
  display: flex;
  position: absolute;
  right: 0;
  height: 40px;
  transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95);



.info {
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin-left: 10px;
  color: white;
  white-space: pre;

> div {
  position: relative;
  transition: 0.5s cubic-bezier(0.05, 0.61, 0.41, 0.95), opacity 0.5s ease-out;
}

.main {
  font-weight: bold;
  font-size: 1.2rem;
}

.sub {
  transition-delay: 0.1s;
}
}
}
}
</style>

