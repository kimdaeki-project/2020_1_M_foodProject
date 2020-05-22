<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<style type="text/css">

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/orderAndPay.css">
<title>사용자 주문내역 페이지</title>
</head>
<body style="width: 100%">
	<div>
		<div style="margin-left: 50px;">
			<h2>주문/결제 내역</h2>
			<!-- 하단의 div가 반복 -->
			<div class="oap_item">
				
				<!-- 아이템 정보 div -->
				<div class="oap_itemInfo">
					<a class="oap_ii_storePic">
						<img alt="상점사진" src="${pageContext.request.contextPath}/resources/img/food2.png">
					</a>
					<div class="oap_ii_info">
						<a class="oap_items">
							<strong>메뉴명 - 옵션명</strong>
							<em>가격 | 구매일</em>
						</a>
						<span>구매확정여부</span>
						<p>구매가 완료되었습니다. 이용해주셔서 감사합니다.<br>구매확정 이후 상품의 이용방법, 반품 등에 대한 문의는 판매자에게 문의해주세요.</p>
					</div>
				</div>
				
				<!-- 상점 정보 div -->
				<div class="oap_storeInfo">
					<div class="oap_siDiv">
						<span class="storename">상점명</span>
						<span class="storecrn">상점CRN</span>
						<span class="storego">바로가기</span>
					</div>
				</div>
				
				<!-- 구매관련 정보 div -->
				<div class="oap_payInfo">
					<div>구매취소</div>
					<div style="margin-top: 10px;">후기쓰기</div>
				</div>
				
			</div>
			<hr>
			
		</div>
	</div>
</body>