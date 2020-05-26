<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberIdFind.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
</head>
<body>
    <div class="mif_container">
		<article class="mif_article">
			<div>
				<header class="mif_header">
					<h2>아이디 찾기</h2>
					<p>등록된 이메일을 입력해주시면<br>해당 이메일 주소로 인증번호를 보내드립니다.</p>
				</header>
				<form id="form-data" class="mif_form">
					<input name="name" id="name" placeholder="이름" type="text">
					<input name="email" id="email" placeholder="이메일을 입력해주세요" type="email">
					<button type="button" id="btn-id-search">요청하기</button>
				</form>
			</div>
		</article>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
	<script type="text/javascript">
	
	var mailCertification=0;
	
	$("#form-data").on("click","#btn-mail-certification",function(){
		alert(mailCertification);
		
		var inputNum = $("#mailCertification").val();
		if(inputNum == mailCertification){
			alert("인증번호와 일치합니다.");
		}
		
	});
	
	$("#btn-id-search").click(function() {
		var name = $("#name").val();
		var email = $("#email").val();	
		
		
		$.ajax({
			url:"./mailCertification",
			type:"post",
			data:{
				email:email,
				name:name
			},
			success:function(result){
				if(result == 1){
					console.log(result);
					
					html = '<input name="mailCertification" id="mailCertification" placeholder="인증번호를 입력해주세요" type="text">';
					html = html + '<button type="button" id="btn-mail-certification">인증하기</button>';
					
					$("#form-data").html(html);
					mailCertification = ${sessionScope.mailCertification};
					console.log(mailCertification);
				}else{
					alert("등록되지 않은 이메일입니다.");
				}
			}
			
		});
	});
	
	
	$("#joinForm").validate({
        rules:{
            name:{required: true, maxlength: 6},
            email:{required: true, email:true}
        },
        messages:{
            name:{
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