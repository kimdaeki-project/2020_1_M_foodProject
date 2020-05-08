<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/css/member/join.css">
</head>
<body>
	<div class="memberJoin_container">
		<article class="memberJoin_article">
			<form action="./memberJoin" method="post">
				<header class="memberJoin_header">
					<img alt="logo" src="../img/logo.png" class="memberJoin_img">
					<p>프리미엄 샐러드 배송</p>
				</header>
				<div>
					<fieldset class="memberJoin_fieldset">
						<div>
							<p>이름</p>
							<input type="text" placeholder="이름을 입력해주세요!" class="memberJoin_input" name="name">
						</div>
						<div>
							<p>아이디</p>
							<input type="text" placeholder="아이디를 입력해주세요!" class="memberJoin_input" name="id">
						</div>
						<div>
							<p>이메일</p>
							<input type="text" placeholder="현재 사용하는 이메일을 입력해주세요!" class="memberJoin_input" name="email">
						</div>
						<div>
							<p>비밀번호</p>
							<input type="password" placeholder="비밀번호는 6자이상으로!" class="memberJoin_input" name="password"> 
							<input type="password" placeholder="비밀번호 확인" class="memberJoin_input">
						</div>
						<div>
							<p>휴대폰 번호</p>
							<input type="text" placeholder="01012345678" class="memberJoin_input" name="phone">
						</div>
						<div>
							<p>생일</p>
							<input type="date" placeholder="2000.01.01" class="memberJoin_input" name="birth">
						</div>
						<div>
							<p>성별</p>

							<input type="radio" class="memberJoin_input" name="gender" value="1">남자
							<input type="radio" class="memberJoin_input" name="gender" value="0">여자

						</div>
					</fieldset>
				</div>
				<hr class="memberJoin_hr">
				<div>
					<label class="memberJoin_label"> <strong>✔️ 이용약관 전체동의</strong></label> 
					<label class="memberJoin_label"> ✔️ <span>(필수)이용약관에 동의합니다.</span> <span class="memberJoin_more">자세히</span></label> 
					<label class="memberJoin_label">✔️ <span>(필수)개인정보처리방침에 동의합니다.</span><span class="more"> 자세히</span></label>
				</div>
				<nav>
					<button type="submit" class="memberjoin_button">가입하기</button>
				</nav>
			</form>
		</article>
	</div>
</body>
</html>