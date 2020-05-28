<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

.mp_div{
	padding: 30px;
}

.mp_myRecord{
	margin: 0 20%;
	padding: 16px;
	border: 3px solid #f4f5f6;
	display: flex;
	justify-content: flex-start;
}

.mp_myRecord span{
	font-size: 13px;
	color: #6f7174;	
}

.mp_myPic{
	width: 52px;
	height: 52px;
	padding: 10px;
}

.mp_myProfile{
	width: 648px;
	padding: 16px 0;
}

.mp_myRecords{
	width: 160px;
	padding: 10px 0;
	text-align: center;
	border-left: 1px solid #e9ebef;
}

.mp_myRecords em{
	margin-top: 6px;
	font-size: 28px;
	font-weight: 400;
	font-style: normal;
	color: #27b06e;
}

.mp_myContainer{
	display: flex;
	margin: 30px 20%;
}

.mp_myContainer h2{
	margin: 0px;
    font-size: 22px;
    font-weight: 500;
}

.mp_myContainer ul{
	margin: 12px 0 0 0;
	padding: 0;
	width: 184px;
	font-size: 14px;
    list-style: none;
	border-top: 1px solid #e9ebef;
}

.mp_myContainer li a{
	text-decoration: none;
    color: #6f7174;
	display: block;
	padding: 16px 0;
	border-bottom: 1px solid #e9ebef;
}

.mp_myContainer2{
	width: 100%;
}

.mp_article{
	margin-left: 70px;
}

.mp_infoMod_box{
	padding: 5px;
}

.mp_infoMod_box input{
	margin-left: 5px;
	margin-top: 5px;
    font-family: 'Noto Sans KR', sans-serif;
}

.mp_infoMod_box button{
	display: block;
	border: none;
	height: 38px;
	width: 100%;
	cursor: pointer;
	text-align: center;
	font-size: 1rem;
	outline: none;
	margin-top: 8px;
	width: 50%;
	color: #ffffff;
	background-color: #27b06e;
	margin: 32px 0 0 0;
}

.mp_infoMod_input{
	box-sizing: border-box;
	padding: 0 15px;
	height: 38px;
	width: 50%;
	margin-bottom: 15px;
	border: 1px solid #e7e7e7;
	font-size: 15px;
	color: #3d3d3d;
	display: block;
}

.mp_infoMod_input_file{
    box-sizing: border-box;
    height: 38px;
    width: 50%;
	border: 1px solid #e7e7e7;
	font-size: 15px;
	display: block;
}

.error{
    color: #16633e;
    padding-left: 5px;
}

input[type="file" i]{
    padding: 6px 0 0 6px;
}

.mp_infoMod_box p{
    margin-top: 0;
}
</style>

	<div class="mp_box mp_box_all" style="margin-left: 50px">
		<form action="./memberUpdate" method="post" id="memberUpdate">
			<input type="hidden" name="id" value="${memberVO.id}">
			<h2>회원정보 수정</h2>
			<div class="mp_infoMod_box" style="margin-top: 12px">
				<p>닉네임</p>
				<input type="text" name="nickName" class="mp_infoMod_input" value="${memberVO.nickName}">
			</div>
			<div class="mp_infoMod_box">
				<p>이름</p>
				<input type="text" name="name" class="mp_infoMod_input" value="${memberVO.name}" >
			</div>
			<div class="mp_infoMod_box">
				<p>이메일</p>
				<input type="email" name="email" class="mp_infoMod_input" value="${memberVO.email}">
			</div>
			<div class="mp_infoMod_box">
				<p>비밀번호</p>
				<input type="password" id="password" name="password" class="mp_infoMod_input" value="${memberVO.password}">
				<input type="password" id="password_check" name="password_check" class="mp_infoMod_input" placeholder="비밀번호 재확인!">
			</div>
			<div class="mp_infoMod_box">
				<p>휴대폰 번호</p>
				<input type="text" name="phone" class="mp_infoMod_input" value="${memberVO.phone}">
			</div>
			<div class="mp_infoMod_box">
				<button type="submit" id="mu-submit">저장하기</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">	
	
    //validate 유효성 검사
    $("#memberUpdate").validate({
        rules:{
            name:{required: true, maxlength: 6},
            nickName:{required: true, maxlength: 6},
            email:{required: true, email:true},
            password:{required: true, rangelength:[5, 10], eng_number:true},
            password_check:{required: true, equalTo:"#password"},
            phone:{required: true, maxlength:11, digits: true}
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
            }
        }
    });
    
    
    $('#mu-submit').click(function() {
        if ($('.mp_infoMod_input').val() == '') {
        	console.log('없음');
        	preventDefault();
    	}
	});
    
	</script>

