<template>
  <div id="Interior">
    <h1>🏠 소개합니다</h1>
    <p>아일랜드 2인 - 거실 4인이 적당해요</p>
    <hr>

    <div style="line-height: 0;">
      <div class="grid" v-for="(image, idx) in images" :key="idx">
        <img :key="idx" :src="image['media_url']" :alt="image.caption">
      </div>
    </div>
    <small>Instagram #interior 태그와 연결되었습니다</small>
  </div>
</template>

<script>
export default {
  name: "InteriorDrawing",
  data() {
    return {
      slide: 0,
      sliding: null,
      props: {
        caption: String,
        text: String,
        'img-src': String,
      },
      embeds: [],
      images: []
    }
  },
  created() {
    let vm = this;
    let instagram_url = 'https://9e240d7v0k.execute-api.ap-northeast-2.amazonaws.com/api/instagram'
    this.$http
      .get(instagram_url)
      .then(function (response) {
        vm.images = response.data.filter(
          x => x.caption && x.media_type !== 'VIDEO' && x.caption.includes('#interior')
        )
      });
  },
}
</script>

<style scoped>
#Interior {
  margin-top: 120px;
}

.grid {
  display: inline-flex;
  line-height: 0;
  /* create n columns */
}

img {
  image-orientation: from-image;
  height: auto;
  max-width: 160px;
  vertical-align: middle;
}
</style>