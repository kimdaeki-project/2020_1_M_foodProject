<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberIdFind.css">
</head>
<body>
	<div class="mif_container">
		<article class="mif_article">
			<div>
				<header class="mif_header">
					<h2>비밀번호 찾기</h2>
					<p>등록된 이메일을 입력해주시면<br>해당 이메일 주소로 인증번호를 보내드립니다.</p>
				</header>
				<form action="" class="mif_form">
					<input name="id" placeholder="아이디" type="text">
					<input name="email" placeholder="이메일을 입력해주세요" type="email">
					<button>요청하기</button>
				</form>
			</div>
		</article>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
	<script type="text/javascript">
	$("#joinForm").validate({
        rules:{
            id:{required: true, maxlength: 6},
            email:{required: true, email:true}
        },
        messages:{
            id:{
                required:"필수 입력 사항입니다."
                },
            email:{
                required:"필수 입력 사항입니다.", 
                email:"이메일 형식으로 입력해주세요."
            }
        }
    });
	</script>
</body>
</html>