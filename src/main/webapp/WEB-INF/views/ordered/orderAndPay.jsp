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
							<img alt="상점사진" src="${orderedVO.menuThumbImg}">
						</a>
						<div class="oap_ii_info">
							<a class="oap_items">
								<strong>${orderedVO.menuName} - ${orderedVO.cateMenuOptions}</strong>
								<em>가격 : ${orderedVO.amount}원</em>
								<em>&nbsp;|&nbsp;</em>
								<em>주문일자 : ${orderedVO.createAt}</em>
							</a>
							<c:if test="${orderedVO.isReview eq 0}">
								<c:if test="${orderedVO.isOrderChecked eq 1}">
									<span>주문 확인  : 대기중</span>
									<p> 주문 확인 전에는 주문 취소가 가능합니다. 주문 확인시 취소가 불가능하오니, 이점에 유의해주시기 바랍니다. </p>
								</c:if>
								<c:if test="${orderedVO.isOrderChecked eq 2}">
									<span>주문 확인 : 확인</span>
									<p> 주문이 완료되었습니다. </p>
								</c:if>
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
						<c:if test="${orderedVO.isReview eq 0}">
							<c:if test="${orderedVO.isOrderChecked eq 1}">
								<div class="orderCancle" data-num="${orderedVO.num}">구매취소</div>
							</c:if>
							<div id="113" class="reviewInsert" style="margin-top: 10px;" data-num="${orderedVO.num}">후기쓰기</div>
						</c:if>
					</div>
				</div>
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
		$(".orderCancle").each(function() {
			
			var thisObj = $(this);
			$(this).click(function() {
				
				var num = $(this).data("num");
				var result = confirm("정말 취소하시겠습니까?");
				if(result) {
					// post로 삭제
					url = "../ordered/orderCancle";
					data = { num: num };
					$.post(url, data, function(result) {
                    	
						// 원래 환불 절차를 진행해야 하지만 현재 어려운 상태,
						// 결제 취소 알림 띄우기 및 주문 리스트 삭제로 대체
						if(result > 0) {
							
							// div 내용 지우기
							console.log(thisObj);
							var parent = thisObj.parent().parent();
							console.log(parent);
							parent.remove();
							
							// hr지우기
							$('.orderHr').each(function() {
								
								var orderHrNum = $(this).data("num");
								if(num === orderHrNum) {
									console.log($(this));
									$(this).remove();
								}
							});
						}
               		});
				}
			});
		});
		
		// 후기 쓰기
		$(".reviewInsert").each(function() {
			
			$(this).click(function() {
				var num = $(this).data("num");
				location.href="../review/reviewInsert?num="+num;
			});
		});
		
	</script>
	
</body>


