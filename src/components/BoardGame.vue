<template>
  <div id="BoardGame">
    <h1>🎲 놀거리</h1>
    <p>여러가지 보드게임이 있고 빔 프로젝트로 닌텐도를 할 수 있어요</p>
    <hr>
    <div v-for="category in ['board_game', 'nintendo']" :key=category>
      <b-card-group v-for="(items, idx) in zipItem(category)" :key="idx" deck>
        <b-card
            v-for="item in items" :key=item.src
            :img-src="require(`@/assets/${item.src}`)"
            :bg-variant="item.signature ? item.signature : undefined"
            :text-variant="item.signature ? 'white' : undefined"
            class="d-inline-flex"
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
  name: "BoardGame",
  data() {
    return {
      main : [],
      side : [],
      cocktail : [],
    }
  },
  created() {
    let vm = this;
    vm.nintendo = [
      {
        src: 'yacht_dice.jpg',
        title: 'Yacht Dice',
        description: '주사위로 하는 포커',
        footer: '2인 게임',
      },
      {
        src: 'mario_party.jpg',
        title: '슈퍼 마리오 파티',
        footer: '2~4인 게임(조이콘 필요)',
      },
    ];
    vm.board_game = [
      {
        src: 'tichu.jpg',
        title: '티츄',
        description: '포브스 선정 4인이라면 꼭 해봐야 할 게임',
        footer: '4인 게임',
      },
      {
        src: 'avalon.jpg',
        title: '레지스탕스 아발론',
        description: '탈락자가 없는 마피아 게임',
        footer: '6~9인 추천',
      },
      {
        src: 'citadel.jpg',
        title: '시타델',
        description: '권모와 술수',
        footer: '최대 7인 게임, 5인 추천',
      },
    ];
  },
  methods: {
    zipItem(category) {
      return this[category].reduce((c, n, i) => {
        console.log(c, n, i)
        if (i % 3 === 0) c.push([]);
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
#BoardGame {
  margin-top: 120px;
}

.card {
  margin: 20px;
  max-width: 240px;
}
</style>
