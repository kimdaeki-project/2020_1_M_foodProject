<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../resources/css/member/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/templates/header.css">

</head>
<body>

	<div class="memberLogin_container">
		<article class="memberLogin_article">
			<header class="memberLogin_header">
				<img alt="logo" src="../img/logo.png" class="memberLogin_img">

				<p>프리미엄 샐러드 배송</p>
			</header>
			<form action="./memberLogin" method="post">
				<div>
					<input name="id" type="text" placeholder="이메일을 입력해주세요"
						class="memberLogin_input"> <input name="password"
						type="password" placeholder="비밀번호를 입력해주세요"
						class="memberLogin_input">
				</div>
				<p class="autologin">
					<span>✔️</span> <span>자동로그인</span>
				</p>
				<nav>
					<button class="memberLogin_login memberLogin_button" type="submit">로그인</button>
				</nav>
			</form>

			<a
				href="https://kauth.kakao.com/oauth/authorize?client_id=97f1860e20781cd962ba73e33913c194&redirect_uri=http://localhost:8080/project/auth/kakao&response_type=code"
				style="text-decoration: none;">
				<button class="memberLogin_kakao memberLogin_button" type="submit">카카오 로그인</button>
			</a>

			<nav class="joinandfind">
				<div>
					<a href="" class="memberLogin_a">아이디 찾기</a>
				</div>
				<div>
					<a href="" class="memberLogin_a">비밀번호 찾기</a>
				</div>
				<div>
					<a href="" class="memberLogin_a">회원가입</a>
				</div>
			</nav>
		</article>
	</div>

</body>
</html>