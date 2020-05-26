<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>카카오 가입 완료하기</title>
<link rel="stylesheet"
	href="../resources/css/member/memberKakaoJoin.css">
</head>
<body>
	<%@ include file="../templates/header.jsp"%>
	<div class="mkjcontainer">
		<article class="mkj_article">
			<form action="../member/memberJoin" method="post" id="memberJoin">
				<header class="mkj_header">
					<p>푸드트럭</p>
				</header>
				<div>
					<fieldset class="mkj_fieldset">
						<div>
							<p>이름</p>
							<input type="text" placeholder="이름을 입력해주세요!" class="mkj_input"
								name="name">
						</div>
						<div>
							<p>아이디</p>
							<input type="text" placeholder="아이디를 입력해주세요!" class="mkj_input"
								name="id">
						</div>
						<div>
							<p>이메일</p>
							<input type="email" placeholder="현재 사용하는 이메일을 입력해주세요!"
								class="mkj_input" name="email" value="${email}">
						</div>
						<div>
							<p>비밀번호</p>
							<input type="password" placeholder="비밀번호를 입력해주세요!"
								class="mkj_input" name="password">
						</div>
						<div>
							<p>닉네임</p>
							<input type="text" placeholder="닉네임을 입력해주세요!" class="mkj_input"
								name="nickName" value="${nickname}">
						</div>
						<div>
							<p>출생년월일</p>
							<input type="date" class="mkj_input" name="birth">
						</div>
						<div>
							<p>휴대폰 번호</p>
							<input type="text" placeholder="01012345678" class="mkj_input"
								name="phone">
						</div>
						<div>
							<p>성별</p>
							<input type="hidden" id="genderData" value="${gender}"> <input
								type="radio" class="mkj_radio" id="genderMale" name="gender"
								value="1">남자 <input type="radio" class="mkj_radio"
								id="genderFemale" name="gender" value="0">여자
						</div>
					</fieldset>
				</div>
				<hr class="mkj_hr">
				<div>
					<label class="mkj_label"> <input type="checkbox" id="chk_all"
						name="terms"> <strong>이용약관 전체동의</strong>
					</label> <label class="mkj_label"> <input type="checkbox" class="check_btn"
						name="terms"> <span>(필수)이용약관에 동의합니다.</span> <a href="#"
						class=".mkj_more">자세히</a>
					</label> <label class="mkj_label"> <input type="checkbox" class="check_btn"
						name="terms"> <span>(필수)개인정보처리방침에 동의합니다.</span> <a
						href="#" class="more">자세히</a>
					</label>
				</div>
				<nav>
					<button type="submit" class="mkj_button">가입 완료 하기</button>
				</nav>

			</form>
		</article>
	</div>
	<%@ include file="../templates/footer.jsp"%>
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
	<script type="text/javascript">
		//성별가져오기?
		var gender = $('#genderData').val();
		console.log(gender);
		if (gender === 'male') {
			$('#genderMale').attr("checked", "checked");
			console.log("done");
		} else if (gender === 'female') {
			$('#genderFemale').attr("checked", "checked");
		}
	
		//유효성 검사
		//validate 유효성 검사
    $("#memberJoin").validate({
        rules:{
            name:{required: true, maxlength: 6},
            nickName:{required: true, maxlength: 6},
            id:{required: true, rangelength:[5, 10], eng_number:true},
            email:{required: true, email:true},
            password:{required: true, rangelength:[5, 10], eng_number:true},
            phone:{required: true, maxlength:11, digits: true},
            birth:{required: true},
            gender:{required: true}
        },
        messages:{
            name:{
                required:"필수 입력 사항입니다.",
                maxlength:"6글자까지만 입력 가능합니다."
                },
            nickName:{
                required:"필수 입력 사항입니다.",
                maxlength:"6글자까지만 입력 가능합니다."
            },
            id:{
                required:"필수 입력 사항입니다.",
                rangelength:"최소 5글자, 10글자 사이여야 합니다.",
                eng_number:"영어와 숫자만 입력가능합니다."
            },
            email:{
                required:"필수 입력 사항입니다.", 
                email:"이메일 형식으로 입력해주세요."
            },
            password:{
                required:"필수 입력 사항입니다.",
                rangelength:"최소 5글자, 10글자 사이여야 합니다.",
                eng_number:"영어와 숫자만 입력가능합니다."
            },
            phone:{
                required:"필수 입력 사항입니다.",
                maxlength:"최대 11자리까지 입력 가능합니다.",
                digits:"숫자만 입력해 주세요."
            },
            birth:{
                required:"필수 입력 사항입니다."
            },
            gender:{
                required:"필수 입력 사항입니다."
            }
        }
    });
		
$(function() {
        
       /*  //아이디 중복검사
        $("#id").keyup(function() {
        	console.log('성공');
            var id = $("#id").val();
            console.log(id);
            console.log(id.length);
            $.ajax({
                url:'./memberIdCheck',
                type:'get',
                data:{ id:id },
                success: function(data) {
                	if (data===0){
                        //사용중인 아이디라고 화면에 뜨게하기
                        $("#mj_showIdChk").text("중복되는 아이디입니다.");
						$("#mj_showIdChk").css("color", "red");
                    } else if(data===1) {
                    	// 5자리 갯수 이상, 사용 가능한 아이디라고 화면에 뜨게하기
                    	if(id.length > 4) {
                        	$("#mj_showIdChk").text("사용가능한 아이디입니다.");
							$("#mj_showIdChk").css("color", "#27b06e");
                    	} else {
                    		$("#mj_showIdChk").empty();
                    	}
                    }
                },
                error: function() {
						console.log("연결 실패");
				}
            });
        }); */
		
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