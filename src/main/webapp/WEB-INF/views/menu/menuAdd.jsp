<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Add</title>
</head>
<body style="margin-top: 61px;">
	<%@ include file="../templates/header.jsp"%>
	<form action="./menuAdd" method="post" enctype="multipart/form-data" name="menuAdd">
		<h1>menuAdd</h1>
		<div>
			<label for="title">메뉴명 : </label> 
			<input type="text" id="title" name="name">
		</div>
		<div>
			<label for="title">가격 : 
			</label> <input type="text" id="price" name="price">
		</div>
		<div>
			<label for="title">상세 : </label> 
			<input type="text" id="detail" name="detail">
		</div>
		<div>
			<h3>카테고리 추가</h3>
			카테고리명:<input type="text" id="input">
			<button id="addCategory" type="button">카테고리 생성</button>
			<div id="box1"></div>
			<div id="box2"></div>
		</div>
		<div>
			<label for="title">메뉴 이미지: </label> <input type="file" id="thumbImg"
				name="files">
		</div>
		<div>
			<label for="title">메뉴 이미지: </label> <input type="file" id="thumbImg"
				name="files">
		</div>
		<div>
			<button type="button" id="submit">확인</button>
		</div>
	</form>

</body>
<%@ include file="../templates/footer.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	//카테고리, 옵션 html 추가
	$("#addCategory")
			.click(
					function() {

						var test = $("#input").val();
						var addCategory = '<div><span class="category">'+ test + '</span>'
						+'<button id="addOption" type="button">옵션추가</button></div>';
						var addOption = '옵션명: <input type="text">가격: <input type="text"><br>';

						//카테고리 생성 버튼이 눌리면 카테고리 이름 추가
						$("#box1").append(addCategory);
						
						//옵션추가 버튼이 눌리면 옵션 추가
						$("#addOption").click(function() {
							$("#box1").append(addOption);
						});
					})
					
	$("#submit").click(function() {
		//categoryDB에 삽입
			
			var array = [];
			var array2 = [];
			
			$(".category").each(function(i) {
				array.push($(this).text());
			})
			
			$(".category").each(function(i) {
				array2.push($(this).text());
			})
			
			var objParams = {
				"array"	: array
			};

			console.log(array);
			
			 $.ajax({
				url: "./menuAdd",
				type: "post",
				data: objParams,
				traditional: true,
				success: function() {
					console.log('성공');
				} ,
				error: function() {
					console.log('실패');
				}
			});
	});
					
	
	
</script>
</html>