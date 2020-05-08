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
<%@ include file="../templates/header.jsp"%>
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
							<input type="text" placeholder="이름을 입력해주세요!" id="name" class="memberJoin_input" name="name">
						</div>
						<div>
							<p>닉네임</p>
							<input type="text" placeholder="닉네임을 입력해주세요!" id="nickName" class="memberJoin_input" name="nickName">
						</div>
						<div>
							<p>아이디</p>
							<input type="text" placeholder="아이디를 입력해주세요!" id="id" class="memberJoin_input" name="id">
						</div>
						<div>
							<p>이메일</p>
							<input type="text" placeholder="현재 사용하는 이메일을 입력해주세요!" id="email" class="memberJoin_input" name="email">
						</div>
						<div>
							<p>비밀번호</p>
							<input type="password" placeholder="비밀번호는 6자이상으로!" class="memberJoin_input" name="password" id="password"> 
							<input type="password" placeholder="비밀번호 확인" class="memberJoin_input" id="password_check">
						</div>
						<div>
							<p>휴대폰 번호</p>
							<input type="text" placeholder="01012345678" class="memberJoin_input" name="phone" id="phone">
						</div>
						<div>
							<p>생일</p>
							<input type="date" placeholder="2000.01.01" class="memberJoin_input" name="birth" id="birth">
						</div>
						<div>
							<p>성별</p>
							<input type="radio" class="memberJoin_input" name="gender" value="1" id="male">남자
							<input type="radio" class="memberJoin_input" name="gender" value="0" id="female">여자
						</div>
					</fieldset>
				</div>
				<hr class="memberJoin_hr">
				<div>
					<label class="memberJoin_label"> 
						<input type="checkbox" id="chk_all" name="chk">
						<strong>이용약관 전체동의</strong>
					</label> 
					<label class="memberJoin_label"> 
						<input type="checkbox" id="chk_1" name="chk" class="check_btn">
						<span>(필수)이용약관에 동의합니다.</span> 
						<span class="memberJoin_more">자세히</span>
					</label> 
					<label class="memberJoin_label">
						<input type="checkbox" id="chk_2" name="chk" class="check_btn">
						<span>(필수)개인정보처리방침에 동의합니다.</span>
						<span class="memberJoin_more"> 자세히</span>
					</label>
				</div>
				<nav>
					<input type="submit" class="memberjoin_button" value="가입하기" onclick="checkNull()">
				</nav>
			</form>
		</article>
	</div>
<%@ include file="../templates/footer.jsp"%>



<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	
	//가입 버튼 눌렀을 때, 필수 입력 확인
	//클래스 이름 똑같이 해서 돌리기.........
	function checkNull() {
		var input_val = $("#id");
		var input_val2 = $("#name");
		var result = 0;
		
		$("input[name=]").each(function() {
			if ($(this).val() == '') {
				console.log('값이 비었습니다.');
				result = 1;
			}else{
				console.log('');
			}
		});
	}


	$(function() {
		
		//양식을 전부 채워야 함		
		$(".memberJoin_input").each(function() {
			$(".memberjoin_button").click(function() {
				console.log('클릭됨');
			});
		});
		
		//체크 박스 전체선택, 해제
		$("#chk_all").click(function() {
			if ($("#chk_all").is(':checked')) {
				$(".check_btn").prop("checked", true);
				console.log('?');
			}else {
				$(".check_btn").prop("checked", false);
				console.log('!');
			}
		});
		
		//체크박스 부분 선택
		$('.check_btn').each(function() {
			$(this).click(function() {
				
				var check = true;
				$('.check_btn').each(function() {
					if($(this).prop('checked') === false) {
						check = false;
						return;
					}
				});
				
				$('#chk_all').prop('checked', check);
			});
		});
		
		//약관 동의 안하면 가입 못함
		$(function() {
			$(".memberjoin_button").click(function() {
				if ($("#chk_all").is(':checked')) {
				}else {
					alert('모든 약관에 동의해야 가입이 가능합니다!');
					return false;
				}
			})
		})
	});
</script>
</body>
</html>