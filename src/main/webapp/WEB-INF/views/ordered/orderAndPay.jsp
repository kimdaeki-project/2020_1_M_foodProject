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
    overflow: hidden;
    height: 46px;
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

.storego:hover {
	cursor: pointer;
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

hr{
	
}

.orderCancle:hover {
	cursor: pointer;
}

.reviewInsert:hover {
	cursor: pointer;
}

.cancleReason{
	display: none;
	margin-bottom: 23px;
}

.cr_select{
    padding: 10px 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-family: inherit;
    color: #3d3d3d;
    display: flex;
    justify-content: space-between;
}

.cr_select > option{
    border: 1px solid #dedede;
	font-family: 'Noto Sans KR', sans-serif;
	font-family: inherit;
    color: #3d3d3d;
}

.cancleTextArea{
	resize: none;
    width: 95%;
    margin: 0 20px;
    height: 70px;
    border: 1px solid #dedede;
    padding: 5px;
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
<title>사용자 주문내역 페이지</title>
</head>
<body style="width: 100%">
	<div>
		<div style="margin-left: 50px;">
			<h2>주문/결제 내역</h2>
				<!-- 하단의 div가 반복 -->
				<c:forEach items="${orderedList}" var="orderedVO">
				<div class="oap_item" data-num="${orderedVO.num}">
					<!-- 아이템 정보 div -->
					<div class="oap_itemInfo">
						<a class="oap_ii_storePic">
							<img alt="상점사진" src="../resources/upload/menu/${orderedVO.menuThumbImg}">
						</a>
						<div class="oap_ii_info">
							<a class="oap_items">
								<strong>${orderedVO.menuName}</strong>
								<em>선택옵션 : ${orderedVO.cateMenuOptions}</em><br>
								<em>가격 : ${orderedVO.amount}원</em>
								<em>&nbsp;|&nbsp;</em>
								<em>주문일자 : ${orderedVO.createAt}</em>
							</a>
							<c:if test="${orderedVO.isOrderChecked eq 1}">
								<span>주문 확인  : 대기중</span>
								<p> 주문 확인 전에는 주문 취소가 가능합니다. 주문 확인시 취소가 불가능하오니, 이점에 유의해주시기 바랍니다. </p>
							</c:if>
							<c:if test="${orderedVO.isOrderChecked eq 2}">
								<span>주문 확인 : 확인</span>
								<p> 주문이 완료되었습니다. </p>
							</c:if>
						</div>
					</div>
					
					<!-- 상점 정보 div -->
					<div class="oap_storeInfo">
						<div class="oap_siDiv">
							<span class="storename">${orderedVO.marketName}</span>
							<span class="storego" data-num="${orderedVO.memberNum}">바로가기</span>
						</div>
					</div>
					
					<!-- 구매관련 정보 div -->
					<div class="oap_payInfo">
					
						<c:if test="${orderedVO.isOrderChecked eq 1}">
							<div class="orderCancle" data-num="${orderedVO.num}">구매취소</div>
						</c:if>
						
						<c:if test="${orderedVO.isReview eq 0}">
							<div id="113" class="reviewInsert" style="margin-top: 10px;" data-num="${orderedVO.num}">후기쓰기</div>
						</c:if>
						<c:if test="${orderedVO.isReview ne 0}">
							<div id="113" class="reviewUpdate" style="margin-top: 10px;" data-num="${orderedVO.isReview}">후기수정</div>
						</c:if>
					</div>
				</div>
				<c:if test="${orderedVO.isOrderChecked eq 1}">
					<div class="cancleReason" data-num="${orderedVO.num}" data-show="0">
						<div class="cr_select">
							주문 취소 사유
							<!-- (0:기타, 1:마켓의 요청으로 취소(취소 사유에 뜨지않음) 2:재주문을 위한 취소(default), 3:너무 먼 거리로 인한 취소, 4: 단순변심 -->
							<select class="cancleReasonSelect" style="padding: 2px 5px; margin-left: 10px;" data-num="${orderedVO.num}">
								<option value="2">재주문을 위한 취소</option>
								<option value="3">너무 먼 거리로 인한 취소</option>
								<option value="4">단순변심으로 인한 취소</option>
								<option value="0">기타 사유</option>
							</select>
							<button class="orderCancleBtn" data-num="${orderedVO.num}">취소 요청</button>
						</div>
						<textarea rows="" cols="" placeholder="주문 취소 이유를 적어주세요!" class="cancleTextArea" data-num="${orderedVO.num}"></textarea>
					</div>
				</c:if>
				<hr class="orderHr" style="border-bottom : 1px solid; border-color : #e7e7e7;" data-num="${orderedVO.num}">
			<!-- 반복 끝 -->
			</c:forEach>
		</div>
	</div>
	
	<script type="text/javascript">
	
		// 상점 바로가기
		$('.storego').each(function() {
			$(this).click(function() {
				var userNum = $(this).data("num");
				location.href = '../market/marketSelect?userNum='+userNum;
			});
		});
	
		// 구매 취소
		$(".orderCancleBtn").each(function() {
			
			var thisObj = $(this);
			$(this).click(function() {
				
				var num = $(this).data("num");
				var result = confirm("정말 취소하시겠습니까?");
				var cancleDetail; 
				var cancleType;
				
				$('.cancleTextArea').each(function() {
					if($(this).data("num") === num)
						cancleDetail = $(this).val();
				});
				
				$('.cancleReasonSelect').each(function() {
					if($(this).data("num") === num) {
						cancleType = $(this).val();
					}
				});
				
				console.log(cancleDetail);
				console.log(cancleType);
				
				if(result) {
					// post로 삭제
					url = "../ordered/orderCancle";
					data = { 
						num: num, 
						cancleType : cancleType, 
						cancleDetail : cancleDetail,
						isOrderChecked : 2
					};
					$.post(url, data, function(result) {
                    	
						// 원래 환불 절차를 진행해야 하지만 현재 어려운 상태,
						// 결제 취소 알림 띄우기 및 주문 리스트 삭제로 대체
						if(result > 0) {
							
							// div 내용 지우기
							$('.oap_item').each(function() {
								var oap_itemNum = $(this).data("num");
								if(num === oap_itemNum) {
									$(this).remove();
								}
							});
							
							// 취소 요청 창 지우기
							$('.cancleReason').each(function() {
								var cancleReasonNum = $(this).data("num");
								if(num === cancleReasonNum) {
									$(this).remove();
								}
							});
							
							// hr지우기
							$('.orderHr').each(function() {
								
								var orderHrNum = $(this).data("num");
								if(num === orderHrNum) {
									$(this).remove();
								}
							});
						}
               		});
				}
			});
		});
		
		// 취소 요청란 열기/접기
		function showCancleReason(num) {
			
			$('.cancleReason').each(function() {
				
				var thisNum = $(this).data("num");
				var thisShow = $(this).data("show");
				
				if(thisNum === num && thisShow == 0) {
					$(this).css('display','grid');
					$(this).data("show","1");
				} else if(thisNum === num && thisShow == 1) {
					$(this).css('display','none');
					$(this).data("show","0");
				}
			});
		}
		
		// 취소 요청 이벤트 핸들러
		$(".orderCancle").each(function() {
			
			$(this).click(function() {
				
				var num = $(this).data("num");
				
				showCancleReason(num);
			});
		});
		
		// 후기 쓰기
		$(".reviewInsert").each(function() {
			$(this).click(function() {
				var num = $(this).data("num");
				location.href="../review/reviewInsert?num="+num;
			});
		});
		
		//후기 수정
		$(".reviewUpdate").each(function() {
			alert
			
			$(this).click(function() {
				var num = $(this).data("num");
				location.href="../review/reviewUpdate?boardNum="+num;
			});
		});
		
	</script>
	
</body>


