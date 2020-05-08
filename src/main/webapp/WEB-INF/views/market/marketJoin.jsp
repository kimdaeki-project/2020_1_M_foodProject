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
		<form action="../market/marketJoin" method="post" enctype="multipart/form-data">
			<div class="mp_infoMod_box">
				<p>상점명</p>
				<input type="text" name="marketName" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>사업자번호</p>
				<input type="text" name="crn" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>운영시간</p>
				오픈: <input type="text" name="openTime" class="mp_infoMod_input">
				마감: <input type="text" name="closeTime" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>트럭 설명</p>
				<input type="text" name="marketIntro" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>트럭 메인 이미지 첨부</p>
				<input type="file" name="files" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<button type="submit">신청하기</button>
			</div>
		</form>
	</div>
</body>
</html>