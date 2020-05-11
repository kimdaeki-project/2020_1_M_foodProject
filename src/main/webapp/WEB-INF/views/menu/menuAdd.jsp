<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Add</title>
</head>
<body>
	
	<form action="./menuAdd" method="post" enctype="multipart/form-data">
			<h1>menuAdd</h1>
			<div>
				<label for="title">메뉴명 : </label> 
				<input type="text" id="title" name="name">
			</div>
			<div>
				<label for="title">가격 : </label> 
				<input type="text" id="price" name="price">
			</div>
			<div>
				<label for="title">상세 : </label> 
				<input type="text" id="detail" name="detail">
			</div>
			<div>
				<label for="title">메뉴 이미지: </label> 
				<input type="file" id="thumbImg" name="files">
			<div>
			<div>
				<label for="title">메뉴 이미지: </label> 
				<input type="file" id="thumbImg" name="files">
			</div>
			<div>
				카테고리명<input type="text">
				<button id="addCategory">카테고리 생성</button>
				<div class="categoryDiv">카테고리이름</div>
				<button>옵션추가</button>
				<div>옵션명 , 가격</div>
			</div>
			<div>
				<button type="submit">확인</button>
			</div>
		</form>
		
		<!-- 기본, 추가선택.. 카테고리 생성
			menuoption을  ajax로 불러오기 -->
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
		$("#addCategory").click(function() {
			console.log('click');
			$.get("./categoryDiv", function() {
				$('.mp_box').append(result);
			})
			
		})
</script>
</html>