<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<div>
	<c:forEach items="${marketList}" var="vo">
		<h3>${vo.marketName}</h3>
		<h3>${vo.marketIntro}</h3>
		<h3>${vo.openTime}</h3>
		<h3>${vo.closeTime}</h3>
		<h3>${vo.isOpen}</h3>
		<h3>${vo.canOrder}</h3>
		<h3>${vo.thumbImg}</h3>
	</c:forEach>
</div>

<%@ include file="./templates/footer.jsp"%>

	<script>
		// script 전역변수
		var latitude;
		var longitude;
		var map;
		
		var marketList = [];
		var geoList = [];
		var positions = [];
		var markers = [];
		var overlays = [];
		
		function getUserGeo() {

			// 좌표 받아오기
			var geocoder = new kakao.maps.services.Geocoder();

			var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					latitude = Math.floor((result[0].x) * 1000000) / 1000000;
					longitude = Math.floor((result[0].y) * 1000000) / 1000000;
				}
			};

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
		
		// 마켓의 마커 가져오기
		function getMarketMarker() {
			
			<c:forEach items="${marketList}" var="vo">
				
				var market = {
						marketName: `${vo.marketName}`,
						marketIntro: `${vo.marketIntro}`,
						openTime: `${vo.openTime}`,
						closeTime: `${vo.closeTime}`,
						isOpen: ${vo.isOpen},
						canOrder: ${vo.canOrder},
						thumbImg: `${vo.thumbImg}`
				};
				
				marketList.push(market);
			</c:forEach>
			
			<c:forEach items="${geoList}" var="vo">
			
				var geo = {
						latitude: ${vo.latitude},
						longitude: ${vo.longitude}
				};
			
				geoList.push(geo);
				
			</c:forEach>
				
			console.log(marketList);
			console.log(geoList);
			
			//=====================================
			// kakao dev 여러개 마커 표시하기
			//=====================================
			
			for(var i=0; i<10; i++) {
	
				var position = {
					title: marketList[i].marketName,
					latlng: new kakao.maps.LatLng(geoList[i].longitude, geoList[i].latitude)
				}
				
				positions.push(position);	
			}
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    
			    markers.push(marker);
			}
		}
		
		// 여기서부터다리
		function makeOverlay() {
			
			//================================================
			// 닫기가 가능한 커스텀 오버레이 작성 공간
			//================================================
			for(var i=0; i<10; i++) {
			 
				var content = '<div class="wrap">' + 
				            '    <div class="info">' + 
				            '        <div class="title">' + 
				            '            카카오 스페이스닷원' + 
				            '            <div class="close" onclick="closeOverlay()" title="닫기">닫기</div>' + 
				            '        </div>' + 
				            '        <div class="body">' + 
				            '            <div class="img">' +
				            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
				            '           </div>' + 
				            '            <div class="desc">' + 
				            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
				            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
				            //'                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
				            '            </div>' + 
				            '        </div>' + 
				            '    </div>' +    
				            '</div>';
       
				// 마커 위에 커스텀오버레이를 표시합니다
				// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				var overlay = new kakao.maps.CustomOverlay({
						content: content,
						map: map,
						position: markers[i].getPosition()
				});
				            
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(markers[i], 'click', function() {
					
					console.log(i);	
					//overlay.setMap(map);
				});
				
				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
				function closeOverlay() {
					overlay.setMap(null);     
				}
			}
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
