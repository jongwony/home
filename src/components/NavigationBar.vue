<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="dark" fixed="top">
      <b-navbar-brand>
        <span class="brand">Jongwony</span>
      </b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav v-for="section in ['Gallery', 'Interior', 'Location', 'Recipes', 'BoardGame', 'Calendar']"
                      :key="section">
          <b-nav-item :href="'#' + section">
            {{section}}
          </b-nav-item>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-nav-item href="//github.com/jongwony/fingerstyle" target="_blank">
            <img src="@/assets/GitHub-Mark.webp" alt="" width="16" height="16">
          </b-nav-item>
          <b-nav-item href="//instagram.com/jongwony_/" target="_blank">
            <img src="@/assets/Instagram_AppIcon_Aug2017.webp" alt="" width="16" height="16">
          </b-nav-item>
          <b-nav-item href="//youtube.com/user/lastone9182" target="_blank">
            <img src="@/assets/youtube_social_icon_red.webp" alt="" width="16" height="12">
          </b-nav-item>
          <b-nav-item href="//open.kakao.com/o/sAAucdcd">
            <img class="logo" alt="Kakao" src="@/assets/kakao.webp" width="16" height="12">
          </b-nav-item>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>
  export default {
    name: "NavigationBar",
  }
</script>

<style scoped>
  .brand {
    font-weight: bold;
  }

  a {
    color: ivory;
  }
</style>
