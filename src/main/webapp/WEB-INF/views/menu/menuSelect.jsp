<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<tr>
		<td>${vo.name}</td>
		<td>${vo.price}</td>
		<td>${vo.detail}</td>
		<td>대표이미지${vo.thumbImg}</td>
	</tr>
	
	<button type="button" onclick="location.href='./menuUpdate?num=${vo.num}' ">메뉴 수정</button>
	<button type="button" onclick="location.href='./menuDelete?num=${vo.num}' ">메뉴 삭제</button>
</body>
</html>