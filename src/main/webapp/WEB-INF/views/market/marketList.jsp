<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/market/marketList.css">
</head>
<%@ include file="../templates/header.jsp"%>

<body>
	<div class="ml_container">
		<section class="ml_container2">
			<h3>트럭 리스트</h3>
			<ul>
				<c:forEach items="${marketList}" var="vo">
					<li><a
						href="${pageContext.request.contextPath}/market/marketSelect?num=${vo.num}">
							<img alt=""
							src="${pageContext.request.contextPath}/resources/img/food.jpg">
							<strong>${vo.marketName}</strong>
							<span>${vo.marketIntro}</span>
							<em>${vo.canOrder}</em>
							<span>${vo.isOpen}</span>
					</a></li>
				</c:forEach>
			</ul>
		</section>
	</div>
</body>

<%@ include file="../templates/footer.jsp"%>



</html>