<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="../resources/css/market/marketSelect.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5330df6f4ac31d266d5cced5bfc44a1e&libraries=services,clusterer,drawing"></script>
</head>
<body>
	<%@ include file="../templates/header.jsp"%>
	<div class="container">
		<div class="ml_truck">
			<img src="${pageContext.request.contextPath}/resources/img/food.jpg">
			<div class="ml_truckInfo">
				<h2>${marketVO.marketName}</h2>
				<p>${marketVO.marketIntro}</p>
				<nav></nav>
				<button>장바구니</button>
				<button>주문하기</button>
			</div>
		</div>
		<h3>메뉴 리스트</h3>
		<div class="ml_menuList">
			<ul>
				<c:forEach items="${menuList}" var="vo">
					<a href="${pageContext.request.contextPath}/menu/menuSelect?num=${vo.num}">
						<li><img
							src="${pageContext.request.contextPath}/resources/img/food.jpg">
							<strong>${vo.name}</strong> <em>${vo.detail}</em>
					</a>
				</c:forEach>
			</ul>
			<!--지도 -->
			<input type="hidden" title="address" value="${requestScope.memberVO.address}">
			<div id="map" style="width:700px;height:400px;margin: 50px auto;"></div>
		</div>
		
		
		
		
	</div>
	
	
	<%@ include file="../templates/footer.jsp"%>
</body>

<script type="text/javascript">
	var latitude;
	var longitude;

	getGeo();
	map();
	
	//지도 띄움
	function map(){
		setTimeout(function() {
			console.log("a:"+latitude);
			console.log("a:"+longitude);	

			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
					
				center: new kakao.maps.LatLng(longitude, latitude), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			var map = new kakao.maps.Map(container, options);

			
			
			var markerPosition  = new kakao.maps.LatLng(longitude, latitude); 
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			marker.setMap(map);
			
			
			
			var iwContent = '<div style="padding:5px;">${marketVO.marketName}</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent
			});
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				infowindow.open(map, marker);
			});
			kakao.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});
			
			
		},100);
	}
	

	function getGeo() {
// 		좌표 받아오기
		var geocoder = new kakao.maps.services.Geocoder();

		var callback = function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				latitude = Math.floor((result[0].x) * 1000000) / 1000000;
				longitude = Math.floor((result[0].y) * 1000000) / 1000000;
				
				console.log(latitude);
				console.log(longitude);
			}
		};
		
		//주소값 전달 받아야되고
		geocoder.addressSearch("${memberVO.address}", callback); 
	}



</script>

</html>