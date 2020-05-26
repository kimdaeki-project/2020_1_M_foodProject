<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잘못된 접근</title>
<style type="text/css">
.error-body{ 
    margin: 30% 0;
}

.error-con{
    text-align: center;
    margin: 300px 0;
}

.error-con > span {
    min-width: 540p;
    font-size: 30px;
    color: #6f7174;
}

.error-con > p {
    min-width: 540p;
    font-size: 30px;
    color: #6f7174;
    font-weight: 600;
}
</style>
</head>
<body>
	<%@ include file="../templates/header.jsp"%>
	<div class="error-body">
		<div class="error-con">
			<span> ✖ </span>
			<p> 잘못된 접근입니다... </p>
		</div>
	</div>
	<%@ include file="../templates/footer.jsp"%>
</body>
</html>