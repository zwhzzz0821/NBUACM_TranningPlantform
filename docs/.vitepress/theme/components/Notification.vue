<template>
  <div>
    <div class="tabCon">
      <div class="gundong" id="marqueebox1">
        <ul>
          <li v-for="(item, index) in notifications" :key="index" class="xueshuli">
            <a :href="item.url" target="_blank" :title="item.title">{{ item.title }}</a>
          </li>
        </ul>
      </div>
    </div>
    <div align="right" style="padding-top:22px;">
      <br>

      <a class="otherA" href="index/xshd.htm">更多信息>></a>
      <br>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NotificationComponent',
  data() {
    return {
      notifications: [
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
        {
          title: '宁大学子在2024年ICPC国际大学生程序设计竞赛全国邀请赛中荣获金奖',
          url: 'News/News001',
        },
      ],
    };
  },
};
</script>

<style scoped>
.otherA {
  color: #000;
  font-size: 25px;
  text-decoration: none;
}

.otherA:hover {
  color: #3a5ccc;
  text-decoration: underline;
}

.gundong {
  height: 360px;
  overflow-y: auto;
}

.xueshuli {
  margin: 5px 0;
}

.xueshuli a {
  color: #333;
  text-decoration: none;
}

.xueshuli a:hover {
  color: #3a5ccc;
  text-decoration: underline;
}
</style>
