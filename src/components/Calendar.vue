<template>
  <div id="Calendar">
    <h1>📅 일정을 맞춰보아요</h1>
    <hr>
    <div class="googleCalendar">
      <b-embed
          type="iframe"
          aspect="embed-responsive-4by3"
          src="https://calendar.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%23ffffff&amp;ctz=Asia%2FSeoul&amp;src=bGFzdG9uZTkxODJAZ21haWwuY29t&amp;src=MGpmMTg4MzJ1MDZnMGRmZzNsMmJ0Z29wY3NAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;color=%23B39DDB&amp;color=%238E24AA&amp;showTitle=0&amp;showNav=1&amp;showPrint=0&amp;showCalendars=0"
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
  width: 50%;
  padding-bottom: 50%;
  margin: auto;
}

.googleCalendar iframe{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

#Calendar {
  margin-top: 120px;
}
</style>