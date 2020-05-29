<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트럭 신청받기</title>
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
	width: 70%;
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
    height: auto;
    font-size: 14px;
    min-width: 200px;
}

.oap_storeInfo{
	display: table-cell;
	vertical-align: middle;
    width: 200px;
    background-color: #fff;
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
    cursor: pointer;
}

.addMenu{
    color: #6f7174;
    height: 30px;
    width: 30px;
    font-size: 20px;
    margin: 5px;
    text-decoration: none;
    text-align: center;
    border: 1px solid #dedede;
    background-color: #fff;
    cursor: pointer;
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
	font-family: 'Noto Sans KR', sans-serif;
}

.cancleReasonSelect{
font-family: 'Noto Sans KR', sans-serif;
}

.cr_select{
    padding: 5px;
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
    width: 98.3%;
    margin: 0 auto;
    height: 70px;
    border: 1px solid #dedede;
    padding: 5px;
	font-family: 'Noto Sans KR', sans-serif;
}

.oap_itemIfDiv{
	display: flex;
    padding: 10px 0;
}

.orderCancleBtn{
	width: 100px;
    color: #6f7174;
    font-size: 13px;
    line-height: 27px;
    text-decoration: none;
    text-align: center;
    border: 1px solid #dedede;
}
</style>
</head>
<body>
	<div>
		<div style="margin-left: 50px;">
			<div style="display: flex; justify-content: space-between;
    				border-bottom: 1px solid #e7e7e7;">
				<h2 style="border: none;">마켓 신청 리스트</h2>
			</div>
			
			<c:if test="${empty menuVO}">
					<div class="empty">들어온 신청이 없습니다.</div>
			</c:if>
			
			<!-- 하단의 div가 반복 -->
				<div class="oap_item">
					<div class="oap_itemInfo">
						<a class="oap_ii_storePic">
							<img alt="트럭사진" src="${pageContext.request.contextPath}/resources/upload/menu/${menuVO.thumbImg}">
						</a>
						<div class="oap_ii_info">
							<div class="oap_items">
								<strong>트럭 이름</strong> <em>신청자 이름 -사업자 번호</em>
							</div>
							<p>트럭 설명</p>
							<p style="padding-bottom: 23px;">트럭 메뉴,옵션 </p>
						</div>
					</div>
					
					<!-- 신청관련 div -->
					<div class="oap_payInfo">
						<div class="menuUpdate">수락하기</div>
						<div class="menuDelete" style="margin-top: 10px;">취소하기</div>
					</div>
				</div>
				
				<div class="cancleReason">
						<div class="cr_select">
							<div>
							신청 취소 사유
							<select class="cancleReasonSelect" style="padding: 2px 5px; margin-left: 10px;">
								<option value="1">부적절한 이름으로 인한 취소</option>
								<option value="2">------------------</option>
								<option value="3">------------------</option>
								<option value="0">기타 사유</option>
							</select>
							</div>
							<button class="orderCancleBtn">취소 요청</button>
						</div>
						<textarea rows="" cols="" placeholder="신청 취소 이유를 적어주세요!" class="cancleTextArea"></textarea>
					</div>
				<hr>			
		</div>
	</div>

	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
	// 취소 요청란 열기
	$(".menuDelete").click(function() {
		console.log('click');
		console.log($(this).parent().parent().next().css('display','block'));
	});
	</script>
</body>
</html>