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
<body>
<%@ include file="../templates/header.jsp"%>
    <body>
    <div class="container">
        <article>
            <div class="truck">
                <section>
                    <div class="menu_index">
                        <ul class="row">
                            <li class="col">
                                <div>
                                    <a href="${pageContext.request.contextPath}/market/marketSelect">
                                        <img alt="" src="${pageContext.request.contextPath}/resources/img/food.jpg" class="food_img">
                                        <div class="item">
                                            <strong>${marketVO.marketName}</strong><br>
                                            <span>매주 월,수,금 1~3시</span><br><br>
                                            <em>8000원</em>
                                        </div>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </article>
    </div>
</body>
<%@ include file="../templates/footer.jsp"%>
</body>
</html>