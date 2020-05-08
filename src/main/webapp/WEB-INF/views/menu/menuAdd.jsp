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
			</div>
			<div>
				<button type="submit">확인</button>
			</div>
		</form>
		
</body>
</html>