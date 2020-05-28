<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<!-- kakao Map API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoAppKey}&libraries=services,clusterer,drawing"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
</head>

<body>
	<%@ include file="./templates/header.jsp"%>
	<div class="contents">

		<!-- swiper 이미지 -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide" style="background-image: url('${pageContext.request.contextPath}/resources/img/home/swiper/1.jpg');"></div>
				<div class="swiper-slide" style="background-image: url('${pageContext.request.contextPath}/resources/img/home/swiper/2.png');"></div>
				<div class="swiper-slide" style="background-image: url('${pageContext.request.contextPath}/resources/img/home/swiper/3.jpg');"></div>
				<div class="swiper-slide" style="background-image: url('${pageContext.request.contextPath}/resources/img/home/swiper/4.jpg');"></div>
				<div class="swiper-slide" style="background-image: url('${pageContext.request.contextPath}/resources/img/home/swiper/5.jpg');"></div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
		</div>

		<!-- 지도 -->
		<div id="main">
			<div class="rec1">
				<h2>언제나 우리 곁으로, 푸드마켓</h2>
				<p>간편하게 주문하고, 바로 먹자</p>
			</div>
			<div class="rec1">
				<h2 style="font-size: 35px; margin-top: 25px;">936개</h2>
				<p>현재 오픈한 푸드마켓</p>
			</div>
			<div id="map_wrapper">
				
				<div id="map" style="width: 100%; height: 80%; margin-top: 50px;position:relative;overflow:hidden;">
				<div>
				</div>
					<div id="categorys_wrapper">
						<ul class="categorys" id="rec1">
							<input type="text" id="text-search" placeholder="검색어를 입력하세요">
							<input type="button" id="btn-search" value="검색">
						</ul>
						<ul class="categorys">
							<li id="all" class="category" title="0">전체</li>
							<li id="korean" class="category" title="1">한식</li>
							<li id="snack" class="category" title="2">분식</li>
							<li id="western" class="category" title="3">양식</li>
							<li id="japanese" class="category" title="4">일식</li>
							<li id="chinese" class="category" title="5">중식</li>
						</ul>
						<ul class="categorys">
							<div id="shiftMap" style="z-index: 100"></div>
							<div id="searchingNon" style="z-index: 100"></div>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 스팟 신청하기 -->
		<div class="main_spot">
			<div>
				<header class="ms_header">
					<h2>주변에 있는 푸드마켓이 궁금하신가요?</h2>
					<p>지도를 통해 마켓을 찾아보세요! 친구들과 함께라면 찾는 재미가 두배!</p>
				</header>
				<!-- <nav class="ms_nav">
					<button>신청하기</button>
				</nav> -->
			</div>
		</div>

		<!-- 배달 -->
		<div class="main_deliver">
			<div class="rec1">
				<h2>내 근처에, <b style="color: #27b06e; font-size: 24px;">푸드마켓!</b></h2>
				<p>나에게 맞는 스마트한 방법을 선택하세요</p>
			</div>
			<div class="md_way">
				<section class="md_section">
					<a class="md_sa" href="#" style="background-image: url('${pageContext.request.contextPath}/resources/img/home/deliver/img-spot-delivery.png');">
						<em>푸마스팟</em>
						<h2><b>점심시간에</b><br>바로 우리회사<br>근처에서!</h2>
						<p>멀리나갈 필요없는 푸드마켓</p>
					</a>
				</section>
				<section class="md_section" style="margin-left: 20px;">
					<a class="md_sa" href="#" style="background-image: url('${pageContext.request.contextPath}/resources/img/home/deliver/img-gs25-delivery.png');">
						<em>편의점</em>
						<h2><b>편의점 만큼</b><br>수많은 마켓</h2>
						<p>어디에나 위치한 푸드마켓</p>
					</a>
				</section>
				<section class="md_section" style="margin-left: 20px;">
					<a class="md_sa" href="#" style="background-image: url('${pageContext.request.contextPath}/resources/img/home/deliver/img-midnight-delivery.png');">
						<em>심야운영</em>
						<h2><b>야식 땡기는</b><br>한밤 중 에도</h2>
						<p>저녁까지 운영하는 푸드마켓</p>
					</a>
				</section>
				<section class="md_section" style="margin-left: 20px;">
					<a class="md_sa" href="#" style="background-image: url('${pageContext.request.contextPath}/resources/img/home/deliver/img-quick-delivery.png');">
						<em>바로받기</em>
						<h2><b>쉴새없이 바쁘다면</b><br>빠르게 픽업</h2>
						<p>주문 즉시 준비되는 푸드마켓</p>
					</a>
				</section>
			</div>
		</div>

		<!-- 단체/케이터링 -->
		<div class="home_question">
			<div class="home_question_wrap">
				<pre class="home_q_pre">푸드마켓은<br>"푸드트럭은 행사장에서나" 라는 편견을 깨고<br>다양한 먹거리를 우리주변에 두고자합니다.</pre>
				<ul class="home_q_ul">
					<li class="home_q_li">이메일 : help@foodmarket.me</li>
					<li class="home_q_li">카카오ID : @프레시코드-foodmarket</li>
					<li class="home_q_li">단체주문 문의 : order@foodmarket.me</li>
				</ul>
				<nav class="home_q_nav">
					<button class="home_q_btn">단체/행사 문의</button>
				</nav>
			</div>
		</div>

		<!-- 인스타그램-->
		<div class="main_insata">
			<div class="mi_div1">
				<header class="mi_header">
					<em>Instagram</em>
					<h2>@food_market</h2>
					<p>푸드마켓 인스타그램에서<br>최신 소식과 이벤트를 확인해보세요</p>
				</header>
				<div class="mi_div2">
					<ul class="mi_ul">
						<li>
							<a href="" class="mi_a">
								<img alt="" src="${pageContext.request.contextPath}/resources/img/home/insta/insta1.jpg">
							</a>
						</li>
						<li>
							<a href="" class="mi_a">
								<img alt="" src="${pageContext.request.contextPath}/resources/img/home/insta/insta2.jpg">
							</a>
						</li>
						<li>
							<a href="" class="mi_a">
								<img alt="" src="${pageContext.request.contextPath}/resources/img/home/insta/insta3.jpg">
							</a>
						</li>
						<li>
							<a href="" class="mi_a">
								<img alt="" src="${pageContext.request.contextPath}/resources/img/home/insta/insta4.jpg">
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="./templates/footer.jsp"%>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
	<script type="text/javascript">
	
	/* 클릭시 변경 */
	$(".category").click(function() {
		var li = $('.category');
		
		$(this).css('background-color','#27b06e');
		$(this).css('color','#fff');
		li.not($(this)).css('background-color','white');
		li.not($(this)).css('color','#3d3d3d');
	});
	
	
	new Swiper('.swiper-container', {

		slidesPerView : 1, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 5, // 슬라이드간 간격
		slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : false,

		loop : true, // 무한 반복

		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			prevEl : '.swiper-btn-next', // 다음 버튼 클래스명
			nextEl : '.swiper-btn-prev', // 이번 버튼 클래스명
		},
		autoplay: { //오토플레이 설정
		    delay: 2000, //딜레이 시간 설정
			speed : 2000 // 슬라이드 속도 2초
	     }
	});

	</script>

	<script>
		//=======================================
		// script 전역변수
		//=======================================
		var latitude;				// 위도 (30~)
		var longitude;				// 경도 (127~)
		var map;
		var g_marketInfos = [];
		var shift = false;
		var CATEGORY_DEFAULT = "0";
		var categorySelected = CATEGORY_DEFAULT;
		
		//========================================
		//main marker 좌표값 받아오기
		//========================================
		function getUserGeo() {

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
				//draggable: false,									 // 지도 생성시, 휠로 인한 줌 인아웃 막기
				level : 4											 // 줌인정도
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
		// 마켓의 Map 데이터 가져오기
		//===============================
		function getMarketMaps(resultVOs) {
			
			var marketMaps = [];
			
			if(typeof resultVOs == "undefined" || resultVOs == null) {
				
				<c:forEach items="${mapList}" var="vo">
				
					var marketMap = {
							num: `${vo.marketVO.num}`,
							userNum: `${vo.marketVO.userNum}`,
							categoryNum: `${vo.marketVO.categoryNum}`,
							marketName: `${vo.marketVO.marketName}`,
							openTime: `${vo.marketVO.openTime}`,
							closeTime: `${vo.marketVO.closeTime}`,
							isOpen: ${vo.marketVO.isOpen},
							canOrder: ${vo.marketVO.canOrder},
							marketIntro: `${vo.marketVO.marketIntro}`,
							thumbImg: `${vo.marketVO.thumbImg}`,
							rating: `${vo.marketVO.reviewVO.rating}`,
							latitude: ${vo.latitude},
							longitude: ${vo.longitude}
					};
					
					marketMap.latitude = Math.ceil(marketMap.latitude*1000000)/1000000;
					marketMap.longitude = Math.ceil(marketMap.longitude*1000000)/1000000;
					marketMaps.push(marketMap);
					
				</c:forEach>
			} else {
			
				for(var i=0; i<resultVOs.length; i++) {
					
					var marketMap = {
							num: resultVOs[i].marketVO.num,
							userNum: resultVOs[i].marketVO.userNum,
							categoryNum: resultVOs[i].marketVO.categoryNum,
							marketName: resultVOs[i].marketVO.marketName,
							openTime: resultVOs[i].marketVO.openTime,
							closeTime: resultVOs[i].marketVO.closeTime,
							isOpen: resultVOs[i].marketVO.isOpen,
							canOrder: resultVOs[i].marketVO.canOrder,
							marketIntro: resultVOs[i].marketVO.marketIntro,
							thumbImg: resultVOs[i].marketVO.thumbImg,
							rating: resultVOs[i].marketVO.reviewVO.rating,
							latitude: resultVOs[i].latitude,
							longitude: resultVOs[i].longitude
					};
					
					marketMap.latitude = Math.ceil(marketMap.latitude*1000000)/1000000;
					marketMap.longitude = Math.ceil(marketMap.longitude*1000000)/1000000;
					marketMaps.push(marketMap);
				}
			}
			
			return marketMaps;
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
			var imageSrc = "${pageContext.request.contextPath}/resources/img/home/marker.png"; 
			    
			for (var i=0; i<positions.length; i++) {
			    
			    var imageSize = new kakao.maps.Size(50, 50); // 마커 이미지의 이미지 크기 입니다 
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); // 마커 이미지를 생성합니다    
			    
			 	// 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: null, // 지도 지정안함
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
	            '        <div class="title click" id="'+ markets[i].userNum +'"'+'>' + markets[i].marketName + 
	            '            <div class="close click" id="'+ markets[i].userNum +'"'+' onclick="overlayCloseHandler(this.id)" title="닫기"></div>' + 
	            '        <div class="body">' + 
	            '            <div class="img" id="'+ markets[i].num +'"'+' onclick="marketSelectHandler(this.id)" title="마켓 이동">' +
	            '                <img src="${pageContext.request.contextPath}/resources/upload/market/'+ markets[i].thumbImg +'" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="desc">' + 
	            '                <div class="market">' + markets[i].marketIntro +
	            '				 </div>' + 
	            '                <div class="time">(open ~ close) '+ markets[i].openTime + ' ~ ' + markets[i].closeTime + '</div>' + 
	            '                <div class="time">별점 : '+ markets[i].rating+'점</div>' +
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
		function getMarketInfos(resultVOs) {
			
			// 지역변수
			var markets = [];
			var geos = [];
			var marketMaps = [];
			var positions = [];
			var markers = [];
			var overlays = [];
			g_marketInfos = [];
			
			// 마켓 데이터 가져오기
			marketMaps = getMarketMaps(resultVOs);
			
			// make markets, geos
			for(var i=0; i<marketMaps.length; i++) {
				
				var market = {
					num: marketMaps[i].num,
					userNum: marketMaps[i].userNum,
					categoryNum: marketMaps[i].categoryNum,
					marketName: marketMaps[i].marketName,
					openTime: marketMaps[i].openTime,
					closeTime: marketMaps[i].closeTime,
					isOpen: marketMaps[i].isOpen,
					canOrder: marketMaps[i].canOrder,
					marketIntro: marketMaps[i].marketIntro,
					thumbImg: marketMaps[i].thumbImg,
					rating: marketMaps[i].rating
				}
				
				markets.push(market);
			
				var geo = {
					latitude: marketMaps[i].latitude,
					longitude: marketMaps[i].longitude
				}
				
				geos.push(geo);
			}
			
			// Category에 따른 마켓, Geo 선별작업
			var index=0;	
			while(true) {
			
				if(categorySelected === CATEGORY_DEFAULT)
					break;	// 전체보기라면 선별 종료
				
				if(markets.length === index)
					break;	// 선별 완료로 인한 종료 
				
				if(markets[index].categoryNum != categorySelected) {
					markets.splice(index, 1);
					geos.splice(index, 1);
					index=0;
					continue;	// List가 자동 정렬되므로 처음부터 재탐색
				}
				index++;
			}
			// 선별된 market, Geo를 이용하여 position, marker, overlay값 갱신
			positions = getPositions(markets, geos);
			markers = getMarkers(positions);
			overlays = getOverlays(markets, markers);
			
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
		// 오버레이 관련 이벤트 등록
		//==========================
		function overlayEventHandler(marker, overlay) {
			
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
		// 오버레이 close Handler
		//====================
		function overlayCloseHandler(clickedId) {
			
			for(var i=0; i<g_marketInfos.length; i++) {
				
				var userNum = g_marketInfos[i].market.userNum;
				
				// 문자열인 경우도, 숫자인 경우도 있으므로, ==
				if(clickedId == userNum) {
					var overlay = g_marketInfos[i].overlay;
					overlay.setMap(null);
					
					return;
				}
			}
		}
		
		//====================
		// 오버레이 지우기
		//====================
		function hiddenOverlays() {
			for(var i=0; i<g_marketInfos.length; i++) {
				g_marketInfos[i].overlay.setMap(null);
			}
		}
		
		//====================
		// 마켓 select Handler
		//====================
		function marketSelectHandler(clickedId) {
		
			var ref = '/project/market/marketSelect?userNum='+clickedId;
			location.href = ref;
		}
		
		//====================
		// window keydown/up event
		//====================
		window.addEventListener("keydown", function(event) {
			
			if(shift === true)
				return;
			
			if(event.shiftKey) {
				shift = true;
				setZoomable(shift);
			}
		});
		
		window.addEventListener("keyup", function(event) {
			
			if(shift === true) {
				shift = false;
				setZoomable(shift);
			}
		});
		
		//====================
		// 버튼 클릭에 따른 확대/축소 기능 on/off
		//====================
		function setZoomable(zoomable) {
		    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
		    map.setZoomable(zoomable);    
		}
		
		//====================
		// 맵 위에 마우스가 있을 때, 휠 업다운에 따른 이벤트 (firefox는 적용 안됨)
		//====================
		function setMapWheelEvent() {
			
			var mapDiv = document.getElementById("map");
			mapDiv.addEventListener("mousewheel", function() {
				
				if(shift === true)
					return;
				
				var shiftMapDiv = document.getElementById("shiftMap");
				
				shiftMap.style.display = "block";
				shiftMapDiv.innerHTML = 
					'<center style= "line-height: 775px; color: #ffffff; margin: 0px auto; text-align: center;">지도 확대/축소를 원한다면 shift을 누르고 스크롤 하세요.</center>';		
				setTimeout(function() {
					shiftMapDiv.innerHTML = '';
					shiftMap.style.display = "none";
				}, 1500);
			});
		}
		
		//====================
		// 마커 보이기
		//====================
		function showMarkers() {
			for(var i=0; i<g_marketInfos.length; i++) {
				
				g_marketInfos[i].marker.setMap(map);
			}
		}
		
		//====================
		// 마커 감추기
		//====================
		function hiddenMarkers() {
			for(var i=0; i<g_marketInfos.length; i++) {
				g_marketInfos[i].marker.setMap(null);
			}
		}
		
		//====================
		// 결과 없을시 없다고 출력
		//====================
		function searchingNon(g_marketInfos) {
			
			if(g_marketInfos.length !== 0) 
				return false;
			
			var shiftMapDiv = document.getElementById("shiftMap");
			
			shiftMap.style.display = "block";
			shiftMapDiv.innerHTML = '<center style= "line-height: 775px; color: #ffffff; margin: 0px auto; text-align: center;"> 해당 푸드트럭이 존재하지 않습니다!</center>';		
			setTimeout(function() {
				shiftMapDiv.innerHTML = '';
				shiftMap.style.display = "none";
			}, 1000);
         		
         	return true;
		}
		
		//====================
		// 공통 부분
		//====================
		function getMarketMarker(resultVOs, categoryVal) {
			
			// 현재 Category value
			categorySelected = categoryVal;
			
			// 마커 지우기, 오버레이 초기화
			if(g_marketInfos.length !== 0) {
				hiddenMarkers();
				hiddenOverlays();
			}
			
			// 필요한 데이터 생성
			getMarketInfos(resultVOs);
			
			// 결과가 없을 때, 마커 표시 및 오버레이 이벤트 등록 필요 X
         	if(searchingNon(g_marketInfos))
         		return;
			
			// 마커 표시
			showMarkers();
			
			// 오버레이 이벤트 등록
			for(var i=0; i<g_marketInfos.length; i++) {
				overlayEventHandler(g_marketInfos[i].marker, g_marketInfos[i].overlay);
			}
		}
		//====================
		// 메인함수
		//====================
		function main() {
			
			// client Geo date
			getUserGeo();
			
			setTimeout(function() {

				getMap();
				getUserMarker();
				
				// 마켓 마커 생성 및 마커,오버레이 그리기
				getMarketMarker(null,CATEGORY_DEFAULT);
				
				// 줌인아웃 관련 이벤트
				setZoomable(false);
				setMapWheelEvent();
				
				//=====================================================
				// 카테고리별 보기  (클릭시, 카테고리에 따라 마켓 종류 선별하여 보여주기)
				var category = document.getElementsByClassName("category");
				for (let item of category) {
					   
					item.addEventListener("click", function() {
	
						// 마켓 마커 생성 및 마커,오버레이 그리기
						getMarketMarker(null, item.title);
					});
				}
				//=====================================================
				
				//=====================================================
				// 검색별 보기 (클릭시, 검색어가 들어간 마켓명 선별하여 보여주기)
				$("#btn-search").click(function() {

			    	var str = $("#text-search").val();
			    	
			    	if(str == "" || str == null || str.isEmpty()) {
			    		alert("검색어를 입력해주세요!");
			    		return;
			    	}
			        	
			    	$.get("./search?str="+str,function(result){
			        
						getMarketMarker(result,CATEGORY_DEFAULT);
			         });

					$(".category").css('background-color','white');
					$(".category").css('color','#3d3d3d');
			    });
				
				// 검색별 보기 (키보드 enter시, 검색어가 들어간 마켓명 선별하여 보여주기)
				$("#text-search").keyup(function(key) {

					if (key.keyCode != 13) {
						
						return;
					}
					
			    	var str = $("#text-search").val();
			    	
			    	if(str.length == 0) {
			    		alert("검색어를 입력해주세요!");
			    		return;
			    	}
			        	
			    	$.get("./search?str="+str,function(result){
			        
						getMarketMarker(result,CATEGORY_DEFAULT);
			         });

					$(".category").css('background-color','white');
					$(".category").css('color','#3d3d3d');
			    });
			}, 200);
		}
		
		// main함수 안에서 실행
		main();

	</script>
</body>
</html>