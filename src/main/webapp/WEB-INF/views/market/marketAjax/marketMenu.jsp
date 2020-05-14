<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<ul>
	<c:forEach items="${menuList}" var="vo">
		<a href="${pageContext.request.contextPath}/menu/menuSelect?num=${vo.num}">
			<li>
				<img src="${pageContext.request.contextPath}/resources/img/food.jpg">
				<strong>${vo.name}</strong> 
				<em>${vo.detail}</em>
			</li>
		</a>
	</c:forEach>
</ul>   