<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	
	<!-- kakao Map API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5330df6f4ac31d266d5cced5bfc44a1e&libraries=services,clusterer,drawing"></script>
	
	<style type="text/css">
	#main{
		margin-top: 100px;
	}
	
	#map {
		margin-left: 100px;
	}
	</style>
</head>
<body>
<%@ include file="./templates/header.jsp"%>

<div id="main">
	<button id="ready">ready</button>
	<div id="map" style="width:1200px;height:600px;"></div>
</div>
<%@ include file="./templates/footer.jsp"%>

	<script>
		var latitude;
		var longitude;
		var map;
		
		function getUserGeo() {

			// 좌표 받아오기
			var geocoder = new kakao.maps.services.Geocoder();

			var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					latitude = Math.floor((result[0].x) * 1000000) / 1000000;
					longitude = Math.floor((result[0].y) * 1000000) / 1000000;
				}
			};

			console.log(`${address}`);
			geocoder.addressSearch(`${address}`, callback);
		}

		function getMap() {
			
			//================================
			// 지도 띄우기
			//================================
			var container = document.getElementById('map');
			console.log(latitude);
			console.log(longitude);
			var options = {
				center : new kakao.maps.LatLng(longitude, latitude), // 지도 중심좌표 설정
				level : 3											 // 줌인정도
			};

			map = new kakao.maps.Map(container, options);
		}
		
		function getUserMarker() {
			
			//=================================
			// 마커 띄우기 
			//=================================
			var marker = new kakao.maps.Marker({

				position : map.getCenter()
			// 지도 중심좌표에 마커를 생성합니다  
			});
			marker.setMap(map); // 지도에 마커를 표시합니다

			//=================================
			// 마커 이벤트
			//=================================
			// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:5px;">내 위치!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent
			});

			// 마커에 마우스오버 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				infowindow.open(map, marker);
			});

			// 마커에 마우스아웃 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseout', function() {
				// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
				infowindow.close();
			});
		}
		
		// 마켓 정보 어케 읽음? 환장해요
		function getMarketMarker() {
			
			var marketList = `${marketList}`;
			console.log(marketList[0]);
		}
		
		function showMap() {

			setTimeout(function() {

				getMap();
				getUserMarker();
				getMarketMarker();
				
			}, 500);
		}

		var readyBtn = document.getElementById('ready');
		readyBtn.addEventListener('click', function() {

			getUserGeo();
			showMap();
		});
	</script>
</body>
</html>
