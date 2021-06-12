<template>
  <div id="app">
    <NavigationBar/>
    <div class="row">
      <div class="col-lg"></div>
      <div class="col-lg-10">
        <Instagram/>
        <Drawing/>
        <KakaoMap/>
        <Recipes/>
        <Calendar/>
      </div>
      <div class="col-lg"></div>
    </div>
  </div>
</template>

<script>
import KakaoMap from './components/KakaoMap.vue'
import Instagram from './components/Instagram.vue'
import Recipes from './components/Recipes.vue'
import Calendar from './components/Calendar.vue'
import Drawing from './components/Drawing.vue'
import NavigationBar from './components/NavigationBar'

export default {
  name: 'App',
  components: {
    NavigationBar,
    Recipes,
    KakaoMap,
    Instagram,
    Calendar,
    Drawing
  }
}
</script>

<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
