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
				<li><a href="${pageContext.request.contextPath}/market/marketList?address=${sessionScope.memberVO.address}">메뉴보기</a></li>
				<li><a href="#936">트럭스팟</a></li>
				<li><a href="#">이용안내</a></li>
				<li><a href="#">이벤트</a></li>
			</ul>
		</nav>
		<c:if test="${empty sessionScope.memberVO}">
			<button type="button" class="h_login"
				onclick="location.href='${pageContext.request.contextPath}/member/memberLogin'">로그인</button>
			<a><img src="${pageContext.request.contextPath}/resources/img/header/cart.png" class="fa-shopping-cart"></a>
		</c:if>
		<c:if test="${not empty sessionScope.memberVO}">
			<button type="button" class="h_name"
				onclick="location.href='${pageContext.request.contextPath}/member/memberPage'">${sessionScope.memberVO.name}</button>
			<a><img	src="${pageContext.request.contextPath}/resources/img/header/cart.png" class="fa-shopping-cart"></a>
		</c:if>
	</div>

	<!-- 장바구니 모달창 세번째^^!!! -->
	<div class="modal-cart" style="display: none;">
		<div class="modal-cart-body">
			<div class="cart-body">
				<article class="cart">
					<header class="cart-header">
						<nav class="ch-nav" id="m_close">
							<button>✖</button>
						</nav>
						<h2>장바구니</h2>
					</header>
					<div class="cart-div1">
						<span>프코스팟배송 | 무료배송</span>
					</div>
					<div class="cart-div2">
						<div class="cart-selectAll">
							<label></label>
							<nav>
								<button class="btn-delAll">
									<span>전체 삭제</span>
								</button>
							</nav>
						</div>
						<hr>
						<div class="cart-index">
							
						</div>
					</div>
					<nav class="cart-nav">
						<div class="cart-result">
							<hr>
							<div class="cart-result-body">
								<dl class="cart-dl">
									<dt>갯수</dt>
									<dd>0개</dd>
								</dl>
								<dl class="cart-dl">
									<dt>가격</dt>
									<dd>0원</dd>
								</dl>
							</div>
							<div class="nav-button">
								<button class="nav-more">상품 더 담기</button>
								<button class="nav-order">주문하기</button>
							</div>
						</div>
					</nav>
				</article>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
	//장바구니 누르면 옆에 모달레이어로 뜨기 / X버튼 누르면 닫히기
	$(".fa-shopping-cart").click(function() {
		$.get("${pageContext.request.contextPath}/ordered/orderedList?memberNum=${sessionScope.memberVO.num}&isCart=1", function(result){
			$(".cart-body").html(result);
		});
		
		$(".modal-cart").css('display', 'block');
	});

	//장바구니 창 숨기기
	$(".cart-body").on("click","#m_close",function() {
		$(".modal-cart").css('display', 'none');
	});

	//전체 삭제 버튼 누르면 장바구니 내용 삭제
	$(".cart-body").on("click",".btn-delAll",function() {
		$.get("${pageContext.request.contextPath}/ordered/cartDeleteAll?memberNum=${memberVO.num}&isCart=1", function(result){
			$(".cart-body").html(result);
		});
	});

	//상품 더 담기 누르면 메뉴로 이동	
	$(".cart-body").on("click",".nav-more", function() {
		location.href = '${pageContext.request.contextPath}/market/marketList';
	});

	//주문하기 창 누르면 이동
	$(".cart-body").on("click",".nav-order",function() {
		if($('.nav-order').data("size") == 0) {
			alert("장바구니가 비었어요!");
			return;
		}
		location.href="${pageContext.request.contextPath}/ordered/orderPage?memberNum=${sessionScope.memberVO.num}&isCart=1";
	});

</script>
</html>