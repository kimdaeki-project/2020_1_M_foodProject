<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/menu/menuAdd.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<title>Menu Add</title>
</head>
<body style="margin-top: 61px;">
	<form action="../menu/menuAdd" method="post" enctype="multipart/form-data" name="menuAdd" id="file_upload">
		<h2>메뉴 추가</h2>
		<div class="menuAdd_box">
			<label for="title">메뉴명 : </label> <input type="text" id="name"name="name" value="돼지갈비">  
		</div>
		<div class="menuAdd_box">
			<label for="price">가격 : </label> <input type="text" id="price"name="price" value="20000">
		</div>
		<div class="menuAdd_box">
			<label for="detail">상세 :</label> <input type="text" id="detail"	name="detail" value="갈비갈비">
		</div>
		<div class="menuAdd_box">
			카테고리명:<input type="text" id="input" value="카테고리명">
			<button id="addCategory" type="button">카테고리 생성</button>
			<div id="category_box"></div>
		</div>
		<div class="menuAdd_box">
			<label for="thumbImg">메뉴 이미지: </label> 
			<input type="file"id="thumbImg" name="file"></div>
		<div id="category_box"></div>
		<div class="menuAdd_box">
			<input type="button" id="btn-sub" value="확인"></div>
	</form>
</body>

<script type="text/javascript">

	//카테고리 이름 입력
	$("#addCategory").click(function() {
		if ($("#input").val() == '') {
			//placeholder수정하고 작동X
			$('#input').attr("placeholder", "카테고리명을 입력해주세요!");
			preventDefault();
		}
	});

	//카테고리, 옵션 html 추가
	var num = 0;
	var caIndex = [];
	var opIndex = [];

	$(function() {
		$("#addCategory").click(function () {
			caIndex.push(num);
							var test = $("#input").val();
							var c_name = '<div class="cb" title="'+num+'">'
									+ test
									+ '<input type="button" class="addO" value="옵션 추가"></div>';
							num++;
							$("#category_box").append(c_name);
							opIndex.push(0);
						});

		//옵션추가 버튼을 누르면 각 카테고리에 옵션추가
		$("#category_box").on('click', '.addO', function () {
			var index = $(this).parent().prop("title");
			
			var c_name = '<div class="opDiv"><input type="text" value="옵션명" id="opName'+index+opIndex[index]+'"><input type="text" value="500" id="opPrice'+index+opIndex[index]+'"><input type="button" class="delO" value="옵션 삭제"></div>';
			$(this).parent().append(c_name);
			opIndex[index]++;		
		});	//옵션삭제 버튼을 누르면 옵션삭제
		$("#category_box").on('click', '.delO', function() {
			$(this).parent().remove();
		});

	});
		
	$("#btn-sub").click(function() {
		
		event.preventDefault();
	//X누르면 파일 내용 삭제
	$("#ma_fileDel").click(function() {
		$(".thumbImg1").val("");
	});
	
	$("#ma_fileDel2").click(function() {
		$(".thumbImg2").val("");
	});

	//전송
	$("#submit").click(function() {

		var categorys = [];
		$('.cb').each(function() {
			caNum = $(this).prop("title");
			
			ep = opIndex[caNum];
			
			var options = [];
			
			for(i=0; i<ep; i++) {
				var opName = $("#opName"+caNum+i).val();
				var opPrice = $("#opPrice"+caNum+i).val();
				
				var option = {
						opName: opName,
						opPrice: opPrice				}

				options.push(option);
			}
			
			var categoryName = $(this).text();
			category = {
					categoryName: categoryName,
					options : options}

			categorys.push(category);
		});

		console.log(categorys);

		//ajax 전송
		var objParams = {
			categorys : categorys,
		};
		
		//폼 읽어오기
		var formData = new FormData($('#file_upload')[0]);
		formData.append("objParams",JSON.stringify(objParams));
		
		console.log(formData);

		
		$.ajax({
            url : "../menu/menuAdd",
            type : "POST",
            dataType : "json", // ajax 통신으로 받는 타입
			contentType: false,
			processData: false,
            data : formData,
            success : function(result) {

               console.log(result);
            }
         });
         
 
// 		$("#file_upload").submit();
	});

	//유효성 검사
	$("#manuAdd").validate({
        rules:{
            title:{required: true},
            price:{required: true, digits: true},
            opName:{required: true},
            opPrice:{required: true, digits: true}
        },
        messages:{
            title:{
                required:"필수 입력 사항입니다."
                },
           price:{
                required:"필수 입력 사항입니다.",
                digits:"숫자만 입력해주세요."
            },
           opName:{
                required:"필수 입력 사항"
                },
           opPrice:{
                required:"필수 입력 사항",
                digits:"숫자만 입력"
            }
        }
    });

</script>
</html>