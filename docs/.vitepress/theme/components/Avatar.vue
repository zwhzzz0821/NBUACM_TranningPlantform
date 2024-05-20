<script setup>
import {onMounted, ref} from "vue";
import {ElMessage} from "element-plus";

const is_login = ref(false)
onMounted(() => {
  is_login.value = !!localStorage.getItem('jwt')
  if (!is_login.value) {
    ElMessage({
      message: '请先登录',
      type: 'warning',
    })
  } else {
    url.value = 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png'
  }
})
const url = ref('https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png')

const handleCommand = (command) => {
  ElMessage(`click on item ${command}`)
  switch (command) {
    case 'login':
      location.href = '/login'
      break
    case 'logout':
      localStorage.removeItem('jwt')
      location.reload()
      break
  }
}
</script>

<template>
  <ClientOnly>
    <Teleport to=".VPSocialLink:last-child">
      <div class="VPAvatar avatar">
        <el-dropdown @command="handleCommand">
          <el-avatar :size='20' :src="url"/>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item command="login">登录</el-dropdown-item>
              <el-dropdown-item command="logout">退出</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </Teleport>
  </ClientOnly>
</template>


<style scoped>
.VPAvatar {
  display: flex;
  align-items: center;
}

.avatar::before {
  margin-right: 8px;
  margin-left: 8px;
  width: 1px;
  height: 24px;
  background-color: var(--vp-c-divider);
  content: "";
}

.el-dropdown-link {
  cursor: pointer;
  color: var(--el-color-primary);
  display: flex;
  align-items: center;
}

:deep(:focus-visible) {
  outline: none;
}
</style>
