<template>
  <div id="Gallery">
    <!-- carousel part-->
    <section>
      <b-carousel
          v-model="slide"
          :interval="5000"
          fade
          controls
          indicators
          background="#ababab"
          style="text-shadow: 1px 1px 2px #333;"
          @sliding-start="onSlideStart"
          @sliding-end="onSlideEnd"
      >
        <!-- v-bind in attributes -->
        <b-carousel-slide v-for="image in images" :key="image['media_url']" :text="image.caption"
                          :img-src="image['media_url']"></b-carousel-slide>
      </b-carousel>
    </section>
  </div>
</template>

<script>
export default {
  name: "Instagram",
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
    if (process.env.NODE_ENV === 'development') {
      instagram_url = 'http://localhost:8000/instagram'
    }
    this.$http
        .get(instagram_url)
        .then(function (response) {
          vm.images = response.data.filter(
              x => x.caption && x.media_type !== 'VIDEO' && x.caption.includes('#home')
          )
        });
  },
  methods: {
    onSlideStart(slide) {
      console.log(slide)
      this.sliding = true
    },
    onSlideEnd(slide) {
      console.log(slide)
      this.sliding = false
    }
  }
}
</script>

<style scoped>

#Gallery {
  margin: auto;
  max-width: 800px;
}

.about-section h1 {
  font-family: 'Lato', 'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Sans-Serif, serif;
  padding: 7px 15px;
  font-weight: bold;
}

</style>
