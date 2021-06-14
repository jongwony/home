<template>
  <div id="Interior">
    <h1>🏠 소개합니다</h1>
    <p>아일랜드 2인 - 거실 4인이 적당해요</p>
    <hr>
    <img class="vertical" alt="Living Room" src="@/assets/kitchen.jpg">
    <img class="vertical" alt="Bed Room" src="@/assets/bedroom.jpg">
    <img class="horizontal" alt="Yacht Dice" src="@/assets/living_room.jpg">
    <hr>
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
  margin: 32px;
}
.vertical {
  max-width: 320px;
  max-height: 480px;
}
.horizontal {
  max-width: 480px;
  max-height: 320px;
}
</style>