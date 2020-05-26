<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

.mp_box_all {
	margin-left: 50px;
}

.mp_div {
	padding: 30px;
}

.mp_myRecord {
	margin: 0 20%;
	padding: 16px;
	border: 3px solid #f4f5f6;
	display: flex;
	justify-content: flex-start;
}

.mp_myRecord span {
	font-size: 13px;
	color: #6f7174;
}

.mp_myPic {
	width: 52px;
	height: 52px;
	padding: 10px;
}

.mp_myProfile {
	width: 648px;
	padding: 16px 0;
}

.mp_myRecords {
	width: 160px;
	padding: 10px 0;
	text-align: center;
	border-left: 1px solid #e9ebef;
}

.mp_myRecords em {
	margin-top: 6px;
	font-size: 28px;
	font-weight: 400;
	font-style: normal;
	color: #27b06e;
}

.mp_myContainer {
	display: flex;
	margin: 30px 20%;
}

.mp_myContainer h2 {
	margin: 0px;
	font-size: 22px;
	font-weight: 500;
}

.mp_myContainer ul {
	margin: 12px 0 0 0;
	padding: 0;
	width: 184px;
	font-size: 14px;
	list-style: none;
	border-top: 1px solid #e9ebef;
}

.mp_myContainer li a {
	text-decoration: none;
	color: #6f7174;
	display: block;
	padding: 16px 0;
	border-bottom: 1px solid #e9ebef;
}

.mp_myContainer2 {
	width: 100%;
}

.mp_article {
	margin-left: 70px;
}

.mp_infoMod_box {
	padding: 5px;
}

.mp_infoMod_box input {
	margin-left: 5px;
	margin-top: 5px;
	font-family: 'Noto Sans KR', sans-serif;
}

.mp_infoMod_box button {
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

.mp_infoMod_input {
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

.mp_infoMod_input_file {
	box-sizing: border-box;
	height: 38px;
	width: 50%;
	border: 1px solid #e7e7e7;
	font-size: 15px;
	display: block;
}

.error {
	color: #16633e;
	padding-left: 5px;
}

input[type="file" i] {
	padding: 6px 0 0 6px;
}

.mp_infoMod_box p {
	margin-top: 0;
}

.mp_delPic {
	margin: 0 10px;
	line-height: 44px;
	padding: 0 5px;
	cursor: pointer;
}

.mp_filep{
	margin-top: 0px;
	margin-left: 5px;
    width: 47%;
    font-family: 'Noto Sans KR', sans-serif;
    box-sizing: border-box;
    padding: 0 15px;
    height: 38px;
    border: 1px solid #e7e7e7;
    font-size: 15px;
    color: #3d3d3d;
    display: block;
}

#oldfile{
	display: block;
}

#newfile{
	margin-bottom: 0;
}

.ma_fileDel{
    line-height: 46px;
    padding: 0 15px;
}
</style>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="mp_box mp_box_all">
	<form action="../market/marketPage" id="mp_update" method="post" enctype="multipart/form-data">
		<h2>마켓정보 수정</h2>
		<input type="hidden" name="num" value="${marketVO.num}">
		<div class="mp_infoMod_box" style="margin-top: 12px">
			<p>상점명</p>
			<input type="text" name="marketName" class="mp_infoMod_input"
				value="${marketVO.marketName}">
		</div>
		<div class="mp_infoMod_box">
			<p>운영시간</p>
			<div>오픈:</div>
			<input type="text" name="openTime" id="openTime"
				class="mp_infoMod_input" value="${marketVO.openTime}">
			<div style="margin-top: 5px;">마감:</div>
			<input type="text" name="closeTime" id="closeTime"
				class="mp_infoMod_input" value="${marketVO.closeTime}">
		</div>
		<div class="mp_infoMod_box">
			<p>트럭 설명</p>
			<input type="text" name="marketIntro" id="marketIntro"
				class="mp_infoMod_input" value="${marketVO.marketIntro}">
		</div>


		<div class="mp_infoMod_box">
			<div style="display: flex;">
				<!-- 새로 첨부할 이미지 -->
				<input type="text" class="mp_infoMod_input mp_filep" id="file" name="thumbImg" value="${marketVO.thumbImg}">
				<span id="ma_fileDel">✖</span>
			</div>
		</div>


		<div class="mp_infoMod_box">
			<button id="market-modify" type="submit" style="font-weight: 600;">수정하기</button>
		</div>
	</form>
	<!-- 푸드트럭 탈퇴하기 추가 -->
	<div class="mp_infoMod_box">
		<button id="secession-truck" type="button" 
		style="margin: 0; background-color: #fbbc04; color: #000; font-weight: 600;">푸드트럭 탈퇴</button>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
	
	$("#ma_fileDel").click(function() {
		$("#file").prop("type","file");
		$("#file").prop("name","files");
	});


	//기존이미지 삭제하면 새로운 이미 선택 가능(toggle)
	//name을 바꾸기...
	$('.mp_delPic').click(function() {
		$("#oldfile").toggle();
		$("#newfile").toggle();

		if ( $("#oldfile").css("display") == 'block' ) {
			$("#oldfile").attr("name","files");
			$("#newfile").attr("name","notfiles");
		} else if ( $("#oldfile").css("display") == 'none' ) {
			$("#newfile").attr("name","files");
			$("#oldfile").attr("name","notfiles");
		}
		
		console.log( 'oldfiles:'+ $("#oldfile").css("display"), $("#oldfile").attr("name") );
		console.log( 'newfiles:'+ $("#newfile").css("display"), $("#newfile").attr("name") );
		
	});
	
	//푸드트럭 탈퇴하기
	$('#secession-truck').click(function() {
		if(confirm("푸드트럭을 탈퇴하시겠습니까?") == true){
	        alert("탈퇴되었습니다!");
			location.href = "./marketDelete"
	    }
	});
	
	//validate 유효성 검사
	$("#mp_update").validate({
		rules : {
			marketName : {
				required : true
			},
			openTime : {
				required : true
			},
			closeTime : {
				required : true
			},
			marketIntro : {
				required : true
			},
			THUMBIMG : {
				required : true
			}
		},
		messages : {
			marketName : {
				required : "필수 입력 사항입니다."
			},
			crn : {
				required : "필수 입력 사항입니다."
			},
			openTime : {
				required : "필수 입력 사항입니다."
			},
			closeTime : {
				required : "필수 입력 사항입니다."
			},
			marketIntro : {
				required : "필수 입력 사항입니다."
			},
			THUMBIMG : {
				required : "필수 입력 사항입니다."
			}
		}
	});

	$(function() {
		//상점명 중복검사
		$("#marketName").blur(
			function() {
				var user_id = $("#marketName").val();
				$.ajax({
					url : '${pageContext.request.contextPath}/member/memberIdCheck?marketName='
												+ marketName,
					type : 'get',
										success : function(data) {
											if (data == 0) {
												//사용중인 아이디라고 화면에 뜨게하기
												$("#mj_showMnChk").text(
														"중복되는 상점명입니다.");
												$("#mj_showMnChk").css("color",
														"red");
											} else {
												//사용 가능한 아이디라고 화면에 뜨게하기
												$("#mj_showMnChk").text(
														"사용가능한 상점명입니다.");
												$("#mj_showMnChk").css("color",
														"#27b06e");
											}
										},
										error : function() {
											console.log("연결 실패");
										}
									});
						});
	});
</script>
