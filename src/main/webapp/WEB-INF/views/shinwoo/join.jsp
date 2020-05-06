<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/join.css">
</head>
<body>
	<div class="container">
		<article>
			<header>
				<img alt="logo" src="../img/logo.png">
				<p>프리미엄 샐러드 배송</p>
			</header>
			<div>
				<fieldset>
					<div>
						<p>이름</p>
						<input type="text" placeholder="이름을 입력해주세요!">
					</div>
					<div>
						<p>이메일</p>
						<input type="text" placeholder="현재 사용하는 이메일을 입력해주세요!">
					</div>
					<div>
						<p>비밀번호</p>
						<input type="password" placeholder="비밀번호는 6자이상으로!"> <input
							type="password" placeholder="비밀번호 확인">
					</div>
					<div>
						<p>휴대폰 번호</p>
						<input type="text" placeholder="01012345678">
					</div>
					<div>
						<p>나이</p>
						<input type="text" placeholder="20">
					</div>
				</fieldset>
			</div>
			<hr>
			<div>
				<label> <strong>✔️ 이용약관 전체동의</strong>
				</label> <label> ✔️ <span>(필수)이용약관에 동의합니다.</span> <span class="more">
						자세히</span></label> <label>✔️ <span>(필수)개인정보처리방침에 동의합니다.</span><span
					class="more"> 자세히</span></label>
			</div>
			<nav>
				<button>가입하기</button>
			</nav>
		</article>
	</div>
</body>
</html>