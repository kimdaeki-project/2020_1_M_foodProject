<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<style type="text/css">
a {
	text-decoration: none;
	color: #000;
}

.rev_name {
	margin: 0;
	font-size: 22px;
	padding-bottom: 15px;
	border-bottom: 1px solid #e7e7e7;
	padding-bottom: 15px;
}

.rev_ul {
	list-style: none;
}

.rev_li {
	padding: 0 16px 0 14px;
	border-bottom: 1px solid #e7e7e7;
}

.rev_item {
	display: flex;
	width: 100%;
	padding: 20px 0 15px;
	border-bottom: 1px solid #f1f1f1;
	width: 100%;
}

.rev_item_img {
	width: 40px;
	height: 40px;
}

.rev_item_div {
	overflow: hidden;
	width: 50%;
	padding-left: 10px;
	overflow: hidden;
}

.rev_item_strong, .rev_item_span {
	white-space: nowrap;
	text-overflow: ellipsis;
	font-size: 13px;
	line-height: 17px;
	color: #333;
	display: block;
}

.rev_review {
	position: relative;
	padding: 15px 0 40px;
}

.rev_review2 {
	display: table;
	width: 100%;
	table-layout: fixed;
}

.rev_review3 {
	display: table-cell;
	vertical-align: top;
	width: 70%;
}

.rev_review4 {
	position: relative;
	display: table-cell;
	width: 90px;
	padding: 20px 0 0 20px;
	vertical-align: top;
	width: 90px;
	padding: 20px 0 0 20px;
}

.rev_review5 {
	display: table-cell;
	width: 210px;
	padding-top: 20px;
	vertical-align: top;
}

.rev_review_p {
	margin: 0;
	overflow: hidden;
	padding-top: 6px;
	font-size: 13px;
	line-height: 22px;
	word-break: break-all;
	white-space: pre-wrap;
}

.rev_review_img {
	display: table-cell;
	height: 90px;
}

.rev_del {
	width: 16px;
	height: 16px;
	position: absolute;
	top: 13px;
	right: 0;
	cursor: pointer;
}

.rev_mod {
	position: relative;
	width: 125px;
	margin-left: 35px;
	margin-right: 35px;
	border: 1px solid #dedede;
	background-color: #fff;
	font-size: 12px;
	line-height: 26px;
	color: #555555;
	text-align: center;
	cursor: pointer;
}
</style>
<title>나의 리뷰</title>

<body style="width: 100%">
	<div style="margin-left: 50px;">
		<h2 class="rev_name">나의 후기</h2>
		<ul class="rev_ul">



			<c:forEach items="${myReviewList}" var="reviewVO">
				<li class="rev_li">
						<div class="rev_item">
							<img class="rev_item_img" alt="" src="${pageContext.request.contextPath}/resources/img/food2.png">
							<div class="rev_item_div">
								<strong class="rev_item_strong">${reviewVO.boardNum}</strong> 
								<span class="rev_item_span">상품정보</span>
							</div>
						</div>
						<div class="rev_review">
							<div class="rev_review2">
							<div class="rev_review3">
								<div>
									<c:forEach begin="1" end="${reviewVO.rating}">
										<img alt="" src="${pageContext.request.contextPath}/resources/img/review/green-star.png"
											style="width: 16px; height: 16px;">
									</c:forEach>
									<span style="color: #6f7174; font-size: 18px; margin-left: 3px;">${reviewVO.rating}</span>

								</div>
								<p style="color: #5f5f5f;">${reviewVO.contents}</p>
							</div>
							<div class="rev_review4">
									<img class="rev_review_img" alt="review_img" src="${pageContext.request.contextPath}/resources/upload/review/${reviewVO.fileName}">
								</div>
								<div class="rev_review5">
									<input type="button" class="rev_mod" data-title="${reviewVO.boardNum}" value="수정하기">
									<img class="rev_del" alt="delete" data-title="${reviewVO.boardNum}" data-ordernum="${reviewVO.orderNum}"  src="${pageContext.request.contextPath}/resources/img/header/x.png"></img>
								</div>
							</div>
						</div>
					<!-- </a> -->
				</li>
			</c:forEach>
		</ul>
	</div>
</body>

<script type="text/javascript">

	//수정하기 버튼 누르면 수정하기
	$(".rev_mod").click(function() {
		var boardNum = $(this).data("title");
		location.href="../review/reviewUpdate?boardNum="+boardNum;
	});
	
	//X버튼 누르면 삭제하기
	$(".rev_del").click(function() {
		var check = confirm("삭제하시겠습니까?");
		if (check) {
			var boardNum = $(this).data("title");
			var orderNum = $(this).data("ordernum");
			location.href = "../review/reviewDelete?boardNum="+boardNum+"&orderNum="+orderNum;
		}
	});
</script>
</html>