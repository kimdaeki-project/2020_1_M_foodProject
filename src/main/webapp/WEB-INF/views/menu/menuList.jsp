<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menuList</title>
</head>
<body>
	<table>
		<tr>
			<td>번호</td>
			<td>메뉴명</td>
			<td>가격</td>
			<td>상세설명</td>
			<td>대표이미지</td>
		</tr>
		<c:forEach items="${list}" var="vo" varStatus="i">
			<tr>
				<td>${vo.num}</td>
				<td id="id${i.index}">${vo.name}</td>
				<td>${vo.price}</td>
				<td>${vo.detail}</td>
				<td><a href="./menuSelect?num=${vo.num}">상세${vo.thumbImg}</a></td>
				<td><input type="checkbox" name="del" id="${vo.num}"
					title="id${i.index}" class="term"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>