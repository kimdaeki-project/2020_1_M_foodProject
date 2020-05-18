<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.mp_select{
	box-sizing: border-box;
    padding: 0 10px;
    height: 38px;
    width: 50%;
    margin-bottom: 15px;
    border: 1px solid #e7e7e7;
    font-size: 15px;
    color: #3d3d3d;
    display: block;
}
</style>
</head>
<body>
	<div class="mp_box mp_box_all" style="margin-left: 50px">
		<form action="../market/marketJoin" method="post" enctype="multipart/form-data" id="mj_join">
		<h2>회원정보 수정</h2>
			<div class="mp_infoMod_box">
				<p style="margin-top: 12px">상점명</p>
				<input type="text" name="marketName" id="marketName" class="mp_infoMod_input">
			</div>
            <div class="mj_showMnChk" id="mj_showMnChk"></div>
			<div class="mp_infoMod_box">
				<p>사업자번호</p>
				<input type="text" name="crn" id="crn" class="mp_infoMod_input">
			</div>
            <div class="mj_showIdChk" id="mj_showIdChk"></div>
			<div class="mp_infoMod_box">
                <p>운영시간</p>
                <div>오픈:</div>
                <input type="text" name="openTime" id="openTime" class="mp_infoMod_input">
                <div style="margin-top: 5px;">마감:</div>
				<input type="text" name="closeTime" id="closeTime" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>트럭 설명</p>
				<input type="text" name="marketIntro" id="marketIntro" class="mp_infoMod_input">
			</div>
			<div class="mp_infoMod_box">
				<p>분류</p>
				<select name="categoryNum" class="mp_select">
					<option value="0" selected="selected">한식</option>
					<option value="1">분식</option>
					<option value="2">양식</option>
					<option value="3">일식</option>
					<option value="4">중식</option>
				</select>
			</div>
			<div class="mp_infoMod_box">
				<p>트럭 메인 이미지 첨부</p>
				<input type="file" name="files" id="files" class="mp_infoMod_input_file" style="margin-bottom: 15px;">
			</div>
			
			
			<div class="mp_infoMod_box">
				<button type="submit">신청하기</button>
			</div>
		</form>
    </div>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
    <script type="text/javascript">
        
        //validate 유효성 검사
        $("#mj_join").validate({
            rules:{
                marketName:{required: true},
                crn:{required: true},
                openTime:{required: true},
                closeTime:{required: true},
                marketIntro:{required: true},
                files:{required: true}
            },
            messages:{
                marketName:{
                    required:"필수 입력 사항입니다."
                    },
                crn:{
                    required:"필수 입력 사항입니다."
                },
                openTime:{
                    required:"필수 입력 사항입니다."
                },
                closeTime:{
                    required:"필수 입력 사항입니다."
                },
                marketIntro:{
                    required:"필수 입력 사항입니다."
                },
                files:{
                    required:"필수 입력 사항입니다."
                }
            }
        });
    
    
        $(function() {
            
            //상점명 중복검사
            $("#marketName").blur(function() {
                var user_id = $("#marketName").val();
                $.ajax({
                    url:'${pageContext.request.contextPath}/member/memberIdCheck?marketName='+marketName,
                    type:'get',
                    success: function(data) {
                        if (data==0) {
                            //사용중인 아이디라고 화면에 뜨게하기
                            $("#mj_showMnChk").text("중복되는 상점명입니다.");
                            $("#mj_showMnChk").css("color", "red");
                        } else {
                            //사용 가능한 아이디라고 화면에 뜨게하기
                            $("#mj_showMnChk").text("사용가능한 상점명입니다.");
                            $("#mj_showMnChk").css("color", "#27b06e");
                        }
                    },
                    error: function() {
                            console.log("연결 실패");
                    }
                });
            });
            
        });
    </script>
</body>
</html>