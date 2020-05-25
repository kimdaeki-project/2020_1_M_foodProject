<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>


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
    cursor: pointer;
}
</style>
</head>
<body>
	<div>
		<div style="margin-left: 50px;">
			<h2>마켓에 등록된 리뷰 목록</h2>
			
			
			<!-- 하단의 div가 반복 -->
			<c:forEach var="reviewVO" items="${reviewList}"> 
				<div class="oap_item">
					<!-- 아이템 정보 div -->
					<div class="oap_itemInfo">
						<a class="oap_ii_storePic">
							<img alt="후기사진" src="${pageContext.request.contextPath}/resources/upload/review/${reviewVO.fileName}">
						</a>
						<div class="oap_ii_info">
							<a class="oap_items">
								<strong>${reviewVO.orderedVO.menuName} - ${reviewVO.orderedVO.cateMenuOptions}</strong>
								<em>총액 : ${reviewVO.orderedVO.amount}원 | 구매일 : ${reviewVO.orderedVO.createAt}</em>
							</a>
							<c:if test="${reviewVO.rating ne 0}">
								<c:forEach begin="1" end="${reviewVO.rating}">
									<img alt="rating" src="../resources/img/review/green-star.png" style="width: 15xp; height: 15px;">
								</c:forEach>
							</c:if>
							
							<p>${reviewVO.contents}</p>
							작성일 : ${reviewVO.regDate}
						</div>
					</div>
					
					<!-- 상점 정보 div -->
					<div class="oap_storeInfo">
						<div class="oap_siDiv">
							<span class="storename">${reviewVO.memberVO.nickName}</span>
							<span class="storecrn">${reviewVO.memberVO.email}</span>
							<!-- <span class="storego">바로가기</span> -->
						</div>
					</div>
					
					<!-- 구매관련 정보 div -->
					<div class="oap_payInfo">
						<c:if test="${reviewVO.isReply eq 0}">
							<div class="btn-reply" data-title="${reviewVO.boardNum}">답글작성</div>
						</c:if>
						<c:if test="${reviewVO.isReply ne 0}">
							<div style="cursor: default;" data-title="${reviewVO.boardNum}">작성완료</div>
							<div style="margin-top: 10px;" id="btn-reply-update" data-title="${reviewVO.boardNum}">답글수정</div>
						</c:if>
						
					</div>
					
				</div>
				<hr>
			</c:forEach>
			
			
			
			
		</div>
	</div>
	<script type="text/javascript">
		$(".btn-reply").click(function() {
			location.href="../review/reviewReply?boardNum="+$(this).data("title");
		});
		
		$("#btn-reply-update").click(function() {
			location.href="../review/reviewReplyUpdate?boardNum="+$(this).data("title");
		});
		
	</script>
	
</body>














