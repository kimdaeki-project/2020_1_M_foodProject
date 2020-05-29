<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드마켓 - 주문 완료!</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/home/favicon.ico" />
<style type="text/css">
	.done-body{ 
    	margin: 30% 0;
	}
	
	.done-con{
		text-align: center;
    	margin: 300px 0;
	}
	
	.done-con > span {
		min-width: 540p;
		font-size: 30px;
		color: #6f7174;
	}
</style>
</head>
<body>

	<script src="http://code.jquery.com/jquery-1.9.1.js"></script> 
	<script type="text/javascript">
		
	var count = 3;
	var countdown = setInterval(function() {
			$(".countdown").html(count+ "초 후 메인 페이지로 리다이렉트 됩니다...");

			if (count == 0) {
				clearInterval(countdown);
				location.replace('http://localhost:8080/project/');
			}
			count--;
		}, 1000);
	</script>
	
	<%@ include file="../templates/header.jsp"%>
	<div class="done-body">
		<div class="done-con">
			<span> 구매가 정상적으로 <b style="color: #27b06e;">완료</b>되었습니다.</span><br>
			<span class="countdown"></span>
		</div>
	</div>
	<%@ include file="../templates/footer.jsp"%>
</body>
</html>