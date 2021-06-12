<template>
  <div id="Interior">
    <h1>🏠 내부를 소개합니다</h1>
    <hr>
    <img alt="Living Room" src="@/assets/livingroom.jpg">
    <img alt="Bed Room" src="@/assets/bedroom.jpg">
    <img alt="Home Drawing" src="@/assets/drawing.png">
  </div>
</template>

<script>
export default {
  name: "Drawing"
}
</script>

<style scoped>
#Interior {
  margin-top: 120px;
}
img {
  max-width: 640px;
  max-height:480px;
}
</style>