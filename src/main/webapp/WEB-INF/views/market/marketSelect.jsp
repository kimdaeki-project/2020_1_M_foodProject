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
			</div>
		</div>
		<c:forEach items="${menuList}" var="vo">
			<p>이름: ${vo.name}</p>
			<p>설명: ${vo.detail}</p>
		</c:forEach>
	</div>
	<%@ include file="../templates/footer.jsp"%>
</body>

</html>