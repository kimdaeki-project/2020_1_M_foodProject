<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/templates/header.css">
</head>
<body>
 <header class="header_header">
        <nav class="header_header_nav">
            <div class="header_header_logo">
                <a href="${pageContext.request.contextPath}/"> <img src="../img/main_logo.png">
                </a>
            </div>

            <ul class="header_header_menu">
                <li class="menus"><a href="${pageContext.request.contextPath}/board/boardMenu" class="header_menu_a">메뉴보기</a></li>
                <li><a href="${pageContext.request.contextPath}/board/boardOrder" class="header_menu_a">주문하기</a></li>
                <li><a href="#" class="header_menu_a">트럭스팟</a></li>
                <li><a href="#" class="header_menu_a">이벤트</a></li>
                <li><a href="#" class="header_menu_a">이용안내</a></li>
            </ul>

            <div class="header_login">
                <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogin'">로그인</button>
            </div>
        </nav>
    </header>
</body>
</html>