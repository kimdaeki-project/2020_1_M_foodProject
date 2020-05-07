<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 가입 완료하기</title>
<link rel="stylesheet" href="../resources/css/member/memberKakaoJoin.css">
</head>
<body>
<div class="mkjcontainer">
		<article class="mkj_article">
		<form action="login">
			<header class="mkj_header">
				<p>푸드트럭</p>
			</header>
			<div>
				<fieldset class="mkj_fieldset">
					<div>
						<p>이름</p>
						<input type="text" placeholder="이름을 입력해주세요!" class="mkj_input" name="name" value="${name}">
					</div>
					<div>
						<p>아이디</p>
						<input type="text" placeholder="아이디를 입력해주세요!" class="mkj_input" name="id" value="${id}">
					</div>
					<div>
						<p>이메일</p>
						<input type="email" placeholder="현재 사용하는 이메일을 입력해주세요!" class="mkj_input" name="email" value="${email}">
					</div>
					<div>
						<p>닉네임</p>
						<input type="text" placeholder="닉네임을 입력해주세요!" class="mkj_input" name="nickname" value="${nickname}">
					</div>
					<div>
						<p>생일</p>
						<input type="date" placeholder="2000.01.01" class="mkj_input" name="birthday" value="${birthday}">
					</div>
					<div>
						<p>성별</p>
						<input type="radio" class="mkj_radio" name="gender">남자
						<input type="radio" class="mkj_radio" name="gender">여자
					</div>
				</fieldset>
			</div>
			<hr class="mkj_hr">
			<div>
				<label class="mkj_label"> 
					<input type="checkbox" name="terms">
					<strong>이용약관 전체동의</strong>
				</label> 
				<label class="mkj_label"> 
					<input type="checkbox" name="terms">
					<span>(필수)이용약관에 동의합니다.</span> 
					<a href="#" class=".mkj_more">자세히</a>
				</label> 
				<label class="mkj_label">
					<input type="checkbox" name="terms">
					<span>(필수)개인정보처리방침에 동의합니다.</span>
					<a href="#" class="more">자세히</a>
				</label>
			</div>
			<nav>
				<button type="submit" class="mkj_button">가입 완료 하기</button>
			</nav>
			</form>
		</article>
	</div>
</body>
</html>