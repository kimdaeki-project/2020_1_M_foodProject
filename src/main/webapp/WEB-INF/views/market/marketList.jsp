<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/market/marketList.css">
</head>
<%@ include file="../templates/header.jsp"%>

<body>
	<div class="ml_container">
		<section class="ml_container2">
			<h3 class="ml_container2_h3">등록된 푸드마켓</h3>
			<ul class="ml_container2_ul">
				<c:forEach items="${marketList}" var="vo">
					<li class="ml_container2_li"><a class="ml_container2_a"
						href="${pageContext.request.contextPath}/market/marketSelect?userNum=${vo.userNum}">
							<img class="ml_container2_img" alt="" src="${pageContext.request.contextPath}/resources/upload/market/${vo.thumbImg}">
							<strong class="ml_container2_strong">${vo.marketName}</strong>
							<span class="ml_container2_span">${vo.marketIntro}</span>
							<em class="ml_container2_em">${vo.canOrder}</em>
							<span class="ml_container2_span">${vo.isOpen}</span>
					</a></li>
				</c:forEach>
			</ul>
		</section>
	</div>
</body>

<%@ include file="../templates/footer.jsp"%>



</html>