<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberIdFind.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
</head>
<body>
   <%@ include file="../templates/header.jsp"%>
	<div class="mif_container">
		<article class="mif_article">
			<div id="form-data">
				<header class="mif_header">
					<h2>비밀번호 찾기</h2>
					<p>등록된 아이디를 입력해주시면<br>해당 이메일 주소로 인증번호를 보내드립니다.</p>
				</header>
				<form class="mif_form">
					<input name="id" id="id" placeholder="아이디" type="text">
					<input name="email" id="email" placeholder="이메일을 입력해주세요" type="email">
					<button type="button" id="btn-pwd-search">요청하기</button>
				</form>
			</div>
		</article>
	</div>
   <%@ include file="../templates/footer.jsp"%>
	
	
	<script type="text/javascript">
	
	
	$("#form-data").on("click","#btn-go-login",function(){
		location.href="./memberLogin";
	});
	
	$("#form-data").on("click","#btn-replay",function(){
		location.href="./memberPwFind";
	});
	
	
	$("#btn-pwd-search").click(function() {
		var id = $("#id").val();
		var email = $("#email").val();	
		
		
		$.ajax({
			url:"./mailCertification",
			type:"post",
			data:{
				email:email,
				id:id,
			},
			success:function(result){
				if(result != 0){
					var html = '<header class="mif_header">'
						+'<h2>임시 비밀번호 발송 완료</h2>'
						+'<p>등록된 이메일로 전송되었습니다.<br>해당 이메일을 확인해 주세요.</p>'
						+'<p>발급된 <span style="color:red;">임시 비밀번호로 로그인은 24시간 동안만 가능</span>하오니, '
						+'로그인 후 <span style="color:red;">반드시 비밀번호를 변경해 주세요!</span></p>'
						+'</header>'
						+'<form id="form-data" class="mif_form">'
						+'<button type="button" id="btn-go-login">로그인 하러가기</button>'	
						+'<input style="margin-top:16px;" type="button" id="btn-replay" value="다시시도">'
						+'</form>';
						
						$("#form-data").html(html);
				}else{
					alert("등록되지 않은 이메일입니다.");
				}
			}
			
		});
	});
	
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