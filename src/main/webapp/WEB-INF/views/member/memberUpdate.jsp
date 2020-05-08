<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="mp_box mp_box_all">
		<form action="./memberUpdate" method="post">
			
			
			<div class="mp_infoMod_box">
				<p>닉네임</p>
				<input type="text" name="nickName" class="mp_infoMod_input" value="${memberVO.nickName}">
			</div>
			<div class="mp_infoMod_box">
				<p>이름</p>
				<input type="text" name="name" class="mp_infoMod_input" value="${memberVO.name}" >
			</div>
			<div class="mp_infoMod_box">
				<p>이메일</p>
				<input type="email" name="email" class="mp_infoMod_input" value="${memberVO.email}">
			</div>
			<div class="mp_infoMod_box">
				<p>비밀번호</p>
				<input type="password" name="password" class="mp_infoMod_input" value="${memberVO.password}">
			</div>
			<div class="mp_infoMod_box">
				<p>휴대폰 번호</p>
				<input type="text" name="phone" class="mp_infoMod_input" value="${memberVO.phone}">
			</div>
			
			<div class="mp_infoMod_box">
				<button type="submit">저장하기</button>
			</div>
		</form>
	</div>
