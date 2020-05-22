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

	<!-- 장바구니 모달창 세번째^^!!! -->
	<div class="modal-cart" style="display: none;">
		<div class="modal-cart-body">
			<div class="cart-body">

			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
	//장바구니 누르면 옆에 모달레이어로 뜨기 / X버튼 누르면 닫히기
	$(".fa-shopping-cart").click(function() {
		
		$.get("${pageContext.request.contextPath}/ordered/orderedList?memberNum=${memberVO.num}",function(result){
			$(".cart-body").html(result);
		});
		
		
		$(".modal-cart").css('display', 'block');
	});

	$(".cart-body").on("click","#m_close",function() {
		$(".modal-cart").css('display', 'none');
	});

	//전체 삭제 버튼 누르면 장바구니 내용 삭제
	
	$(".cart-body").on("click",".btn-delAll",function() {
		$.get("${pageContext.request.contextPath}/ordered/cartDeleteAll?memberNum=${memberVO.num}",function(result){
			$(".cart-body").html(result);
			
		});
		
	});

	//주문하기 창 누르면 이동
</script>
</html>