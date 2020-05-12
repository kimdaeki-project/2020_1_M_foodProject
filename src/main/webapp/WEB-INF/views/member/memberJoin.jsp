<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/css/member/memberJoin.css">
</head>
<body>
<%@ include file="../templates/header.jsp"%>
	<div class="memberJoin_container" style="margin: 103px 0 50px 0px;">
        <article class="memberJoin_article">
            <form action="./memberJoin" method="post" id="joinForm">
                <header class="memberJoin_header">
                    <p>매일 찾아오는 푸드트럭</p>
                </header>
                <div>
                    <fieldset class="memberJoin_fieldset">
                        <div>
                            <p>이름</p>
                            <input type="text" placeholder="이름을 입력해주세요!" id="name" class="memberJoin_input" name="name">
                        </div>
                        <div>
                            <p>닉네임</p>
                            <input type="text" placeholder="닉네임을 입력해주세요!" id="nickName" class="memberJoin_input"
                                name="nickName">
                        </div>
                        <div>
                            <p>아이디</p>
                            <input type="text" placeholder="아이디를 입력해주세요!" id="id" class="memberJoin_input" name="id">
                        </div>
                        <div class="mj_showIdChk" id="mj_showIdChk"></div>
                        <div>
                            <p>이메일</p>
                            <input type="email" placeholder="현재 사용하는 이메일을 입력해주세요!" id="email" class="memberJoin_input"
                                name="email">
                        </div>
                        <div>
                            <p>비밀번호</p>
                            <input type="password" placeholder="비밀번호는 6자이상으로!" class="memberJoin_input" name="password"
                                id="password" style="margin-bottom: 5px;">
                            <input type="password" placeholder="비밀번호 확인" class="memberJoin_input" id="password_check" name="password_check" style="margin-top: 5px;">
                        </div>
                        <div>
                            <p>휴대폰 번호</p>
                            <input type="text" placeholder="01012345678" class="memberJoin_input" name="phone"
                                id="phone">
                        </div>
                        <div>
                            <p>생일</p>
                            <input type="date" placeholder="2000.01.01" class="memberJoin_input" name="birth"
                                id="birth">
                        </div>
                        <div style="width: 400px;">
                            <p style="margin-bottom: 10px;">성별</p>
                            <label class="memberJoin_gender_label">
                                <input type="radio" name="gender" value="1" id="male" checked="checked">
                                <span>남자</span>
                            </label>
                            <label class="memberJoin_gender_label">
                                <input type="radio" name="gender" value="0" id="female">
                                <span>여자</span>
                            </label>
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
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript">
	
    //validate 유효성 검사
    $("#joinForm").validate({
        rules:{
            name:{required: true, maxlength: 6},
            nickName:{required: true, maxlength: 6},
            id:{required: true, rangelength:[5, 10], eng_number:true},
            email:{required: true, email:true},
            password:{required: true, rangelength:[5, 10], eng_number:true},
            password_check:{required: true, equalTo:"#password"},
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
            password_check:{
                required:"필수 입력 사항입니다.",
                equalTo:"입력하신 비밀번호와 일치하지 않습니다."
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
        
        //아이디 중복검사
        $("#id").blur(function() {
            var user_id = $("#id").val();
            $.ajax({
                url:'${pageContext.request.contextPath}/member/memberIdCheck?id='+id,
                type:'get',
                success: function(data) {
                    if (data==0) {
                        //사용중인 아이디라고 화면에 뜨게하기
                        $("#mj_showIdChk").text("중복되는 아이디입니다.");
						$("#mj_showIdChk").css("color", "red");
                    } else {
                        //사용 가능한 아이디라고 화면에 뜨게하기
                        $("#mj_showIdChk").text("사용가능한 아이디입니다.");
						$("#mj_showIdChk").css("color", "#27b06e");
                    }
                },
                error: function() {
						console.log("연결 실패");
				}
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