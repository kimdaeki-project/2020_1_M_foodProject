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
<style type="text/css">

div.toggleWrap { position: relative; width: 300px; margin: 0 auto; padding: 0 10px; background: #1F3766; }
div.toggleWrap > span { font-size: 15px; font-weight: 600; line-height: 2; color: #fff; }
.toggleWrap input { display: none; }
.toggleWrap > div { position: absolute; top: 0; bottom: 0; right: 10px; width: 34px; height: 20px; margin-top: 5px; } 
.toggleWrap label { display: block; width: 36px; height: 20px; box-sizing: border-box; border-radius: 36px; border: 1px solid #e5e5e5; background: #fff; transition: all 0.3s ease; } 
.toggleWrap label > span { position: absolute; top: 3px; left: 3px; display: block; width: 14px; height: 14px; border-radius: 50%; box-sizing: border-box; box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.25), 0 3px 3px 0 rgba(0, 0, 0, 0.15); transition: all 0.3s cubic-bezier(0.275, -0.45, 0.725, 1.45); background: #fff; }
.toggleWrap input:active + div label,.toggleWrap input:checked + div label { border: 10px solid #abe2fb; box-shadow: 0 0 5px #abe2fb; } 
.toggleWrap input:active + div label > span,.toggleWrap input:checked + div label > span { left: 18px; }



</style>

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
		<div class="toggleWrap" style="float: right;"> 
			<span>영업 시작 버튼</span> 
			<input type="checkbox" id="toggle_alarm" name="" value="0" /> 
			<div> 
				<label for="toggle_alarm"> 
					<span /> 
				</label> 
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
						<li id="marketJoin"><a href="${pageContext.request.contextPath}/market/marketJoin">판매자 신청</a></li>
					</c:if>
					<c:if test="${memberVO.isFoodTruck eq '1'}">
						<li id="marketPage"><a>마켓 정보 수정</a></li>
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
		
		
		
		
		
		$("#toggle_alarm").click(function() {
			var latitude,longitude;
			
			var check = $("#toggle_alarm").val();
			if(check == 0){
				//영업시작
				$("#toggle_alarm").val(1);
				
				if (navigator.geolocation) {
				    navigator.geolocation.getCurrentPosition(function(position) {
				    	latitude = position.coords.latitude;
				    	longitude = position.coords.longitude;
				    	
				    	latitude = Math.floor(latitude*1000000)/1000000;
				    	longitude = Math.floor(longitude*1000000)/1000000;
				    	
						$.post("../market/marketIsOpen",{num:'${memberVO.num}',isOpen:$("#toggle_alarm").val(),latitude:latitude,longitude:longitude},function(result){
							console.log("p result:"+result);
						})

					});
				}else { 
				  	alert("허용안해서 주소 못불러옴")
				}

			}else{
				//영업종료
				$("#toggle_alarm").val(0);
				$.get("../market/marketIsOpen?num=${memberVO.num}&isOpen="+$("#toggle_alarm").val(),function(result){
					console.log("result:"+result);
				})

			}
			
		});
		
		

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
		$('#marketPage').click(function() {
			$.get("../market/marketPage?num=${memberVO.num}",function(result){
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		$('#default').click();
</script>

</body>
</html>