<template>
  <div id="Recipes">
    <h1>🍽️ 요리를 좋아합니다.</h1>
    <p>메인 / 사이드 요리, 칵테일을 제공해요</p>
    <hr>
    <div v-for="category in ['main', 'side', 'cocktail']" :key=category>
      <b-card-group v-for="(items, idx) in zipItem(category)" :key="idx" columns>
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
      </b-card-group>
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
        footer: '우리아이 영양간식',
      },
      {
        src: 'truffle_scrambled_egg.jpg',
        title: '양식 스크램블 에그',
        description: '에그.. 트러플.. 생크림.. 환상',
        footer: '촉촉쓰',
      },
      {
        src: 'soba.jpg',
        title: '메밀소바',
        description: '쯔유가 있어 빠릅니다',
        footer: '낫또 커스텀 애정해'
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
        src: 'alio_olio.jpg',
        title: '알리오 올리오',
        description: '파스타 최고 아웃풋',
        footer: '트러플 오일 있음',
      },
      {
        src: 'carbonara.jpg',
        title: '까르보나라',
        description: '파스타 클래스에서 습득한 정통방식',
        footer: '우유 안 들어감'
      },
      {
        src: 'stir_fried_pork.jpg',
        title: '고추잡채',
        footer: '대용량.. 빠른 조리..',
      },
      {
        src: 'dry_curry.jpeg',
        title: '드라이 커리',
        footer: '양파와 토마토의 PPAP'
      },
      {
        src: 'chicken_soysauce.jpeg',
        title: '간장 닭조림',
        description: '승우아빠의 닭이 아니라 김치 영상에 있다고 한다',
        footer: 'ㄹㅇ 밥도둑'
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
#Recipes {
  margin-top: 120px;
}

img {
  max-width: 240px;
  display: flex;
  margin-left: auto;
  margin-right: auto;
}

.card-columns {
  max-width: 240px;
  padding: 20px;
  position: relative;
  display: inline-block;
  overflow: auto;
}

</style>
