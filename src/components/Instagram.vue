<template>
  <div class="instagram">
    <!-- carousel part-->
    <section>
      <div class="row">
        <div class="col-lg p-0"></div>
        <div class="col-lg-7 p-0">
          <b-carousel
            id="gallery"
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
        </div>
        <div class="col-lg p-0"></div>
      </div>
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
      let vm = this
      vm.images = [
            {'media_url': "//picsum.photos/1024/480/?image=54", caption: "😕 최신 이미지를 못가져왔어요1"},
            {'media_url': "//picsum.photos/1024/480/?image=58", caption: "😕 최신 이미지를 못가져왔어요2"},
          ]
    },
    methods: {
      onSlideStart() {
        this.sliding = true
      },
      onSlideEnd() {
        this.sliding = false
      }
    }
  }
</script>

<style scoped>
  .instagram {
    margin-top: 56px;
  }
  .about-section h1 {
    font-family: 'Lato', 'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Sans-Serif, serif;
    padding: 7px 15px;
    font-weight: bold;
  }

</style>
