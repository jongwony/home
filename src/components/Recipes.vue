<template>
  <div class="recipes">
    <b-row cols="3" style="padding:30px">
      <b-col v-for="(images, idx) in zipImages" :key="idx" col no-gutters>

        <b-card
            v-for="image in images" :key=image.src
            :img-src="require(`@/assets/${image.src}`)"
            :bg-variant="image.signature ? image.signature : undefined"
            :text-variant="image.signature ? 'white' : undefined"
            class="mb-3"
        >
          <b-card-title>{{ image.title }}</b-card-title>
          <b-card-sub-title v-if="image.subtitle" :sub-title-text-variant="image.signature ? 'secondary' : undefined">
            {{ image.subtitle }}
          </b-card-sub-title>
          <b-card-text>
            {{ image.description }}
          </b-card-text>
          <template #footer v-if="image.footer">
            <small class="text-muted">{{ image.footer }}</small>
          </template>
        </b-card>
      </b-col>
    </b-row>
  </div>
</template>

<script>
export default {
  name: "Recipes",
  data() {
    return {
      images: []
    }
  },
  created() {
    let vm = this
    vm.images = [
      {
        src: 'salmon_rice_bowl.jpg',
        title: '사케동',
        signature: 'dark',
        subtitle: '시그니처 메뉴',
        description: '실패한적 없음',
        footer: '노르웨이에서 오니 이틀 전 예약 필요',
      },
      {
        src: 'mille_feuille_nabe.jpg',
        title: '밀푀유나베',
        description: '비주얼 최고 실패율 적음',
        footer: '싱거웠던 적 있음',
      },
      {
        src: 'shabushabu.jpg',
        title: '샤브샤브',
        description: '굴소스 그는 신인가!! 굴소스 그는 신인가!! 굴소스 그는 신인가!!',
        footer: '비주얼은 이래도 맛있었음',
      },
      {
        src: 'stir_fried_pork.jpg',
        title: '고추잡채',
        description: '간단하고 빠르게 대용량 만들 수 있음',
        footer: '처음 했을 때도 평이 좋았음',
      },
      {
        src: 'liege_waffle.jpg',
        title: '리에주 와플',
        description: '와플은 딱딱해야지',
        footer: '발효가 필요해서 1시간 전에 해야함',
      }
    ]
  },
  computed: {
    zipImages() {
      return this.images.reduce((c, n, i) => {
        if (i % (Math.ceil(this.images.length / 3)) === 0) c.push([]);
        c[c.length - 1].push(n);
        return c;
      }, []);
    }
  }
}
</script>

<style scoped>
img {
  max-width: 300px;
  display: flex;
  margin-left: auto;
  margin-right: auto;
}

.card-deck .card {
  max-width: 300px;
  position: relative;
  display: grid;
}

</style>
