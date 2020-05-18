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
	
	 <style>
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .market {overflow: hidden;text-overflow: market;white-space: nowrap;}
	    .desc .time {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info .img:hover {cursor: pointer;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
	</style>
	
</head>
<body>
<%@ include file="./templates/header.jsp"%>

<div id="main">
	<div id="map" style="width:1200px;height:600px;"></div>
</div>

<%-- <div>
	<c:forEach items="${marketList}" var="vo">
		<h6>num : ${vo.num}</h6>
		<h6>userNum : ${vo.userNum}</h6>
		<h6>categoryNum : ${vo.categoryNum}</h6>
		<h6>marketName : ${vo.marketName}</h6>
		<h6>openTime : ${vo.openTime}</h6>
		<h6>closeTime : ${vo.closeTime}</h6>
		<h6>isOpen : ${vo.isOpen}</h6>
		<h6>canOrder : ${vo.canOrder}</h6>
		<h6>marketIntro : ${vo.marketIntro}</h6>
		<h6>thumbImg : ${vo.thumbImg}</h6>
		<h6>rating : ${vo.reviewVO.rating}</h6>
	</c:forEach>
</div> --%>

<%@ include file="./templates/footer.jsp"%>

	<script>
		//=======================================
		// script 전역변수
		//=======================================
		var latitude;				// 위도 (30~)
		var longitude;				// 경도 (127~)
		var map;
		var g_marketInfos = [];
		
		//========================================
		//main marker 좌표값 받아오기
		//========================================
		function getUserGeo() {

			//console.log(`${address}`);
			
			var geocoder = new kakao.maps.services.Geocoder();

			var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					longitude = Math.floor((result[0].x) * 1000000) / 1000000;
					latitude = Math.floor((result[0].y) * 1000000) / 1000000;
					
				}
			};

			geocoder.addressSearch(`${address}`, callback);
		}

		//================================
		// 지도 띄우기
		//================================
		function getMap() {
			
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(latitude, longitude), // 지도 중심좌표 설정
				level : 5											 // 줌인정도
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
						num: `${vo.num}`,
						userNum: `${vo.userNum}`,
						categoryNum: `${vo.categoryNum}`,
						marketName: `${vo.marketName}`,
						openTime: `${vo.openTime}`,
						closeTime: `${vo.closeTime}`,
						isOpen: ${vo.isOpen},
						canOrder: ${vo.canOrder},
						marketIntro: `${vo.marketIntro}`,
						thumbImg: `${vo.thumbImg}`,
						rating: `${vo.reviewVO.rating}`
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
					latlng: new kakao.maps.LatLng(geos[i].latitude, geos[i].longitude)
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
	            '            <div class="close" id="'+ markets[i].userNum +'"'+' onclick="overlayCloseHandler(this.id)" title="닫기"></div>' + 
	            '        <div class="body">' + 
	            '            <div class="img" id="'+ markets[i].userNum +'"'+' onclick="marketSelectHandler(this.id)" title="마켓 이동">' +
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
		function getMarketInfos(markets, geos, positions, markers, overlays) {
			
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
			
			console.log(g_marketInfos);
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
				
				var userNum = g_marketInfos[i].market.userNum;
				if(clickedId === userNum) {
					
					var overlay = g_marketInfos[i].overlay;
					overlay.setMap(null);
					
					return;
				}
			}
		}
		
		//====================
		// 메인함수
		//====================
		function main() {
			
			getUserGeo();
			
			setTimeout(function() {

				getMap();
				getUserMarker();
				var markets = getMarkets();
				var geos = getGeos();
				var positions = getPositions(markets, geos);
				var markers = getMarkers(positions);
				var overlays = getOverlays(markets, markers);
				getMarketInfos(markets, geos, positions, markers, overlays);
				
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
