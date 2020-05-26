<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
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
	
	.done-table{
		margin-top: 20px;	
		width: 100%;
		border: 1px solid #6f7174;
	}
	
	.done-tr{
	
	}
	
	.done-tr > th{
		text-align: left;
		color: #3d3d3d;
		width: 20%;
		padding: 3px 0 3px 10px;
	}
	
	.done-tr > td{
		text-align: left;
		color: #3d3d3d;
		width: 80%;
	}
	
	tbody{
		margin: 0;
		padding: 0;
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