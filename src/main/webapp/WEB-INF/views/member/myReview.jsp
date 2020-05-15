<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
h2 {
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

.rev_item img {
	width: 40px;
	height: 40px;
}

.rev_item div {
	overflow: hidden;
	width: 50%;
	padding-left: 10px;
	overflow: hidden;
}

.rev_item strong, span {
	overflow: auto;
	white-space: nowrap;
	text-overflow: ellipsis;
	font-size: 13px;
	line-height: 17px;
	color: #333;
}

.rev_review {
	position: relative;
	padding: 15px 0 40px;
}

.rev_review p {
	margin: 0;
	overflow: hidden;
	padding-top: 6px;
	font-size: 13px;
	line-height: 22px;
	word-break: break-all;
	white-space: pre-wrap;
}

.rev_review img {
	height: 90px;
}

.rev_del {
	width: 15px;
	height: 15px;
}
</style>
<title>나의 리뷰</title>
</head>
<body style="width: 100%">
	<div style="margin-left: 50px;">
		<h2>나의 후기</h2>
		<ul class="rev_ul">
			<li class="rev_li">
				<div class="rev_item">
					<img alt=""
						src="${pageContext.request.contextPath}/resources/img/food2.png">
					<div>
						<strong>상품명</strong> <span>상품정보</span>
					</div>
				</div>
				<div class="rev_review">
					<span>평점</span>
					<p>리뷰내용</p>
					<img alt=""
						src="${pageContext.request.contextPath}/resources/img/food.jpg">
					<img class="rev_del" src="${pageContext.request.contextPath}/resources/img/header/x.png"></img>
					<button class="rev_mod">수정하기</button>
				</div>
			</li>
		</ul>
	</div>

</body>
</html>