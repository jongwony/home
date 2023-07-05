<template>
  <div id="Gallery">
    <!-- carousel part-->
    <section>
      <b-carousel
          v-model="slide"
          :interval="4500"
          fade
          style="text-shadow: 1px 1px 2px #333;"
      >
        <!-- v-bind in attributes -->
        <b-carousel-slide v-for="image in images" :key="image['media_url']" :text="image.caption"
                          :img-src="image['media_url']"></b-carousel-slide>
      </b-carousel>
    </section>
    <small>Instagram #home 태그와 연결되었습니다</small>
  </div>
</template>

<script>
export default {
  name: "InstagramFetch",
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
              x => x.caption && x.media_type !== 'VIDEO' && x.caption.includes('#home')
          )
        });
  },
  methods: {}
}
</script>

<style scoped>

#Gallery {
  margin: auto;
  max-width: 640px;
}

.about-section h1 {
  font-family: 'Lato', 'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Sans-Serif, serif;
  padding: 7px 15px;
  font-weight: bold;
}

</style>
