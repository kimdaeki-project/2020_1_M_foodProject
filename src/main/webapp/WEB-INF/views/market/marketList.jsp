<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet"
	href="../resources/css/market/marketList.css">
</head>
<%@ include file="../templates/header.jsp"%>
    <body>
    <div class="container">
        <article>
            <div class="truck">
                <section>
                    <div class="menu_index">
                        <ul class="row">
                        <c:forEach items="${marketList}" var="vo">
                            <li class="col marketData">
                                <div>
                                    <a href="${pageContext.request.contextPath}/market/marketSelect?num=${vo.num}">
                                        <img alt="" src="${pageContext.request.contextPath}/resources/img/food.jpg" class="food_img">
                                        <div class="item">
                                            <strong>${vo.marketName}</strong><br>
                                            <span>${vo.marketIntro}</span><br><br>
                                        </div>
                                    </a>
                                </div>
                            </li>
                          </c:forEach>
                        </ul>
                    </div>
                </section>
            </div>
        </article>
    </div>
</body>
<%@ include file="../templates/footer.jsp"%>



</html>