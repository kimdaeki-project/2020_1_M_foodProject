<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 상세보기</title>
<link rel="stylesheet" href="../resources/css/market/marketSelect.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5330df6f4ac31d266d5cced5bfc44a1e&libraries=services,clusterer,drawing"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			</div>
		</div>


		<div class="menu-tab">
			<ol>
				<li class="menu on">메뉴</li>
				<li class="map">지도</li>
				<li class="review">후기</li>
			</ol>
		</div>


		<!--지도 -->
		<input type="hidden" title="address"
			value="${requestScope.memberVO.address}">

		<div class="ml_menuList">
			<!-- Ajax 내용 출력 위치 -->
			<ul>
				<c:forEach items="${menuList}" var="vo">
					<a href="${pageContext.request.contextPath}/menu/menuSelect?num=${vo.num}">
						<li><img src="${pageContext.request.contextPath}/resources/img/food.jpg">
							<strong>${vo.name}</strong> <em>${vo.detail}</em>
						</li>
					</a>
				</c:forEach>
			</ul>
		</div>

		<div id="map" style="width: 800px; height: 400px; margin: 50px auto;"></div>
		<div style="margin: 0 auto; text-align: center;">
			<input type="button" value="길찾기" id="btn-map">
		</div>




<!-- 리뷰 배너-->
		<div id="tab_menu_review" class="menu__tab-review">
			<div class="menu-review">
				<div class="view-review-comment">
					<div>
						<img src="../resources/img/marketSelect/review-icon.png" style="width: 30px; display: inline-block; margin-top: -38px; margin-right: 20px;">
					</div>
					<div>
						지금, 후기를 작성하고 <span style="font-weight: bold;">300원 포인트</span>를 받으세요!
					</div>
					<div class="view-review-comment-btn-wrap">
						<a href="${pageContext.request.contextPath}/review/reviewInsert">
						<button type="button" class="button button--inline button--side-padding button--size-small button--outline" style="color: white; border: 1px solid white; font-size: 14px; background-color: inherit;">
							<span class="button__wrap">후기 쓰러가기</span>
						</button>
						</a>
					</div>
				</div>

				<!-- 리뷰 총 평점 -->
				<section class="menu-review__rating">
					<div class="wrap">
						<h3 class="wrap_h3">평점</h3>
						<div class="row--v-center body">
							<div class="col">
								<dl class="row--v-center row--h-between">
									<dt>사용자 총 평점</dt>
									<dd>${marketRate}</dd>
							
								</dl>
							</div>
							<div class="col">
								<dl class="row--v-center row--h-between">
									<dt>전체 리뷰</dt>
									<dd>${totalReview}</dd>
								</dl>
							</div>
						</div>
					</div>
				</section>

				<!-- 리뷰 총 등록된 이미지들 -->
				<section class="menu-review__album">
					<h3>사진 모아보기<small>7</small></h3>
					<div class="images">
						<div>
							<div id="carousel_pfe9ns59uir" class="owl-carousel owl-theme owl-loaded">
								<div class="owl-stage-outer">
									<div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1535px;">
										<!-- 반복문 돌려서 이미지 첨삭 -->
										<c:forEach var="reviewVO" items="${reviewList}">
											<div class="owl-item active" style="width: 203.2px; margin-right: 16px;">
												<div class="images__image">
													<a href="#"><i style="background-image: url(&quot;../resources/upload/review/${reviewVO.fileName}&quot;);">image</i>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="owl-nav">
									<div class="owl-prev">next</div>
									<div class="owl-next">prev</div>
								</div>
							</div>
						</div>
					</div>
				</section>

				<!-- 등록된 리뷰들 -->
				<section class="menu-review__index">
					<h3>
						등록된 리뷰 <small>${totalReview}</small>
					</h3>
					<ul>
						<c:forEach var="reviewVO" items="${reviewList}">
							<c:if test="${reviewVO.step eq 0}">
								<li>
									<div class="review-item">
										<dl class="row--v-center review-item__head">
											<dt class="col">
												<strong>${reviewVO.memberVO.nickName}</strong>
												<em>(${reviewVO.memberVO.email})</em>
											</dt>
											<dd data-v-7fa225ca="">1번 구매</dd>
										</dl>
										<div class="review-item__body">
											<div>
												<div class="review-item__score vue-star-rating" style="display: grid">
													<div class="vue-star-rating">
														<!-- 별점 5개 -->
														<c:forEach begin="1" end="${reviewVO.rating}">
															<span class="vue-star-rating-star" style="margin-right: 0px;">
																★
															</span>
														</c:forEach>
														<span data-v-34cbeed1="" class="vue-star-rating-rating-text state-rating-label"> ${reviewVO.rating}</span>
													</div>
													<p class="review-item__comment">${reviewVO.contents}</p>
												</div>
											</div>
											<figure class="review-item__photos">
											<!-- 회원이 이미지를 등록했을 때만 이미지 html문을 추가해 출력해준다 -->
												<p>
													<a href="javascript:">
														<i style="background-image: url(&quot;../resources/upload/review/${reviewVO.fileName}&quot;);">photo</i>
													</a>
												</p>
											</figure>
										</div>
										<p class="review-item__date">작성일 <em>${reviewVO.regDate}</em></p>
									</div>
								</li>
							</c:if>


							<!-- 판매자의 덧글 존재시 출력 -->	
							<c:if test="${reviewVO.step eq 1}">
								<div class="review-item__reply" style="margin-bottom: 20px;">
									<p style="margin: 0px; color: rgb(31, 182, 109); font-size: 15px;">${reviewVO.memberVO.nickName}</p>
									<p class="review-item__comment">${reviewVO.contents}</p>
							        <p class="review-item__date">작성일 
							        	<em>${reviewVO.regDate}</em>
							        </p>
								</div>
							</c:if>
						
						</c:forEach>
						
					</ul>
					
<!-- 페이지 버튼 구현 -->
					<div class="nav-paginate-wrap__desktop">
						<nav class="nav-paginate">
							<c:if test="${pager.curBlock gt 1}">
								<a  href="./marketSelect?curPage=${pager.startNum-1}&userNum=${marketVO.userNum}" class="nav-paginate__dir nav-paginate-dir-prev">
									<i></i>
								</a>
							</c:if>
						
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<a href="./marketSelect?curPage=${i}&userNum=${marketVO.userNum}">${i}</a>
							</c:forEach>
							
							<c:if test="${pager.curBlock lt pager.totalBlock}">
								<a href="./marketSelect?curPage=${pager.lastNum+1}&userNum=${marketVO.userNum}" class="nav-paginate__dir nav-paginate-dir-next">
									<i></i>
								</a>
							</c:if>
							
						</nav>
					</div>
					
				</section>
			</div>
		</div>





	</div>
	<%@ include file="../templates/footer.jsp"%>
</body>

<script type="text/javascript">
	var latitude;
	var longitude;

	getGeo();
	map();

	$("#btn-map").click(
			function() {
				window.open("https://map.kakao.com/link/to/" + '${marketVO.marketName}' + "," + longitude + ","+ latitude);
			});

	//지도 띄움
	function map() {
		setTimeout(
				function() {
					console.log("a:" + latitude);
					console.log("a:" + longitude);

					var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션

						center : new kakao.maps.LatLng(longitude, latitude), //지도의 중심좌표.
						draggable: false,
						level : 3
						
					//지도의 레벨(확대, 축소 정도)
					};
					var map = new kakao.maps.Map(container, options);

					var markerPosition = new kakao.maps.LatLng(longitude, latitude);
					var marker = new kakao.maps.Marker({
						position : markerPosition
					});
					marker.setMap(map);

					
					var iwContent = '<div style="padding:5px;">${marketVO.marketName}</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					var infowindow = new kakao.maps.InfoWindow({
						content : iwContent
					});
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								infowindow.open(map, marker);
							});
					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

				}, 1000);
	}

	function getGeo() {
		//좌표 받아오기
		var geocoder = new kakao.maps.services.Geocoder();

		var callback = function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				latitude = Math.floor((result[0].x) * 1000000) / 1000000;
				longitude = Math.floor((result[0].y) * 1000000) / 1000000;

				console.log(latitude);
				console.log(longitude);
				latitude = ${memberVO.longitude};
				longitude = ${memberVO.latitude};
				
				console.log(latitude);
				console.log(longitude);

			}
		};
		
		//주소값 전달 받아야되고
		geocoder.addressSearch("${memberVO.address}", callback);
	}

	//menu-tab누를시 적용 클래스 변경
	$(".menu-tab ol li").click(function() {
		$(".menu-tab ol li").removeClass("on");
		$(this).addClass("on");
	});
</script>

</html>