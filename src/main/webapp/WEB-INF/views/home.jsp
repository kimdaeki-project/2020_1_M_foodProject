<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<!-- kakao Map API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5330df6f4ac31d266d5cced5bfc44a1e&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>

<body>
	<%@ include file="./templates/header.jsp"%>
	<div class="contents">
		<div>
			//돌아가는 이미지
		</div>
		<div>
			//추천메뉴
		</div>
		<div id="main">
			<div id="map" style="width: 90%; height: 50%"></div>
		</div>
		<div class="home_question">
			<div class="home_question_wrap">
				<pre class="home_q_pre">프레시코드는
"샐러드는 배고픈 다이어트 음식" 이라는 편견을 깨고
대한민국 직장인의 건강한 식사 문화를 만들고자 합니다.</pre>
				<ul class="home_q_ul">
					<li class="home_q_li">이메일 : help@freshcode.me</li>
					<li class="home_q_li">카카오ID : @프레시코드-freshcode</li>
					<li class="home_q_li">단체주문 문의 : order@freshcode.me</li>
				</ul>
				<nav class="home_q_nav">
					<button class="home_q_btn">단체/케이터링 문의</button>
				</nav>
			</div>
			<section class="home_insta" style="padding: 48px 30px 72px;">
				//인스타그램
			</section>
		</div>
	</div>


	<%@ include file="./templates/footer.jsp"%>

	<script>
		//=======================================
		// script 전역변수
		//=======================================
		var latitude;
		var longitude;
		var map;
		var g_marketInfos = [];
		
		//========================================
		//main marker 좌표값 받아오기
		//========================================
		function getUserGeo() {

			var geocoder = new kakao.maps.services.Geocoder();

			var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					latitude = Math.floor((result[0].x) * 1000000) / 1000000;
					longitude = Math.floor((result[0].y) * 1000000) / 1000000;
				}
			};

			geocoder.addressSearch(`${address}`, callback);
		}

		//================================
		// 지도 띄우기
		//================================
		function getMap() {
			
			var container = document.getElementById('map');
			console.log(latitude);
			console.log(longitude);
			var options = {
				center : new kakao.maps.LatLng(longitude, latitude), // 지도 중심좌표 설정
				level : 3											 // 줌인정도
			};

			map = new kakao.maps.Map(container, options);
		}
		
		//=================================
		// 마커 띄우기 
		//=================================
		function getUserMarker() {
		
			var marker = new kakao.maps.Marker({

				position : map.getCenter() // 지도 중심 좌표로 마커 위치 설정 
			});
			marker.setMap(map); // 지도에 마커를 표시합니다

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
		
		//===============================
		// 마켓의 기본 데이터 가져오기
		//===============================
		function getMarkets() {
			
			var markets = [];
			
			<c:forEach items="${marketList}" var="vo">

				var market = {
						//userNum(오버레이 id 값), avg rating(오버레이에 추가로 필요한 정보) 필요
						marketName: `${vo.marketName}`,
						marketIntro: `${vo.marketIntro}`,
						openTime: `${vo.openTime}`,
						closeTime: `${vo.closeTime}`,
						isOpen: ${vo.isOpen},
						canOrder: ${vo.canOrder},
						thumbImg: `${vo.thumbImg}`
				};
				
				markets.push(market);	

			</c:forEach>
			
			return markets;
		}
		
		//===============================
		// 마켓의 Geo 데이터 가져오기
		//===============================
		function getGeos() {
			
			var geos = [];
			
			<c:forEach items="${geoList}" var="vo">
				
				var geo = {
						latitude: ${vo.latitude},
						longitude: ${vo.longitude}
				};
				
				geo.latitude = Math.ceil(geo.latitude*1000000)/1000000;
				geo.longitude = Math.ceil(geo.longitude*1000000)/1000000;
				geos.push(geo);
				
			</c:forEach>
			
			return geos;
		}
	
		//===============================
		// 마켓 포지션 가져오기
		//===============================
		function getPositions(markets, geos) {
			
			var positions = [];
			
			for(var i=0; i<markets.length; i++) {

				var position = {
					title: markets[i].marketName,
					latlng: new kakao.maps.LatLng(geos[i].longitude, geos[i].latitude)
				}
				
				positions.push(position);	
			}
			
			return positions;
		}
		
		//===============================
		// 마켓의 마커 가져오기
		//===============================
		function getMarkers(positions) {

			var markers = [];
		
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i=0; i<positions.length; i++) {
			    
			    var imageSize = new kakao.maps.Size(24, 35); // 마커 이미지의 이미지 크기 입니다 
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); // 마커 이미지를 생성합니다    
			    
			 	// 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    
			    markers.push(marker);
			}
			
			return markers;
		}
		
		//=============================
		// 커스텀 오버레이 생성
		//=============================
		function getOverlays(markets, markers) {

			var overlays = [];
			
			for(var i=0; i<markets.length; i++) {

				var content = '<div class="wrap">' + 
	            '    <div class="info">' + 
	            '        <div class="title">' + markets[i].marketName + 
	            '            <div class="close" id="'+ markets[i].marketName +'"'+' onclick="overlayCloseHandler(this.id)" title="닫기"></div>' + 
	            '        <div class="body">' + 
	            '            <div class="img" id="'+ markets[i].marketName +'"'+' onclick="marketSelectHandler(this.id)" title="마켓 이동">' +
	            '                <img src="#" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="desc">' + 
	            '                <div class="market">' + markets[i].marketIntro +
	            '				 </div>' + 
	            '                <div class="time">(open ~ close)'+ markets[i].openTime + ' ~ ' + markets[i].closeTime + '</div>' + 
	            '                <div class="time">별점</div>' + 
	            '            </div>' + 
	            '	    </div>' + 
	            '    </div>' +    
	            '</div>';
	
				// 커스텀 오버레이가 표시될 위치입니다
				var position = markers[i].getPosition();  
				
				// 커스텀 오버레이를 생성합니다
				var customOverlay = new kakao.maps.CustomOverlay({
				    position: position,
				    content: content   
				});
				
				overlays.push(customOverlay);
			}
			
			return overlays;
		}
		
		//======================
		// 마켓Infos 생성
		//======================
		function getMarketInfos() {
			
			var markets = getMarkets();
			var geos = getGeos();
			var positions = getPositions(markets, geos);
			var markers = getMarkers(positions);
			var overlays = getOverlays(markets, markers);
			
			for(var i=0; i<markets.length; i++) {
				
				var marketInfo = {
						market: markets[i],
						geo: geos[i],
						position: positions[i],
						marker: markers[i],
						overlay: overlays[i],
				}
				
				g_marketInfos.push(marketInfo);
			}
		}
		
		//==========================
		// 마켓 관련 이벤트 등록
		//==========================
		function markerEventHandler(marker, overlay) {
			
			kakao.maps.event.addListener(marker, 'click', function() {
				
				for(var i=0; i<g_marketInfos.length; i++) {
					
					if(g_marketInfos[i].overlay === overlay) {
						g_marketInfos[i].overlay.setMap(map);
					} else {
						
						g_marketInfos[i].overlay.setMap(null);
					}
				}
			});
		}
		
		//====================
		// 마켓 close Handler
		//====================
		function overlayCloseHandler(clickedId) {
			
			for(var i=0; i<g_marketInfos.length; i++) {
				
				console.log(g_marketInfos[i].market.marketName);
				var marketName = g_marketInfos[i].market.marketName;
				if(clickedId === marketName) {
					
					var overlay = g_marketInfos[i].overlay;
					overlay.setMap(null);
					
					return;
				}
			}
		}
		
		//====================
		// 마켓 select Handler
		//====================
		function marketSelectHandler(clickedId) {
		
			console.log("save");
			location.href = '/project/market/marketSelect?userNum=29';
		}
		
		//====================
		// 메인함수
		//====================
		function main() {
			
			getUserGeo();
			
			setTimeout(function() {

				getMap();
				getUserMarker();
				getMarketInfos();

				for(var i=0; i<g_marketInfos.length; i++) {
					markerEventHandler(g_marketInfos[i].marker, g_marketInfos[i].overlay);
				}
				
			}, 200);
		}
		
		// main함수 안에서 실행
		main();
		
	</script>
</body>
</html>
