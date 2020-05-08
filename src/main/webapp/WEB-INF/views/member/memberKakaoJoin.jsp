<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>카카오 가입 완료하기</title>
<link rel="stylesheet"
	href="../resources/css/member/memberKakaoJoin.css">
</head>
<body>
	<%@ include file="../templates/header.jsp"%>
	<div class="mkjcontainer">
		<article class="mkj_article">
		<form action="../member/memberJoin" method="post">
			<header class="mkj_header">
				<p>푸드트럭</p>
			</header>
			<div>
				<fieldset class="mkj_fieldset">
					<div>
						<p>이름</p>
						<input type="text" placeholder="이름을 입력해주세요!" class="mkj_input" name="name">
					</div>
					<div>
						<p>아이디</p>
						<input type="text" placeholder="아이디를 입력해주세요!" class="mkj_input" name="id">
					</div>
					<div>
						<p>이메일</p>
						<input type="email" placeholder="현재 사용하는 이메일을 입력해주세요!" class="mkj_input" name="email" value="${email}">
					</div>
					<div>
						<p>비밀번호</p>
						<input type="password" placeholder="비밀번호를 입력해주세요!" class="mkj_input" name="password">
					</div>
					<div>
						<p>닉네임</p>
						<input type="text" placeholder="닉네임을 입력해주세요!" class="mkj_input" name="nickName" value="${nickname}">
					</div>
					<div>
						<p>출생년월일</p>
						<input type="date" class="mkj_input" name="birth">
					</div>
					<div>
						<p>휴대폰 번호</p>
						<input type="text" placeholder="01012345678" class="mkj_input" name="phone">
						</div>
					<div>
						<p>성별</p>
						<input type="hidden" id="genderData" value="${gender}">
						<input type="radio" class="mkj_radio" id="genderMale" name="gender" value="1">남자
						<input type="radio" class="mkj_radio" id="genderFemale" name="gender" value="0">여자
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
	<script type="text/javascript">
		var gender = $('#genderData').val();
		console.log(gender);
		if (gender === 'male') {
			$('#genderMale').attr("checked", "checked");
			console.log("done");
		} else if (gender === 'female') {
			$('#genderFemale').attr("checked", "checked");
		}
	</script>
	<%@ include file="../templates/footer.jsp"%>
</body>
</html>