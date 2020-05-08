<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="./menuUpdate" method="post">
		<h2>menuUpdate</h2>
    	<input type="hidden" id="num" name="num" value="${vo.num}">
		<div>
			<label for="name">Name:</label> 
			<input type="text"  id="name" name="name" value="${vo.name}">
		</div>
		<div>
			<label for="price">Price:</label> 
			<input type="text"  id="price" name="price" value="${vo.price}">
		</div>
		<div>
			<label for="detail">Detail:</label> 
			<input type="text" id="detail" name="detail" value="${vo.detail}">
		</div> 
			<!-- <input type="hidden" id="thumbImg" name="thumbImg" value="${vo.thumbImg}"> -->
		<div>
			<label for="file">File:</label>
			<input type="file"  id="file" name="files" value="${vo.thumbImg}">
		</div>

		<button type="submit">수정</button>
	</form>
</body>
</html>