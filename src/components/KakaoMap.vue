<template>
  <div id="Location">
    <h1>🗺️ 오시는 길</h1>
    <p>석촌고분역 1번 출구 - 근처에 다수의 따릉이가 있습니다.</p>
    <hr>
    <div id="map" />
    <!-- <div id="roadview" /> -->
  </div>
</template>

<script>
export default {
  name: "KakaoMap",
  data() {
    return {
      map: null,
      homeMarker: null,
      geocoder: null,
      infoWindow: null,
      homeInfoWindow: null,
    }
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement('script');
      script.onload = () => kakao.maps.load(this.initMap);
      script.src = '//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=df5f469db561d2fa14f32356239d9ec1&libraries=services';
      document.head.appendChild(script);
    }
    // this.seoulBike();
  },
  methods: {
    seoulBike(map) {
      let centerLat = 37.50318;
      let centerLng = 127.0961;

      let seoul_bike_url = 'https://9e240d7v0k.execute-api.ap-northeast-2.amazonaws.com/api/seoul_bike/get_station'
      this.$http
        .post(seoul_bike_url, { latitude: centerLat, longitude: centerLng, distance: 500 })
        .then(function (response) {
          response.data.filter(
            function (data) {
              // 마커를 생성합니다
              var markerPosition = new kakao.maps.LatLng(data['stationLatitude'], data['stationLongitude'])

              var imageSrc = require(`@/assets/green_marker.png`) // 마커이미지의 주소입니다    
              var imageSize = new kakao.maps.Size(38, 52)         // 마커이미지의 크기입니다
              var imageOption = { offset: new kakao.maps.Point(19, 32) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

              // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
              var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)

              // 마커를 생성합니다
              var marker = new kakao.maps.Marker({
                position: markerPosition,
                image: markerImage // 마커이미지 설정 
              });

              // 마커가 지도 위에 표시되도록 설정합니다
              marker.setMap(map);

              // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
              var content = '<div class="customoverlay">' +
                '    <span class="title">' + data['parkingQRBikeCnt'] + '</span>' +
                '</div>';

              // 커스텀 오버레이를 생성합니다
              var customOverlay = new kakao.maps.CustomOverlay({
                map: map,
                position: markerPosition,
                content: content,
                yAnchor: 1
              });
              customOverlay.setMap(map)

            })
        });
    },
    initMap() {
      let home = new kakao.maps.LatLng(37.503866433821464, 127.09514153848163);

      let mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
          center: home, // 지도의 중심좌표
          level: 4, // 지도의 확대 레벨
        };
      this.map = new kakao.maps.Map(mapContainer, mapOption);
      // 지도를 클릭한 위치에 표출할 마커입니다
      this.homeMarker = new kakao.maps.Marker({
        // 지도 중심좌표에 마커를 생성합니다
        position: home
      });
      // 지도에 마커를 표시합니다
      this.homeMarker.setMap(this.map);

      // 주소-좌표 변환 객체를 생성합니다
      this.geocoder = new kakao.maps.services.Geocoder();

      // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
      this.infowindow = new kakao.maps.InfoWindow({ zindex: 1 });
      this.homeInfoWindow = new kakao.maps.InfoWindow({ zindex: 1 });

      // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
      this.homeInfoWindow.setContent('<div style="padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">송파구 삼전동 <br> 백제고분로 31길 11-6</div>');
      this.homeInfoWindow.open(this.map, this.homeMarker);

      // let roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
      // let roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
      // let roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

      // // 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
      // roadviewClient.getNearestPanoId(home, 50, function (panoId) {
      //   roadview.setPanoId(panoId, home); //panoId와 중심좌표를 통해 로드뷰 실행
      // });

      this.seoulBike(this.map);
    },
  }
}
</script>

<style scoped>
#Location {
  margin-top: 120px;
}

#map {
  width: 100%;
  max-width: 640px;
  height: 480px;
  display: inline-block;
  overflow: auto;
  color: #333333;
}

#roadview {
  width: 100%;
  max-width: 360px;
  height: 480px;
  display: inline-block;
  overflow: auto;
}
</style>