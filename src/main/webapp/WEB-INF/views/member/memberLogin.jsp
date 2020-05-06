<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../resources/css/login.css">
</head>
<body>
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
					<button class="kakao">카카오계정으로 로그인</button>
				</nav>
			</form>
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