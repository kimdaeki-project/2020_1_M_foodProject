<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 정보 수정 페이지</title>
</head>
<body>
	<div class="mp_box mp_box_all">
		<form action="">
			<div class="mp_infoMod_box">
				<p>상점명</p>
				<input type="text" name="marketName" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>운영시간</p>
				<input type="time" name="OPENTIME" class="mp_infoMod_input">
				<input type="time" name="CLOSETIME" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>트럭 설명</p>
				<input type="text" name="MARKETINTRO" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>트럭 메인 이미지 첨부</p>
				<input type="file" name="THUMBIMG" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<button type="submit">신청하기</button>
			</div>
		</form>
	</div>
</body>
</html>