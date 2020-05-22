<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif !important;
}

#file_upload {
	margin-left: 50px;
}

.menuAdd_box {
	padding: 5px;
}

.ma_body {
	margin-left: 50px;
}

.menuAdd_box input {
	box-sizing: border-box;
	padding: 0 15px;
	height: 38px;
	width: 50%;
	margin-top: 10px;
	margin-bottom: 15px;
	border: 1px solid #e7e7e7;
	font-size: 15px;
	color: #3d3d3d;
	display: block;
}

#submit {
	display: block;
	border: none;
	height: 38px;
	width: 100%;
	cursor: pointer;
	text-align: center;
	font-size: 15px;
	outline: none;
	margin-top: 8px;
	width: 50%;
	color: #ffffff;
	background-color: #27b06e;
}

input[type="file" i] {
	padding: 6px 0 0 6px;
	font-family: 'Noto Sans KR', sans-serif;
}

.category {
	font-size: 20px;
}

.c_box {
	display: flex;
	vertical-align: middle;
	margin: 0 auto;
}

#addOption {
	cursor: pointer;
	margin-left: 5px;
	display: block;
	border: transparent;
	outline: transparent;
	background-color: transparent;
}

#delOption {
	cursor: pointer;
	margin-left: 5px;
	display: block;
	border: transparent;
	outline: transparent;
	background-color: transparent;
}

#addCategory {
	display: block;
	border: none;
	height: 40px;
	cursor: pointer;
	text-align: center;
	font-size: 15px;
	outline: none;
	width: 30%;
	color: #ffffff;
	background-color: #27b06e;
	margin-left: 10px;
}

.menuAdd_box_cate {
	box-sizing: border-box;
	height: 38px;
	width: 50%;
	margin-top: 10px;
	margin-bottom: 15px;
	font-size: 15px;
	color: #3d3d3d;
	display: flex;
	padding: 5px;
	padding-right: 0px;
}

#input {
	height: 38px;
	width: 70%;
	border: 1px solid #e7e7e7;
	font-size: 15px;
	color: #3d3d3d;
	padding: 0 15px;
}

.delO {
	margin-left: 10px;
	height: 40px;
	cursor: pointer;
	text-align: center;
	font-size: 15px;
	border: none;
	color: #ffffff;
	background-color: #27b06e;
	width: 22%;
}

#category_box {
	display: block;
}

.opDiv {
	width: 50%;
	display: flex;
	padding: 5px;
}

.opName {
	width: 20%;
	height: 38px;
	border: 1px solid #e7e7e7;
	padding: 0 15px;
	color: #3d3d3d;
}

.opPrice {
	width: 20%;
	height: 38px;
	border: 1px solid #e7e7e7;
	padding: 0 15px;
	color: #3d3d3d;
	margin-left: 5px;
}

.addO {
	margin: 5px;
	cursor: pointer;
	text-align: center;
	border: none;
	color: #ffffff;
	background-color: #27b06e;
	padding: 5px;
	font-size: 145.px;
}

#thumbImg {
	width: 48%;
}

#ma_fileDel, #ma_fileDel2 {
	margin: 10px;
	line-height: 38px;
	padding: 0 5px;
	cursor: pointer;
}

.error {
	color: #008080;
	font-weight: bolder;
}

.opDiv>.error {
	line-height: 38px;
	padding: 0 5px 0 10px;
	overflow: hidden;
	height: 38px;
}

.add {
	display: initial;
	border: none;
	height: 30px;
	cursor: pointer;
	text-align: center;
	font-size: 15px;
	outline: none;
	width: 80px;
	color: #ffffff;
	background-color: #27b06e;
	margin-left: 10px;
}

.del{
	display: initial;
	border: none;
	height: 30px;
	cursor: pointer;
	text-align: center;
	font-size: 15px;
	outline: none;
	width: 110px;
	color: #ffffff;
	background-color: #fbbc04;
	margin-left: 10px;
}


#btn-sub {
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
</style>
</head>
<body style="margin-top: 61px;">

	<form action="../menu/menuAdd" method="post"
		enctype="multipart/form-data" name="menuAdd" id="fileUpload"
		class="file_upload" style="margin-left: 50px;">
		<h2>트럭메뉴 추가</h2>

		<div class="menuAdd_box" style="margin-top: 12px;">
			<label for="title">메뉴명 : </label> <input type="text" id="name"
				name="menu_name">
		</div>
		<div class="menuAdd_box">
			<label for="price">가격 : </label> <input type="number" id="price"
				name="menu_price">
		</div>
		<div class="menuAdd_box">
			<label for="detail">상세 :</label> <input type="text" id="detail"
				name="menu_detail">
		</div>

		<label>카테고리명 :</label>
		<div class="menuAdd_box_cate">
			<input type="text" id="input" name="name"> <input
				id="addCategory" type="button" value="카테고리 추가">
		</div>
		<div id="category_box"></div>


		<div class="menuAdd_box">
			<label for="thumbImg">메뉴 이미지: </label>
			<div style="display: flex;">
				<input type="file" id="thumbImg" name="files" class="thumbImg1"
					accept="image/jpeg,image/png,image/jpg"> <span
					id="ma_fileDel">✖</span>
			</div>
		</div>
		<label class="error" for="thumbImg" generated="true"
			style="display: none; padding-left: 5px;"></label>
		<div class="menuAdd_box">
			<button type="submit" id="btn-sub">확인</button>
		</div>
	</form>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript">
	var i = 0;

	//옵션추가 해놓고 아무것도 안적으면 submit안됨
	$("#btn-sub").click(function() {
		if ($(".opName").val() == '' && $(".opPrice").val() == '') {
			alert('옵션값을 입력해주세요!');
			event.preventDefault();
		}
	});

	//가격에 숫자만 입력
	$(".opPrice").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});

	//카테고리 추가 버튼 누르면 박스추가 (카테고리명이 안나옴)
	$("#addCategory")
			.click(
					function() {
						if ($("#input").val() == '') {
							//placeholder수정하고 작동X
							$('#input').attr("placeholder", "카테고리명을 입력해주세요!");
							preventDefault();
						}

						i++;
						var cateVal = $("#input").val();
						var c_name = '<div class="cb" title="1">'
								+ cateVal
								+ '<input type="button" class="add" value="옵션 추가" id="cateName'+i+'" name="cate_name_'+i+'" title="'+i+'">'
								+ '<input type="button" class="del" value="카테고리 삭제">'
								+ '</div>';
						var c_hidden = '<input type="hidden" value="'+cateVal+'" name="cate_name_'+i+'">';

						$("#category_box").append(c_name);
						$("#category_box").append(c_hidden);
					});

	//옵션추가 버튼을 누르면 각 카테고리에 옵션추가 (O)
	$("#category_box").on('click',".add",function() {

			var index = $(this).attr("title")
			var index2 = $(this).parent().attr("title");
			var c_name = '<div class="opDiv"><input name="op_name_'+index+'_'+ index2 +'" class="opName" placeholder="옵션 이름" type="text"><input name="op_price_'+index+'_'+ index2 +'" class="opPrice" type="number" placeholder="가격"><input type="button" class="delO" value="옵션 삭제"></div>';

			$(this).parent().append(c_name);
			$(this).parent().attr("title", ++index2);

		});

	//옵션삭제 버튼을 누르면 옵션삭제 (O)
	$("#category_box").on('click', '.delO', function() {
		$(this).parent().remove();
	});
	
	//카테고리 삭제 버튼 누르면 그 카테고리 박스 삭제
	$("#category_box").on('click', '.del', function() {
		$(this).parent().remove();
	});

	//X누르면 파일 내용 삭제
	$("#ma_fileDel").click(function() {
		$(".thumbImg1").val("");
	});

	$("#ma_fileDel2").click(function() {
		$(".thumbImg2").val("");
	});

	//전송
	// 	$("#btn-sub").click(function() {

	// 		var categorys = [];
	// 		$('.cb').each(function() {
	// 			caNum = $(this).prop("title");

	// 			ep = opIndex[caNum];

	// 			var options = [];

	// 			for(i=0; i<ep; i++) {
	// 				var opName = $("#opName"+caNum+i).val();
	// 				var opPrice = $("#opPrice"+caNum+i).val();

	// 				var option = {
	// 						opName: opName,
	// 						opPrice: opPrice				
	// 				}

	// 				options.push(option);
	// 			}

	// 			var categoryName = $(this).text();
	// 			category = {
	// 					categoryName: categoryName,
	// 					options : options}

	// 			categorys.push(category);
	// 		});

	// 		console.log(categorys);

	// 		//ajax 전송
	// 		var objParams = {
	// 			categorys : categorys,
	// 		};

	// 		//폼 읽어오기
	// 		var formData = new FormData($('#file_upload')[0]);
	// 		formData.append("objParams",JSON.stringify(objParams));

	// 		console.log(formData);

	// 		$.ajax({
	//             url : "../menu/menuAdd",
	//             type : "POST",
	//             dataType : "json", // ajax 통신으로 받는 타입
	// 			contentType: false,
	// 			processData: false,
	//             data : formData,
	//             success : function(result) {

	//                console.log(result);
	//             }
	//          });

	// 	});

	//유효성 검사
	$("#fileUpload").validate({
		rules : {
			menu_name : {
				required : true
			},
			menu_price : {
				required : true,
				digits : true
			},
			menu_detail : {
				required : true
			},
			files : {
				required : true
			}
		},
		messages : {
			menu_name : {
				required : "필수 입력 사항입니다."
			},
			menu_price : {
				required : "필수 입력 사항입니다.",
				digits : "숫자만 입력해주세요."
			},
			menu_detail : {
				required : "필수 입력 사항"
			},
			files : {
				required : "필수 입력 사항"
			}
		}
	});
</script>