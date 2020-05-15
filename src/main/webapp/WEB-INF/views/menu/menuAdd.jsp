<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/menu/menuAdd.css">
<title>Menu Add</title>
</head>
<body style="margin-top: 61px;">
	<form action="../menu/menuAdd" method="post" enctype="multipart/form-data" name="menuAdd" id="file_form">
		<h2>메뉴 추가</h2>
		<div class="menuAdd_box">
			<label for="title">메뉴명 : </label> <input type="text" id="name"name="name">
		</div>
		<div class="menuAdd_box">
			<label for="price">가격 : </label> <input type="text" id="price"name="price">
		</div>
		<div class="menuAdd_box">
			<label for="detail">상세 :</label> <input type="text" id="detail"	name="detail">
		</div>
		<div class="menuAdd_box">
			카테고리명:<input type="text" id="input">
			<button id="addCategory" type="button">카테고리 생성</button>
			<div id="category_box"></div>
		</div>
		<div class="menuAdd_box">
			<label for="thumbImg">메뉴 이미지: </label> 
			<input type="file"id="thumbImg" name="files">
		</div>
		<div class="menuAdd_box">
			<button type="button" id="submit">확인</button>
		</div>
	</form>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	//카테고리, 옵션 html 추가
	var num=0;
	var caIndex = [];
	var opIndex = [];
	
	$(function() {
		$("#addCategory").click(function() {
			caIndex.push(num);
			var test = $("#input").val();
			var c_name = '<div class="cb" title="'+num+'">'+test+'<input type="button" class="addO" value="옵션 추가"></div>';
			num++;
			$("#category_box").append(c_name);
			opIndex.push(0);
		});
			
		//옵션추가 버튼을 누르면 각 카테고리에 옵션추가
		$("#category_box").on('click', '.addO', function () {
			var index = $(this).parent().prop("title");
			
			var c_name = '<div class="opDiv"><input type="text" id="opName'+index+opIndex[index]+'"><input type="text" id="opPrice'+index+opIndex[index]+'"><input type="button" class="delO" value="옵션 삭제"></div>';
			$(this).parent().append(c_name);
			opIndex[index]++;		
		});		
			
		//옵션삭제 버튼을 누르면 옵션삭제
		$("#category_box").on('click', '.delO', function () {
			$(this).parent().remove();
		});		
			
	});
		
	$("#submit").click(function() {
		
		var categorys = [];
		$('.cb').each(function(){
			caNum = $(this).prop("title");
			//console.log("caNum : "+caNum);
			
			ep = opIndex[caNum];
			//console.log("ep : "+ep);
			
			var options = [];
			
			for(i=0; i<ep; i++) {
				var opName = $("#opName"+caNum+i).val();
				//console.log(opName);
				var opPrice = $("#opPrice"+caNum+i).val();
				//console.log(opPrice);
				
				var option = {
						opName: opName,
						opPrice: opPrice
				}
				
				options.push(option);
			}
			
			var categoryName = $(this).text();
			category = {
					categoryName: categoryName,
					options : options
			}
			
			categorys.push(category);
		});
		
		console.log(categorys);
		
		//ajax 전송
		var objParams = {
			categorys : categorys,
		};
		
		
		
		var form = $('#file_form')[0];
        var formData = new FormData(form);
        formData.append("name", $("#name")[0].files[0]);
        formData.append("price", $("#price")[0].files[0]);
        formData.append("detail", $("#detail")[0].files[0]);
        formData.append("files", $("#files")[0].files[0]);

		

		$.ajax({
			url : "../menu/menuAdd",
			type : "post",
			data : {objParams,formData},
			traditional : true,
			success : function() {
				console.log('성공');
			},
			error : function() {
				console.log('실패');
			}
		});
	});
</script>
</html>