<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
			
		<!-- 주문자 -->
		<div class="op_orderInfo">
			<div class="op_section">
				<!-- 주문자 정보 -->
				<div class="op_orderPerson">
					<h3>주문자 정보</h3>
					<dl class="op_op_dl">
						<dt>결제자</dt>
						<dd>${sessionScope.memberVO.name}</dd>
					</dl>
					<dl class="op_op_dl">
						<dt>이메일</dt>
						<dd>${sessionScope.memberVO.email}</dd>
					</dl>
					<dl class="op_op_dl">
						<dt>연락처</dt>
						<dd>${sessionScope.memberVO.phone}</dd>
					</dl>
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
		//========================
		// 콤마 찍기
		//========================
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
		
		//=========================
		// 결제 모듈 관련
		//=========================
		// 핸드폰 번호 파싱해서 '-' 붙이기
		function rebuildPhoneNum() {
			
			
		}
			
		// 결제
		function payment() {
				$(function(){
			
		        var IMP = window.IMP; // 생략가능
		        IMP.init(`imp87607408`); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        var msg;
		        
		        IMP.request_pay({
		            //pg : 'kakaopay',
		            //pay_method : 'card',
		            pg : 'html5_inicis',
		            merchant_uid : 'Fusulan_Truck_' + new Date().getTime(),
		            name : '결제테스트',
		        	amount : 1,	// 최소 100원이상(이니시스 기준)
		        	buyer_email : 'iamport@siot.do',
		        	buyer_name : '구매자',
		        	buyer_tel : '010-1234-5678',
		        	buyer_addr : '서울특별시 강남구 삼성동',
		        	buyer_postcode : '123-456'
		        }, function(rsp) {
		        	//console.log(rsp);
		            if ( rsp.success ) {
		                var msg = '결제가 완료되었습니다.';
		                msg += '고유ID : ' + rsp.imp_uid;
		                msg += '상점 거래ID : ' + rsp.merchant_uid;
		                msg += '결제 금액 : ' + rsp.paid_amount;
		                msg += '카드 승인번호 : ' + rsp.apply_num;
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		            }
					
		            // return 받은 값들 백단으로 보내서 저장해야함 (get? post?)
		            
		            // redirect 마이페이지 페이지
		        });
		    });
		}
		
		function paymentTest() {
			
			var iamport_id = `${iamport_id}`;
			console.log(typeof iamport_id);
			console.log(iamport_id);
			
			console.log();	// name(주문 고유 넘버?)
			//amount : 1,	// 최소 100원이상(이니시스 기준)
        	//buyer_tel : // 구매자 핸드폰 '010-1234-5678', (필수값)
		}
		
		paymentTest();
	</script>
