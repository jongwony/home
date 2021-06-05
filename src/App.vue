<template>
  <div id="app">
    <Instagram/>
    <img alt="Vue logo" src="./assets/logo.png">
    <KakaoMap/>
    <img alt="Home Drawing" src="./assets/drawing.png">
    <Recipes/>
  </div>
</template>

<script>
import KakaoMap from './components/KakaoMap.vue'
import Instagram from './components/Instagram.vue'
import Recipes from './components/Recipes.vue'

export default {
  name: 'App',
  components: {
    Recipes,
    KakaoMap,
    Instagram
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
