<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 정보 수정 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
</head>
<body>
	 <div class="mp_box mp_box_all">
		<form action="./marketPage" id="mp_update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${marketVO.num}">
			<div class="mp_infoMod_box">
				<p>상점명</p>
				<input type="text" name="marketName" class="mp_infoMod_input" value="${marketVO.marketName}">
			</div>
			<div class="mp_infoMod_box">
				<p>운영시간</p>
                <div>오픈:</div>
				<input type="text" name="openTime" id="openTime" class="mp_infoMod_input" value="${marketVO.openTime}">
                <div style="margin-top: 5px;">마감:</div>
                <input type="text" name="closeTime" id="closeTime" class="mp_infoMod_input" value="${marketVO.closeTime}">
			</div>
			<div class="mp_infoMod_box">
				<p>트럭 설명</p>
				<input type="text" name="marketIntro" id="marketIntro" class="mp_infoMod_input" value="${marketVO.marketIntro}">
			</div>
			<div class="mp_infoMod_box">
				<p>트럭 메인 이미지 첨부</p>
				<input type="file" name="files" id="thumbImg" class="mp_infoMod_input" value="${marketVO.thumbImg}">
			</div>
			<div class="mp_infoMod_box">
				<button type="submit">수정하기</button>
			</div>
		</form>
		<!-- 푸드트럭 탈퇴하기 추가 -->
    </div>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<!--     <script type="text/javascript" src="jquery.validate.js"></script> -->
    <script type="text/javascript">
        
        //validate 유효성 검사
        $("#mp_update").validate({
            rules:{
                marketName:{required: true},
                openTime:{required: true},
                closeTime:{required: true},
                marketIntro:{required: true},
                THUMBIMG:{required: true}
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
                THUMBIMG:{
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