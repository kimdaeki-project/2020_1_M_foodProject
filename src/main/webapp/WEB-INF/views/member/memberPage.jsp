<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../resources/css/member/memberPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	 
</script>
</head>
<body>
<%@ include file="../templates/header.jsp"%>
	<div style="margin: 103px 0 50px 0; padding: 0px 10% ">
		<div class="mp_myInfoBox">
			<div class="mp_pic">
				<img src="../../../ico-leaf.svg">
			</div>
			<div class="mp_me">
				<strong>${memberVO.name}</strong>
				<span>${memberVO.email}</span>
			</div>
			<div class="mp_num">
				<span>수령예정</span>
				<em>0</em>
			</div>
			<div class="mp_num">
				<span>총 주문회수</span>
				<em>0</em>
			</div>
		</div>
		<div class="mp_myInfoNav">
			<aside>
				<h2>마이 페이지</h2>
				<ul>
					<li id="default"><a href="#">주문/결제 내역</a></li>
					<li id="myReview"><a href="#">나의 후기</a></li>
					<li id="memberUpdate"><a href="#">회원정보 수정</a></li>
					
					<c:if test="${memberVO.isFoodTruck eq '0'}">
						<li id="marketJoin"><a href="#">판매자 신청</a></li>
					</c:if>
					<c:if test="${memberVO.isFoodTruck eq '1'}">
						<li id="marketPage"><a href="#">마켓 정보 수정</a></li>
					</c:if>
					
					<li id="member_delete"><a>탈퇴하기</a></li>
					<li id="li5"><a href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a></li>
				</ul>
			</aside>
			<div class="mp_box" style="width: 100%">
			</div>
		</div>
	</div>
<%@ include file="../templates/footer.jsp"%>

<script type="text/javascript">

		$("#member_delete").click(function() {
			var check = confirm("탈퇴하시겠습니까?");
			
			if(check){
				location.href="./memberDelete?id=${memberVO.id}"
			}
		});

		//탭 메뉴
		$('#default').click(function() {
			$.get("./orderAndPay",function(result){
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		$('#myReview').click(function() {
			$.get("./myReview",function(result){
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		$('#memberUpdate').click(function() {
			$.get("./memberUpdate",function(result){
				
				console.log(result);
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		$('#marketJoin').click(function() {
			$.get("../market/marketJoin",function(result){
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		$('#default').click();
</script>

</body>
</html>