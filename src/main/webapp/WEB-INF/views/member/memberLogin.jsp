<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../resources/css/member/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templates/header.css">

</head>
<body>
<c:import url="../templates/header.jsp"></c:import>

<div class="container">
	
		<article>
			<header>
				<img alt="logo" src="../img/logo.png">
				<p>프리미엄 샐러드 배송</p>
			</header>
			<form action="login">
				<div>
					<input type="text" placeholder="이메일을 입력해주세요"> <input
						type="password" placeholder="비밀번호를 입력해주세요">
				</div>
				<p class="autologin">
					<span>✔️</span> <span>자동로그인</span>
				</p>
				<nav>
					<button class="login" type="submit">로그인</button>
				</nav>
			</form>
			
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=97f1860e20781cd962ba73e33913c194&redirect_uri=http://localhost:8080/project/auth/kakao&response_type=code">
            <img src="${pageContext.request.contextPath}/resources/img/auth/kakao_login_btn.png">
        	</a>
			
			<nav class="joinandfind">
				<div>
					<a href="">아이디 찾기</a>
				</div>
				<div>
					<a href="">비밀번호 찾기</a>
				</div>
				<div>
					<a href="">회원가입</a>
				</div>
			</nav>
		</article>
	</div>
	
</body>
</html>