<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

				<c:forEach items="${marketList}" var="vo">
					<li class="ml_container2_li">
						<a class="ml_container2_a" href="${pageContext.request.contextPath}/market/marketSelect?userNum=${vo.userNum}">
							<div class="wrap_img">
								<img class="ml_container2_img" alt="" src="${pageContext.request.contextPath}/resources/upload/market/${vo.thumbImg}">
								<div class="menuOpenInfo">
									<c:if test="${vo.canOrder eq 1 && vo.isOpen eq 1}">
										<em class="ml_container2_span_open">주문 가능!</em>
									</c:if>
									<c:if test="${vo.canOrder eq 0 || vo.isOpen eq 0}">
										<em class="ml_container2_span_open">주문 불가!</em>
									</c:if>
									<c:if test="${vo.isOpen eq 0}">
										<em class="ml_container2_span_open">CLOSE</em>
									</c:if>
									<c:if test="${vo.isOpen eq 1}">
										<em class="ml_container2_span_open">OPEN</em>
									</c:if>
								</div>
							</div>
							<strong class="ml_container2_strong">${vo.marketName}</strong>
							<span class="ml_container2_span">${vo.marketIntro}</span>
						</a>
					</li>
				</c:forEach>

			

