<template>
  <div id="map" style="width:640px;height:480px;text-align:center"></div>
</template>

<script>
export default {
  name: "KakaoMap",
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement('script');
      script.onload = () => kakao.maps.load(this.initMap);
      script.src = '//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=df5f469db561d2fa14f32356239d9ec1';
      document.head.appendChild(script);
    }
  },
  methods: {
    initMap() {
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(37.50318539280487, 127.09610763126503), // 지도의 중심좌표
            level: 2, // 지도의 확대 레벨
          };
      var home = new kakao.maps.LatLng(37.503866433821464, 127.09514153848163);
      var map = new kakao.maps.Map(mapContainer, mapOption);
      // 지도를 클릭한 위치에 표출할 마커입니다
      var marker = new kakao.maps.Marker({
          // 지도 중심좌표에 마커를 생성합니다
          position: home
      });
      // 지도에 마커를 표시합니다
      marker.setMap(map);
    }
  }
}
</script>

<style scoped>

</style>