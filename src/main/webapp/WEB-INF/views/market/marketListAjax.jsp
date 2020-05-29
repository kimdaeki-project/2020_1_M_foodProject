<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<ul class="ml_container2_ul">
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
			</ul>
			
			
			<div class="nav-paginate-wrap__desktop" style="margin: 0 auto;">
				<nav class="nav-paginate">
					<c:if test="${pager.curBlock gt 1}">
						<a id="btn-pre" title="./marketListAjax?curPage=${pager.startNum-1}&address=${sessionScope.memberVO.address}&kind=" class="nav-paginate__dir nav-paginate-dir-prev" style="cursor: pointer;"></a>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<a class="nav_pagerA btn_page" style="cursor: pointer;">${i}</a>
					</c:forEach>
							
					<c:if test="${pager.curBlock lt pager.totalBlock}">
						<a id="btn-next" title="./marketListAjax?curPage=${pager.lastNum+1}&address=${sessionScope.memberVO.address}&kind=" class="nav-paginate__dir nav-paginate-dir-next" style="cursor: pointer;">
							<i></i>
						</a>
					</c:if>
							
				</nav>
			</div>

<script>
	

	$(".btn_page").each(function() {
		if($(this).text() == ${pager.curPage}){
			$(this).addClass("on");
		}
	});
	
	
	$(".btn_page").click(function() {
		$(".btn_page").each(function() {
			$(this).removeClass("on");
		})
		$(this).addClass("on");
	});

	
	var kind;

	$(".kind").click(function() {
		$(this).each(function() {
			if($(this).prop("checked")){
				kind = $(this).val();
				
				$.get("./marketListAjax?address=${sessionScope.memberVO.address}&kind="+kind,function(result){
					$("#pagerAjax").html(result);
				});
				
			}
		});
	});
	
	
	$(".btn_page").each(function() {
		$(this).click(function() {
			var curPage = $(this).text();
			
			$.get("./marketListAjax?curPage="+curPage+"&address=${sessionScope.memberVO.address}&kind="+kind,function(result){
				$("#pagerAjax").html(result);
			});
		});
	});
								
	
	$("#btn-pre").click(function() {
		alert($(this).attr("title"));
		var url = $(this).attr("title");
	
		$.get(url+kind, function(result) {
			$("#pagerAjax").html(result);
		});
	})
	
	$("#btn-next").click(function() {
		alert($(this).attr("title"));
		var url = $(this).attr("title");
		
		$.get(url+kind, function(result) {
			$("#pagerAjax").html(result);
		});
	})
</script>
