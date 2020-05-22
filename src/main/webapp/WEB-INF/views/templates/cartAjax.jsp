<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
				<article class="cart">
					<header class="cart-header">
						<nav class="ch-nav" id="m_close">
							<button>✖</button>
						</nav>
						<h2>장바구니</h2>
					</header>
					<div class="cart-div1">
						<span>프코스팟배송 | 무료배송</span>
					</div>
					<div class="cart-div2">
						<div class="cart-selectAll">
							<label></label>
							<nav>
								<button class="btn-delAll">
									<span>전체 삭제</span>
								</button>
							</nav>
						</div>
						<hr>
						<div class="cart-index">
							<ul class="cart-items">
								<c:forEach var="orderedVO" items="${orderedList}">
									<li class="cart-item">
										<!-- div가 반복 -->
										<div class="cart-item-body">
											<div class="cart-row1">
											<img alt=""	src="${pageContext.request.contextPath}/resources/upload/menu/${orderedVO.menuThumbImg}">
												<div class="cart-col">
													<div style="display: flex; justify-content: space-between;">
														<strong>${orderedVO.marketName} ${orderedVO.menuName}</strong> 
														<span class="btn-select-delete" style="cursor: pointer; padding: 0 10px;" title="${orderedVO.num}">✖</span>
													</div>
													<span>${orderedVO.cateMenuOptions}</span>
												</div>
											</div>
											<div class="cart-row2">
												<div>수량 ${orderedVO.pcs}개 </div>
												<div> / 가격 </div><div class="amount"> ${orderedVO.amount}</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<nav class="cart-nav">
						<div class="cart-result">
							<hr>
							<div class="cart-result-body">
								<dl class="cart-dl">
									<dt>총 주문 갯수</dt>
									<dd>${cartSize}개</dd>
								</dl>
								<dl class="cart-dl">
									<dt>총 상품 금액</dt>
									<dd id="totalAmount">${totalAmount}</dd>
								</dl>
							</div>
							<div class="nav-button">
								<button class="nav-more">상품 더 담기</button>
								<button class="nav-order">주문하기</button>
							</div>
						</div>
					</nav>
				</article>
				
				
<script type="text/javascript">
		
		// 천단위로 숫자에 콤마 찍기
		function moneyFormat(money) {
			return money.toLocaleString();
		}
		
		var totalAmount = $("#totalAmount").text()*1;
		totalAmount = moneyFormat(totalAmount);
		$("#totalAmount").text(totalAmount+"원");
		
		
		$(".amount").each(function() {
			var amount = $(this).text()*1;
			amount = moneyFormat(amount);
			$(this).text(amount+"원");
		});
		
		
	
	
		$(".btn-select-delete").each(function() {
			$(this).click(function(){
				alert($(this).attr("title"));
				var num = $(this).attr("title");
				$.get("${pageContext.request.contextPath}/ordered/cartDeleteSelect?num="+num,function(result){
					$(".cart-body").html(result);
													
				});
			});
		});
														
	</script>