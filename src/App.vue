<template>
  <div id="app">
    <div class="row">
      <div class="col"></div>
      <div class="col-10">
        <Instagram/>
        <KakaoMap/>
        <Drawing/>
        <Recipes/>
        <Calendar/>
      </div>
      <div class="col"></div>
    </div>
  </div>
</template>

<script>
import KakaoMap from './components/KakaoMap.vue'
import Instagram from './components/Instagram.vue'
import Recipes from './components/Recipes.vue'
import Calendar from './components/Calendar.vue'
import Drawing from './components/Drawing.vue'

export default {
  name: 'App',
  components: {
    Recipes,
    KakaoMap,
    Instagram,
    Calendar,
    Drawing
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
