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
						<div style="display : none;" class="orderNumDiv" title="${orderedVO.num}"></div>
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
						<!-- 함수 적용해야함 -->
						<dt>연락처</dt>
						<dd id="memberPhone" title="${sessionScope.memberVO.phone}"></dd>
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
					<input type="radio" class="payment" title="card" name="payment" checked="checked">
					카드 결제
				</label> <label for="agree">
					<input type="radio" class="payment" title="cash" name="payment">
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

		//개인정보 수집동의 체크안하면 결제하기X
		$(".op_finalPay").click(function () {
			if ( $("#agreePay").is(":checked") == false ) {
				alert('개인정보 수집·이용에 동의해주세요!');
				preventDefault();
			}
		});

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
		// 유저 핸드폰 번호
		var memberPhone = phoneFomatter($('#memberPhone').prop("title"));
		
		// 핸드폰 번호 파싱해서 '-' 붙이기
		function phoneFomatter(num,type){
			
			var formatNum = '';
		
			if(num.length==11){
	
	        	if(type==0){
	            	formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
	        	}else{
	            	formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		        }
		
			}else if(num.length==8){
				formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
		    }else{
		        if(num.indexOf('02')==0){
	    	        if(type==0){
	     	           formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
		            }else{
		                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
		            }
	        	}else{
		            if(type==0){
		                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
		            }else{
		                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
		            }
		        }
		    }
	
	   		return formatNum;
	   	
	   		/* phoneFomatter('01000000000');   //010-0000-0000
	   		phoneFomatter('01000000000',0); //010-****-0000
	   		phoneFomatter('0100000000');    //010-000-0000
	   		phoneFomatter('0100000000',0);  //010-***-0000
	   		phoneFomatter('0200000000');    //02-0000-0000
	   		phoneFomatter('0200000000',0);  //02-****-0000
	   		phoneFomatter('0310000000');    //031-000-0000
	   		phoneFomatter('0310000000',0);  //031-***-0000
	   		phoneFomatter('16880000');      //1688-0000 */
		}
		
		// 주문자 연락처 phoneForm 적용
		$('#memberPhone').text(memberPhone);
		
		// 결제 post
		function paymentAjax(data) {
			
			// 결제 관련 post 요청
			$.ajax({
				url:"./orderDone",
				type:"post",
				data: data,
				success:function(result){
					if(result > 0) {
						alert("결제 완료");
						location.href = "./orderDone";
					} else {
						alert("결제에 실패하였습니다");
						location.href="./orderPage?memberNum=${sessionScope.memberVO.num}";
					}
				}
			});
		}
		
		// 결제
		function payment() {
			
		    var IMP = window.IMP; // 생략가능
		    IMP.init(`${iamport_id}`); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		    var msg;
		    var data;
			var orderedNum = [];
				
			// orderNum
			$(".orderNumDiv").each(function() {
				orderedNum.push($(this).prop("title"));			
			});
				
			orderedNum.push("null");
				
		    // 결제 방법
		    var pay_method;
		    $('.payment').each(function() {
		   	
		      	if($(this).attr("checked") == "checked")
		      		pay_method = $(this).prop("title");
		        	
		       	console.log(pay_method);
		    });
		        
		    // 결제 방법이 card라면 결제창, cash라면 주문완료
		    if(pay_method == 'card') {
		    	IMP.request_pay({
			        pg : 'html5_inicis',
			        merchant_uid : 'Fusulan_Truck_' + new Date().getTime(),
			        amount : ${totalAmount},	// 최소 100원이상(이니시스 기준)
			     	buyer_name : `${sessionScope.memberVO.name}`,
			      	buyer_tel : memberPhone,
			    }, function(rsp) {
			      	console.log(rsp);
			        if ( rsp.success ) {
			            
			            var data = {
			                		
			              	imp_uid : rsp.imp_uid,
			               	merchant_uid : rsp.merchant_uid,
			               	pg : 'inicis',
			               	pay_method : 'card',
			               	apply_num : rsp.apply_num,
			               	orderedNum : orderedNum
			            };
			            
			            paymentAjax(data);
			            
			        } else {
			            var msg = '결제에 실패하였습니다.';
		                alert(msg);
		                location.href="./orderPage?memberNum=${sessionScope.memberVO.num}";
		            }
			    });
		   	} else {
		   		
				var data = { 
			    	pay_method : 'cash',
			    	orderedNum : orderedNum
			    };
				
				paymentAjax(data)
		   	}
		}

		function main() {
		
			$('.op_finalPay').click(function() {
				
				payment();
			});
		}
		
		main();
		
	</script>
