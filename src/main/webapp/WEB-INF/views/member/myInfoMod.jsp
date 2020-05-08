<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mp_box mp_box_all">
		<form action="">
			<div class="mp_infoMod_box">
				<p>이름</p>
				<input type="text" name="name" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>아이디</p>
				<input type="text" name="id" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>이메일</p>
				<input type="email" name="email" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>비밀번호</p>
				<input type="password" name="pw" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>휴대폰 번호</p>
				<input type="text" name="phone" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>성별</p>
				<input type="radio" name="gender" value="male">남자 <input
					type="radio" name="gender" value="female">여자
			</div>
			<div class="mp_infoMod_box">
				<button type="submit">저장하기</button>
			</div>
		</form>
	</div>
</body>
</html>