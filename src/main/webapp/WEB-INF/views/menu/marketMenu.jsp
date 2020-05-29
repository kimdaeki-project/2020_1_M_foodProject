<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    height: 100%;
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

.empty{
	text-align: center;
    width: 100%;
    height: 100%;
    margin: 30% 0;
    font-size: 14px;
    color: #9b9b9b;
}
</style>

<title>마켓 메뉴 리스트</title>
</head>
<body style="width: 100%;">
	<div>
		<div style="margin-left: 50px;">
			<div style="display: flex; justify-content: space-between;
    				border-bottom: 1px solid #e7e7e7;">
				<h2 style="border: none;">마켓 메뉴 리스트</h2>
				<input type="button" value="+" class="addMenu" id="menuAdd">
			</div>
			
			
				<c:if test="${empty menuList}">
					<div class="empty">등록된 메뉴가 없습니다.</div>
				</c:if>
			
			<!-- 하단의 div가 반복 -->
			<c:forEach var="menuVO" items="${menuList}">
				<div class="oap_item">
					<div class="oap_itemInfo">
						<a class="oap_ii_storePic">
							<img alt="메뉴대표사진" src="${pageContext.request.contextPath}/resources/upload/menu/${menuVO.thumbImg}">
						</a>
						<div class="oap_ii_info">
							<div class="oap_items">
								<strong>${menuVO.name}</strong>
								<em>${menuVO.detail}</em>
							</div>
							<p>
							
							<c:forEach var="categoryVO" items="${menuVO.categoryVOs}" varStatus="i">
								${categoryVO.name}
								<c:if test="${fn:length(menuVO.categoryVOs) gt i.index+1}"> 
									/
								 </c:if>
							</c:forEach>
							</p> 
						</div>
					</div>
					
					<!-- 구매관련 정보 div -->
					<div class="oap_payInfo">
						<div class="menuUpdate" title="${menuVO.num}">수정하기</div>
						<div class="menuDelete" title="${menuVO.num}" style="margin-top: 10px;">삭제하기</div>
					</div>
				</div>

				<hr>
			</c:forEach>
			
			
		</div>
	</div>
	<script type="text/javascript">
		//메뉴 카테고리 추가
		$('#menuAdd').click(function() {
			$.get("../menu/menuAdd", function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
	
		//메뉴 카테고리 수정
		$('.menuUpdate').click(function() {
			$.get("../menu/menuUpdate?num="+$(this).attr("title")+"&userNum=${sessionScope.marketVO.userNum}", function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		//메뉴 카테고리 수정
		$('.menuDelete').click(function() {
			$.get("../menu/menuDelete?num="+$(this).attr("title")+"&marketNum=${sessionScope.marketVO.num}", function(result) {
				
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		
	</script>

</body>