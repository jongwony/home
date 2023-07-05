<template>
  <div id="app">
    <NavigationBar/>
    <div>
      <InstagramFetch/>
      <InteriorDrawing/>
      <KakaoMap/>
      <CookingRecipes/>
      <BoardGame/>
      <GoogleCalendar/>
    </div>
  </div>
</template>

<script>
import KakaoMap from './components/KakaoMap.vue'
import InstagramFetch from './components/InstagramFetch.vue'
import CookingRecipes from './components/CookingRecipes.vue'
import GoogleCalendar from './components/GoogleCalendar.vue'
import InteriorDrawing from './components/InteriorDrawing.vue'
import NavigationBar from './components/NavigationBar'
import BoardGame from "./components/BoardGame"

export default {
  name: 'App',
  components: {
    BoardGame,
    NavigationBar,
    CookingRecipes,
    KakaoMap,
    InstagramFetch,
    GoogleCalendar,
    InteriorDrawing,
  }
}
</script>

<style>
:root {
  --element-size: 4rem;
  --background-color-primary: #1e1e1e;
  --background-color-secondary: #2d2d30;
  --accent-color: #3f3f3f;
  --text-primary-color: #cacaca;
}
:root.light-theme {
  --background-color-primary: #ebebeb;
  --background-color-secondary: #fafafa;
  --accent-color: #cacaca;
  --text-primary-color: #2c3e50;
}
.card {
  margin: 20px;
  max-width: 240px;
  text-align: center;
  border: 1px solid var(--accent-color);
  border-radius: 4px;
  color: var(--text-primary-color);
  background-color: var(--background-color-secondary);
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: var(--text-primary-color);
  background-color: var(--background-color-primary);
  margin-top: 55px;
}
</style>
