<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templates/header.css">
<script src="https://kit.fontawesome.com/01da845ab6.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="header">
        <a href="${pageContext.request.contextPath}" class="header_a">
            <img src="${pageContext.request.contextPath}/resources/css/img/main-logo.png" >
        </a>
        <nav class="h_nav">
            <ul class="h_nav_ul">
                <li><a href="${pageContext.request.contextPath}/market/marketList">메뉴보기</a></li>
                <li><a href="#">트럭스팟</a></li>
                <li><a href="#">이용안내</a></li>
                <li><a href="#">이벤트</a></li>
            </ul>
        </nav>
        <c:if test="${empty memberVO}">
            <button type="button" class="h_login"
                onclick="location.href='${pageContext.request.contextPath}/member/memberLogin'">로그인</button>
        </c:if>
        <c:if test="${not empty memberVO}">
            <button type="button" class="h_name"
                onclick="location.href='${pageContext.request.contextPath}/member/memberPage'">${memberVO.name}</button>
            <a><i class="fas fa-shopping-cart"></i></a>
        </c:if>
    </div>
</body>
</body>
</html>