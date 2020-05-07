<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../../resources/css/member/memberPage.css">
</head>
<body>
	<div class="mp_div">
		<div class="mp_myRecord">
			<div class="mp_myPic">
				<img alt="" src="">
			</div>
			<div class="mp_myProfile">
				<strong>이름</strong><br> <span>이메일</span>
			</div>
			<div class="mp_myRecords">
				<span>수령 예정</span><br> <em>0</em>
			</div>
			<div class="mp_myRecords">
				<span>총 주문 횟수</span><br> <em>0</em>
			</div>
		</div>
		<div class="mp_myContainer">
			<aside class="mp_aside">
				<h2>마이페이지</h2>
				<ul>
					<li><a href="#">주문/결제 내역</a></li>
					<li><a href="#">나의 후기</a></li>
					<li><a href="#">회원 정보 수정</a></li>
					<li><a href="#">탈퇴하기</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
			</aside>
			<div class="mp_myContainer2">
				<article class="mp_article">
					<div class="mp_orderAndPay">
						<h2>주문/결제 내역</h2>
					</div>
					<div class="mp_box"></div>

					<div class="mp_myReview">
						<h2>나의 후기</h2>
					</div>
					<div class="mp_box"></div>

					<div class="mp_infoMod">
						<h2>회원정보수정</h2>
					</div>

					<div class="mp_box">
						<form>
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
							<input type="radio" name="gender" value="male">남자 
							<input type="radio" name="gender" value="female">여자
						</div>
						<div class="mp_infoMod_box">
							<button type="submit">저장하기</button>
						</div>
						</form>
					</div>
				</article>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function ajaxTest() {
		$.ajax({
			type: "GET",
			url: "",
		})
	}
</script>
</html>