<template>
  <div id="Visitor">
    <h1>🏠 명예의 전당</h1>
    <p>Since 2021. 4. 27</p>
    <hr>
    <p>가장 자주 방문한 사람은 {{data.max_visitor}}번 방문했어요!</p>
    <hr>
    <div v-for="(value, key) in data.date_group" :key="key">
      <p>{{key}}엔 총 {{value}}명 방문했어요!</p>
    </div>
    <hr>
    <div v-for="(value, key) in data.category_group" :key="key">
      <p>{{key}} 사람은 {{value}}명 방문했어요!</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "Visitor",
  data() {
    return {
      data: {},
    }
  },
  created() {
    let vm = this;
    let visitor_url = 'https://9e240d7v0k.execute-api.ap-northeast-2.amazonaws.com/api/visitor'
    this.$http
        .get(visitor_url)
        .then(function (response) {
          vm.data = response.data
          console.log(response.data)
        });
  },
}
</script>

<style scoped>
#Visitor {
  margin-top: 120px;
}
</style>