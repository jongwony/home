<template>
  <div id="CookingRecipes">
    <h1>🍽️ Cooking Diary</h1>
    <small>Instagram #cooking 태그와 연결 되었습니다</small>
    <hr>
    <b-card-group  v-for="(items, idx) in zipItem(images)" :key="idx" deck>
      <b-card
          v-for="image in items" :key=image.media_url
          :img-src="image.media_url"
          class="d-inline-flex"
      >
        <b-card-text>
          {{ image.caption }}
        </b-card-text>
        <template #footer v-if="image.timestamp">
          <small class="text-muted">{{ localDate(image.timestamp) }}</small>
        </template>
      </b-card>
    </b-card-group>
  </div>
</template>

<script>
export default {
  name: "CookingRecipes",
  data() {
    return {
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
              x => x.caption && x.media_type !== 'VIDEO' && x.caption.includes('#cooking')
          )
          vm.images.forEach((x, index) => {
            let element = x;
            element.caption = element.caption.replace('#cooking', '');
            vm.images[index] = element;
          });
        });
  },
  methods: {
    zipItem(items) {
      return items.reduce((c, n, i) => {
        console.log(c, n, i)
        if (i % 3 === 0) c.push([]);
        c[c.length - 1].push(n);
        return c;
      }, []);
    },
    localDate(string) {
      let date = new Date(string);
      let dateString = `${date.getFullYear()}년 ${date.getMonth() + 1}월 ${date.getDate()}일 ${date.getHours()}시 ${date.getMinutes()}분`
      return dateString
    }
  }
}
</script>

<style scoped>
#Recipes {
  margin-top: 120px;
}
</style>
