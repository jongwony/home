<template>
  <div class="recipes">
    <section>
      <b-card-group id="youtube" columns>
        <b-card
          no-body
          style="max-width: 25rem;"
          v-for="embed in embeds"
          :key="embed.id"
        >
          <template v-slot:header>
            <b-embed
              type="iframe"
              aspect="16by9"
              :src="'https://www.youtube.com/embed/' + embed.id"
              allowfullscreen
            ></b-embed>
          </template>

          <b-card-body>
            <b-card-title>{{ embed.title }}</b-card-title>
            <b-card-sub-title v-if="embed.subtitle" class="mb-2">{{ embed.subtitle }}</b-card-sub-title>
            <b-card-text>
              {{ embed.description }}
            </b-card-text>
          </b-card-body>

          <b-card-body v-if="embed.downloads">
            <b-button variant="outline-danger">{{ embed.downloads }}</b-button>
            <b-button variant="outline-primary">{{ embed.downloads }}</b-button>
          </b-card-body>

          <b-card-footer v-if="embed.footer">{{ embed.footer }}</b-card-footer>

        </b-card>
      </b-card-group>
    </section>
  </div>
</template>

<script>
  export default {
    name: "Recipes",
    data() {
      return {
        embeds: []
      }
    },
    created() {
      let vm = this
      this.$http
        .get('https://wr6wm9szy5.execute-api.ap-northeast-2.amazonaws.com/api/youtube')
        .then(function (response) {
          vm.embeds = response.data.filter(k => k.privacy !== 'private')
        }).catch(function () {
        vm.embeds = [
          {id: '1fwRzD1INZw', title: '😕', description: '최신 영상을 불러오지 못했어요!', privacy: "public"},
          {id: 'Tx2cGzsPSlc', title: '😕', description: '최신 영상을 불러오지 못했어요!', privacy: "private"},
          {id: 'yW7K20UUx5c', title: '😕', description: '최신 영상을 불러오지 못했어요!'}
        ].filter(k => k.privacy !== 'private')
      })
    }
  }
</script>

<style scoped>
  .about-section h1 {
    font-family: 'Lato', 'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Sans-Serif, serif;
    padding: 7px 15px;
    font-weight: bold;
  }

</style>
