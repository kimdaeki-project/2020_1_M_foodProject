<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<style type="text/css">
@charset "UTF-8";

.oap_item{
	display: table;
    width: 100%;
    min-height: 161px;
    padding: 23px 0 0 0;
    table-layout: fixed;
}

.oap_itemInfo{
	display: table-cell;
	display: flex;
}

.oap_ii_storePic{
	padding: 20px;
}

.oap_ii_storePic > img{
	width: 90px;
	height: 90px;	
}

.oap_items{
	display: block;
    text-decoration: none;
    cursor: pointer;
}

.oap_items > strong{
	width: 100%;
    overflow: hidden;
    color: #3d3d3d;
    font-size: 16px;
    white-space: nowrap;
    text-overflow: ellipsis;
    text-decoration: none;
    display: inherit;
}

.oap_items > em{
	margin: 8px 0px 12px;
    font-size: 14px;
    color: #8c8c8c;
    font-style: normal;
}

.oap_ii_info{
	margin-left: 10px;
	width: 100%;
}

.oap_ii_info > span{
	font-size: 14px;
	color: #8c8c8c;	
}

.oap_ii_info > p{
	margin: 0;
	margin-top: 10px;
    padding-top: 10px;
    color: #646465;
    line-height: 18px;
    border-top: 1px solid #f4f6f7;
    box-sizing: border-box;
    height: 100%;
    font-size: 14px;
}

.oap_storeInfo{
	display: table-cell;
	vertical-align: middle;
    width: 200px;
}

.oap_siDiv{
    color: #000;
    text-align: center;
}

.storename{
	overflow: hidden;
    max-width: 100%;
    white-space: nowrap;
    text-overflow: ellipsis;
    margin-bottom: 5px;
    display: block;
    text-overflow: ellipsis;
}

.storecrn{
	margin-bottom: 5px;
    color: #a5a5a5;
    font-size: 11px;
    display: block;
}

.storego{
	width: 55px;
    height: 20px;
    margin: 0 auto;
    color: #6f7174;
    font-size: 12px;
    line-height: 18px;
    text-decoration: none;
    border: 1px solid #dedede;
    display: block;
}

.oap_payInfo{
	display: table-cell;
	vertical-align: middle;
	width: 150px;
}

.oap_payInfo > div{
	width: 70%;
    color: #6f7174;
    font-size: 13px;
    line-height: 27px;
    text-decoration: none;
    text-align: center;
    border: 1px solid #dedede;
}

.orderConfirmBtn:hover {
	cursor:pointer;
}

.orderCancleBtn:hover {
	cursor:pointer;
}

.orderFinishBtn:hover {
	cursor:pointer;
}

hr{
	
}
</style>
<title>판매자 주문내역 페이지</title>
</head>
<body style="width: 100%">
	<div>
		<div style="margin-left: 50px;">
			<h2>마켓 주문 리스트</h2>
			<!-- 하단의 div가 반복 -->
			<c:forEach var="orderedVO" items="${orderedList}">
				<div class="oap_item" data-num="${orderedVO.num}">
					<!-- data div -->
					<div class="updateAt" style="display : none;" data-update="${orderedVO.updateAt}"></div>
					<div class="isOrderChecked" style="display : none;" data-num="${orderedVO.num}" data-check="${orderedVO.isOrderChecked}"></div>
					<!-- 아이템 정보 div -->
					<div class="oap_itemInfo">
						<a class="oap_ii_storePic">
							<img alt="상점사진" src="../resources/upload/menu/${orderedVO.menuThumbImg}">
						</a>
						<div class="oap_ii_info">
							<a class="oap_items">
								<strong>${orderedVO.menuName} (선택옵션 : ${orderedVO.cateMenuOptions})</strong>
								<em>수량 : ${orderedVO.pcs}개</em><br>
								<em>가격 : ${orderedVO.amount}원</em>
								<em>&nbsp;|&nbsp;</em>
								<em>주문일자 : ${orderedVO.createAt}</em><br>
								<em>주문번호 : ${orderedVO.num}</em> <br>
								<em class="orderConfirmTime" data-num="${orderedVO.num}">주문확인 시간 : -</em>
							</a>
						</div>
					</div>
					
					<!-- 상점 정보 div -->
					<div class="oap_storeInfo">
						<div class="oap_siDiv">
							<span class="storename">${orderedVO.memberVO.name}님</span>
							<span class="storecrn">${orderedVO.memberVO.id}</span>
							<span class="storecrn phone" data-phone="${orderedVO.memberVO.phone}"></span>
							<%-- <span class="storego">${orderedVO.num}</span> --%>
						</div>
					</div>
					
					<!-- 구매관련 정보 div -->
					<div class="oap_payInfo" data-num="${orderedVO.num}">
						<div class='orderConfirmBtn' data-num="${orderedVO.num}">확인하기</div>
						<div class='orderCancleBtn' style="margin-top: 10px;" data-num="${orderedVO.num}">취소하기</div>
					</div>
				</div>
				<hr class="hr" data-num="${orderedVO.num}">
			</c:forEach>
			<!-- 반복 끝 -->	
		</div>
	</div>
	
	<script type="text/javascript">
		
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
	
		// 전화번호 form 바꿔서 각 란에 넣어주기
		function showPhoneNums() {
			
			$('.phone').each(function() {
				var phone = $(this).data("phone");
				$(this).text(phoneFomatter(phone));
			});
		}
		
		// 시간 값 구하는 함수
		function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();
	
		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}
	
		function getTimeStamp() {
		  var d = new Date();
		  var s =
		    leadingZeros(d.getYear()-100, 2) + '-' +
		    leadingZeros(d.getMonth() + 1, 2) + '-' +
		    leadingZeros(d.getDate(), 2) + ' ' +
	
		    leadingZeros(d.getHours(), 2) + ':' +
		    leadingZeros(d.getMinutes(), 2) + ':' +
		    leadingZeros(d.getSeconds(), 2);
	
		  return s;
		}
		
		// 주문 시간 에 확인 시간 값 기입 (param = orderedVO.num)
		function setOrderConfirmTime(num) {
			
			var date = new Date();
			var time = getTimeStamp();
			var msg = '주문확인 시간 : ' + time;
			
			$('.orderConfirmTime').each(function() {
				if($(this).data("num") == num) {
					$(this).text(msg);
				}
			});
		}
		
		// 확인 버튼 삭제 (param = orderedVO.num)
		function deleteOrderConfirmBtn(num) {
			$('.orderConfirmBtn').each(function() {
				if($(this).data("num") == num) {
					$(this).remove();
				}
			});
		}
		
		// 취소 버튼 삭제 (param = orderedVO.num)
		function deleteOrderCancleBtn(num) {
			$('.orderCancleBtn').each(function() {
				if($(this).data("num") == num) {
					$(this).remove();
				}
			});
		}
		
		// 주문 완료 버튼 생성 (param = orderedVO.num)
		function createOrderFinishBtn(num) {
			$('.oap_payInfo').each(function() {
				if($(this).data("num") == num) {
					var html = "<div class='orderFinishBtn' data-num="+num+">판매완료</div>";
					$(this).append(html);
				}
				
				// 이벤트 위임
				$(this).on("click", ".orderFinishBtn", function() {
					
					console.log("finish");
					console.log("btn");
					
					var url = "${pageContext.request.contextPath}/ordered/orderFinish";
					var num = $(this).data("num");
					
					$.post(url, {num: num}, function(result){
						if(result > 0) {
							// 해당되는 div/hr 삭제
							deleteOrderDiv(num);
							deleteHr(num);
						}
					});
				});
			});	
		}
		
		// 주문 완료 버튼 삭제 (param = orderedVO.num)
		function deleteOrderFinishBtn(num) {
			$('.orderFinishBtn').each(function() {
				if($(this).data("num") == num) {
					$(this).remove();
				}
			});
		}
		
		// 주문 삭제
		function deleteOrderDiv(num) {
			$('.oap_item').each(function() {
				if($(this).data("num") == num) {
					$(this).remove();
				}
			});
		}
		
		// hr 삭제
		function deleteHr(num) {
			$('.hr').each(function() {
				if($(this).data("num") == num) {
					$(this).remove();
				}
			});
		}
		
		// 주문 확인 버튼 핸들러
		function orderConfirmBtnHandler() {
			$('.orderConfirmBtn').each(function(){
				
				$(this).click(function() {
					
					if(!confirm("주문을 받으시겠습니까?"))
						return;
					
					// oredered.num 만 인자로 보내면 됨
					var url = "${pageContext.request.contextPath}/ordered/orderConfirm";
					var num = $(this).data("num");
					
					$.post(url, {num: num}, function(result){
						if(result > 0) {
							
							// 주문 확인 시간 체크
							setOrderConfirmTime(num);
							
							// 확인 버튼 삭제
							deleteOrderConfirmBtn(num);
							
							// 취소 버튼 삭제
							deleteOrderCancleBtn(num);
							
							// 주문 완료 버튼 생성
							createOrderFinishBtn(num);
						}
					});
				});
			});
		}
		
		// 주문 취소 버튼 핸들러
		function orderCancleBtnHandler() {
			$('.orderCancleBtn').each(function(){
				
				$(this).click(function() {
					
					if(!confirm("정말 주문을 거절하시겠습니까?"))
						return;
					
					// cancleType cancleDetail num
					var url = "${pageContext.request.contextPath}/ordered/orderCancle";
					var num = $(this).data("num");
					var cancleType = 1;	// 마켓 요청 주문 취소 상태값
					var isOrderChecked = 2; // 주문 취소 상태값
					$.post(url, {num: num, cancleType: cancleType, isOrderChecked : isOrderChecked}, function(result){
						if(result > 0) {
							// 해당되는 div/hr 삭제
							deleteOrderDiv(num);
							deleteHr(num);
						}
					});
				});
			});
		}
		
		// 주문 완료 버튼 핸들러
		function orderFinishBtnHandler() {
			$('.orderFinishBtn').each(function(){
				
				console.log("finish");
				console.log("btn");
				if(!confirm("판매 완료"));
					return;
				
				$(this).click(function() {
					
					// cancleType cancleDetail num
					var url = "${pageContext.request.contextPath}/ordered/orderFinish";
					var num = $(this).data("num");
					
					$.post(url, {num: num}, function(result){
						if(result > 0) {
							// 해당되는 div/hr 삭제
							deleteOrderDiv(num);
							deleteHr(num);
						}
					});
				});
			});
		}
		
		// isOrderChecked에 따라 동적 페이지 구성
		function changePageByIsOrderChecked() {
			
			$('.isOrderChecked').each(function() {
				
				var isOrderChecked = $(this).data("check");
				var num = $(this).data("num");
				switch(isOrderChecked) {
				case 1 :
					break;
				case 2 :
					// 해당되는 div/hr 삭제
					deleteOrderDiv(num);
					deleteHr(num);
					break;
				case 3 :
					// 확인 버튼, 취소 버튼 삭제 , 주문 완료시간 넣기
					setOrderConfirmTime(num);
							
					// 확인 버튼 삭제
					deleteOrderConfirmBtn(num);
							
					// 취소 버튼 삭제
					deleteOrderCancleBtn(num);
					
					// 판매 완료 버튼 생성
					createOrderFinishBtn(num);
					break;
				case 4 :
					deleteOrderDiv(num);
					deleteHr(num);
					break;
				default :
					break;
				}				
			});
		}
		
		// main();
		$(function() {
			
			// 폰 번호 
			showPhoneNums();
			
			// 오더 확인 버튼 핸들러
			orderConfirmBtnHandler();
			
			// 주문 취소 버튼 핸들러
			orderCancleBtnHandler();
			
			// 판매 완료 버튼 핸들러
			orderFinishBtnHandler();
			
			// 동적 페이지 핸들러
			changePageByIsOrderChecked();
		
		});
		
	</script>
</body>