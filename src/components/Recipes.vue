<template>
  <div class="recipes">
    <div v-for="category in ['main', 'side', 'cocktail']" :key=category>
      <h1 v-if="itemExists(category)">{{category}}</h1>
      <hr>
      <b-row cols="3" style="padding:30px">
        <b-col v-for="(items, idx) in zipItem(category)" :key="idx" col no-gutters>
          <b-card
              v-for="item in items" :key=item.src
              :img-src="require(`@/assets/${item.src}`)"
              :bg-variant="item.signature ? item.signature : undefined"
              :text-variant="item.signature ? 'white' : undefined"
              class="mb-3"
          >
            <b-card-title>{{ item.title }}</b-card-title>
            <b-card-sub-title v-if="item.subtitle" :sub-title-text-variant="item.signature ? 'secondary' : undefined">
              {{ item.subtitle }}
            </b-card-sub-title>
            <b-card-text>
              {{ item.description }}
            </b-card-text>
            <template #footer v-if="item.footer">
              <small class="text-muted">{{ item.footer }}</small>
            </template>
          </b-card>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
export default {
  name: "Recipes",
  data() {
    return {
      main : [],
      side : [],
      cocktail : [],
    }
  },
  created() {
    let vm = this;
    vm.cocktail = [];
    vm.side = [
      {
        src: 'liege_waffle.jpg',
        title: '리에주 와플',
        description: '와플은 딱딱해야지',
        footer: '발효가 필요해서 1시간 전에 해야함',
      },
      {
        src: 'cabbage_pickle.jpg',
        title: '배추 겉절이',
        description: '우리아이 영양간식',
      },
    ];
    vm.main = [
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
        footer: '처음 했을 때도 평이 좋았음',
      },
    ];
  },
  methods: {
    zipItem(category) {
      return this[category].reduce((c, n, i) => {
        console.log(c, n, i)
        if (i % (Math.ceil(this[category].length / 3)) === 0) c.push([]);
        c[c.length - 1].push(n);
        return c;
      }, []);
    },
    itemExists(category) {
      return this[category].length !== 0
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
