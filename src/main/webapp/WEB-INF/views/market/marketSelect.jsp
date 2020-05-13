<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="../resources/css/market/marketSelect.css">
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
		</div>
		<div class="ml_box4">
            <a href="#ml_truckInfo">트럭정보</a>
            <a href="#ml_buyInfo">구매정보</a>
            <a href="#ml_review">리뷰</a>
        </div>
        <div name="ml_truckInfo">트럭정보div</div>
        <div name="ml_buyInfo">구매정보div</div>
        <div name="ml_review">
            <div><a id="ml_truckInfo"></a>평점div</div>
            <div><a id="ml_buyInfo"></a>후기사진모아보기div</div>
            <div>
                <a id="ml_review"></a>
                <ul>
                	<c:forEach items="${reviewList}" var="rv">
                <span>왜 안떠ㅡㅡ</span>
                		<a>
                			<li>
                				<strong></strong>
                				<em></em>
                				<span>리뷰: ${rv.rating}</span>
                			</li>
                		</a>
                	</c:forEach>
                </ul>
            </div>
        </div>
	</div>
	<%@ include file="../templates/footer.jsp"%>
</body>

</html>