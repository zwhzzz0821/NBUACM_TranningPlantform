<template>
    <div>
      <h1>this is a test</h1>
      <p>{{ message }}</p>
    </div>
</template>

<script>
export default {
data() {
    return {
    message: 'Hello, Vue!'
    };
}
};
</script>

<style scoped>
/* 你可以在这里添加CSS样式，它们只会应用到这个组件上 */
h1 {
color: #42b983;
}
p {
font-size: 1.2em;
}
</style>