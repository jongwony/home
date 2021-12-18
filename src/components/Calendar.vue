<template>
  <div id="Calendar">
    <h1>📅 날 잡자</h1>
    <a href="//open.kakao.com/o/sAAucdcd">
      <img class="logo" alt="Kakao" src="@/assets/kakao.webp">
    </a>
    <a href="//www.instagram.com/jongwony_/">
      <img class="logo" alt="Instagram" src="@/assets/Instagram_AppIcon_Aug2017.webp">
    </a>
    <hr>
    <div class="googleCalendar">
      <b-embed
          type="iframe"
          aspect="embed-responsive-4by3"
          src="//calendar.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%232d2d30&amp;ctz=Asia%2FSeoul&amp;src=bGFzdG9uZTkxODJAZ21haWwuY29t&amp;src=MGpmMTg4MzJ1MDZnMGRmZzNsMmJ0Z29wY3NAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;color=%23B39DDB&amp;color=%238E24AA&amp;showTitle=0&amp;showNav=1&amp;showPrint=0&amp;showCalendars=0"
      ></b-embed>
    </div>
  </div>
</template>

<script>
  export default {}
</script>

<style scoped>
.googleCalendar{
  position: relative;
  height: 0;
  width: 90%;
  padding-bottom: 90%;
  margin: auto;
}

.googleCalendar iframe{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.logo {
  width: 32px;
  margin: 8px;
}

#Calendar {
  margin-top: 120px;
}
</style>