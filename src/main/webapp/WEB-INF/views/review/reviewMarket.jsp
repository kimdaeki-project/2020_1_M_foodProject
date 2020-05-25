<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
</style>
</head>
<body>
	<div>
		<div style="margin-left: 50px;">
			<h2>주문/결제 내역</h2>
			<!-- 하단의 div가 반복 -->
			<div class="oap_item">
				
				<!-- 아이템 정보 div -->
				<div class="oap_itemInfo">
					<a class="oap_ii_storePic">
						<img alt="후기사진" src="${pageContext.request.contextPath}/resources/img/food2.png">
					</a>
					<div class="oap_ii_info">
						<a class="oap_items">
							<strong>메뉴명 - 옵션명</strong>
							<em>가격 | 구매일</em>
						</a>
						<span>별점</span>
						<p>리뷰내용</p>
					</div>
				</div>
				
				<!-- 상점 정보 div -->
				<div class="oap_storeInfo">
					<div class="oap_siDiv">
						<span class="storename">구매자</span>
						<span class="storecrn">구매자정보</span>
						<span class="storego">바로가기</span>
					</div>
				</div>
				
				<!-- 구매관련 정보 div -->
				<div class="oap_payInfo">
					<div>답글작성</div>
				</div>
				
			</div>
			<hr>
			
		</div>
	</div>
</body>
</html>