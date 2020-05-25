<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<link rel="stylesheet" href="../resources/css/order/orderPage.css">
</head>
<body>
          	
	<%@ include file="../templates/header.jsp"%>
	<div class="op_body">
		<h2 class="op_body_name">주문/결제하기</h2>
		<!-- 주문내역테이블 -->
		<div class="op_mycart">
			<h3 class="op_mycart_h3">주문상품정보</h3>
			<table class="op_mycart_table">
				<thead>
					<tr class="op_table_tr">
						<th>수령시간</th>
						<th style="text-align: left;">주문상품</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<!-- tr반복 -->
					<c:forEach var="orderedVO" items="${orderedList}">
						<tr class="op_table_tr">
		            		<td>${orderedVO.timeLag}분</td>
							<td style="text-align: left;" class="op_td_item">
								<strong>${orderedVO.marketName}/${orderedVO.menuName}</strong> 
								<span>${orderedVO.cateMenuOptions}</span></td>
							<td>${orderedVO.pcs}</td>
							<td class="orderedVO_amount">${orderedVO.amount}</td>
						</tr>
	            	</c:forEach>
				</tbody>
			</table>
		</div>
		
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		
		<!-- 주문자 -->
		<div class="op_orderInfo">
			<div class="op_section">
				<!-- 주문자 정보 -->
				<div class="op_orderPerson">
					<h3>주문자 정보</h3>
					<dl class="op_op_dl">
						<dt>결제자</dt>
						<dd>이름</dd>
					</dl>
					<dl class="op_op_dl">
						<dt>이메일</dt>
						<dd>ex@example.com</dd>
					</dl>
					<dl class="op_op_dl">
						<dt>연락처</dt>
						<dd>01012345678</dd>
					</dl>
				</div>
				<!-- 수령자 정보 -->
				<div class="op_recePerson">
					<header class="op_rp_header">
						<h3>수령인 정보</h3>
						<label for="agree">
							<input type="checkbox" id="agree">
							주문자 정보와 같습니다
						</label>
					</header>
					<fieldset class="op_rp_field">
						<input type="text" placeholder="수령인 이름을 입력해주세요."> 
						<input type="text" placeholder="수령인 전화번호를 입력해주세요.">
					</fieldset>
				</div>
			</div>
		</div>

		<!-- 결제  -->
		<div class="op_payment">
			<!-- 결제수단 선택 -->
			<div class="op_paywhat">
				<h3>결제 수단</h3>
				<label for="agree">
					<input type="radio" id="here" name="payment" checked="checked">
					카드 결제
				</label> <label for="agree">
					<input type="radio" id="there" name="payment">
					현장 결제
				</label>
			</div>
			<!-- 카드결제시 선택하는 div -->
			<!-- 현장결제일때만 block -->
			<div class="op_payCard">
				<h3>주문서</h3>
				<div class="op_payRecep">
					<dl class="op_pr_dl">
						<dt>총 주문 갯수</dt>
						<dd>${cartSize}개</dd>
					</dl>
					<dl class="op_pr_dl">
						<dt>총 상품 금액</dt>
						<dd id="payTotelAmount"></dd>
					</dl>
					<div class="agreePay">
						<label for="agreePay">
							<input type="checkbox" id="agreePay">
							개인정보 수집·이용 동의 (필수)
						</label>
						<a href="#">내용보기</a>
					</div>
				</div>
				<button class="op_finalPay">결제하기</button>
			</div>
		</div>
	</div>
	<%@ include file="../templates/footer.jsp"%>

	<script type="text/javascript">
		// 천단위로 숫자에 콤마 찍기
		function moneyFormat(money) {
			return money.toLocaleString();
		}
		
		// 총 주문 금액에 콤마 찍기
		$('#payTotelAmount').text(moneyFormat(${totalAmount})+'원');
		
		// 각 주문의 금액에 콤마 찍기
		$('.orderedVO_amount').each(function() {
			
			// string to number
			var amount = $(this).text() * 1;
			$(this).text(moneyFormat(amount)+'원');
		});
		
		//주문자 정보와 같다고 하면 불러오기
		$("#agree").click(function () {
			$("#rp_name").val(이름);
			$("#rp_number").val(번호);
		});

		//결제 수단에 따라 결과 나뉨


		//개인정보 수집동의 체크안하면 결제하기X
		$(".op_finalPay").click(function () {
			if ( $("#agreePay").is(":checked") == false ) {
				alert('개인정보 수집·이용에 동의해주세요!');
				preventDefault();
			}
		});
			
			
		
	</script>
