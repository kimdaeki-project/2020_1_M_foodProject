<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/templates/header.css?after">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
</head>
<body>
	<div class="header">
		<a href="${pageContext.request.contextPath}" class="header_a"> <img
			src="${pageContext.request.contextPath}/resources/img/main-logo.png">
		</a>
		<nav class="h_nav">
			<ul class="h_nav_ul">
				<li><a
					href="${pageContext.request.contextPath}/market/marketList">메뉴보기</a></li>
				<li><a href="#">트럭스팟</a></li>
				<li><a href="#">이용안내</a></li>
				<li><a href="#">이벤트</a></li>
			</ul>
		</nav>
		<c:if test="${empty sessionScope.memberVO}">
			<button type="button" class="h_login"
				onclick="location.href='${pageContext.request.contextPath}/member/memberLogin'">로그인</button>
			<a><img
				src="${pageContext.request.contextPath}/resources/img/header/cart.png"
				class="fa-shopping-cart"></a>
		</c:if>
		<c:if test="${not empty sessionScope.memberVO}">
			<button type="button" class="h_name"
				onclick="location.href='${pageContext.request.contextPath}/member/memberPage'">${memberVO.name}</button>
			<a><img
				src="${pageContext.request.contextPath}/resources/img/header/cart.png"
				class="fa-shopping-cart"></a>
		</c:if>
	</div>

	<!-- 장바구니 모달창 -->
	<div class="modal_cart">
		<!-- 장바구니 영역을 감싸는 div -->
		<div style="width: 450px; position: sticky; left: 10000;">
			<!-- 닫는 버튼 / 장바구니 -->
			<div class="cart1">
				<span id="m_close">✖</span>
				<h2>장바구니</h2>
			</div>
			<!-- 전체삭제 -->
			<div class="cart2">
				<span> 전체삭제 </span>
			</div>
			<!-- 장바구니 아이템 영역 -->
			<div class="cart3">
				<ul>
					<li class="cart3_li">
						<div class="cart_li1">
							<img alt="사진" src="food.jpg" class="cart_pic">
							<div class="cart_li1-1">
								<strong>프레시코드 - 프레시코드 샐러드</strong> <span>1. 샐러리 빼기 / 2.
									드레싱 없이</span>
							</div>
							<div class="cart_li1-2">
								<span id="cart_li1Del">✖</span>
							</div>
						</div>
						<div class="cart_li2">
							<em>8000 원</em>
						</div>
					</li>
				</ul>
			</div>
			<div class="cart4">
				<!-- 계산서 영역 -->
				<div class="cart4-1">
					<dl>
						<dt class="cart4-1dt">총 갯수
						<dd class="cart4-1dd">0개</dd>
						</dt>
						<dt>총 가격
						<dd>0원</dd>
						</dt>
					</dl>
				</div>
				<!-- 결제 버튼 영역 -->
				<div class="cart4-2">결제하기</div>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
	//장바구니 누르면 옆에 모달레이어로 뜨기 / X버튼 누르면 닫히기
	$(".fa-shopping-cart").click(function() {
		$(".modal_cart").css('display', 'block');
	});

	$("#m_close").click(function() {
		$(".modal_cart").css('display', 'none');
	});

	//전체 삭제 버튼 누르면 장바구니 내용 삭제

	//주문하기 창 누르면 이동
</script>
</html>