<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/review/reviewInsert.css">
</head>
<body>
	<%@ include file="../templates/header.jsp"%>
	<div class="rl_body">
		<section class="rl_section">
			<div class="rl_item">
				<div class="rl_item_pic">
					<img class="rl_item_img" alt="food"
						src="${pageContext.request.contextPath}/resources/img/food2.png">
				</div>
				<div class="rl_item_info">
					<p class="rl_item_p">상점명</p>
					<h2 class="rl_item_h2">메뉴명</h2>
					<p class="rl_item_p">옵션명</p>
				</div>
			</div>
			<div class="rl_rate">
				<span class="rl_rate_span">음식을 평가해주세요!</span>
				<div class="rl_rating">
					<input type="radio" name="rate">5점 <input type="radio"
						name="rate">4점 <input type="radio" name="rate">3점
					<input type="radio" name="rate">2점 <input type="radio"
						name="rate">1점
				</div>
			</div>
			<div class="rl_review">
				<strong class="rl_review_strong">리뷰를 작성해 주세요!</strong>
				<textarea class="rl_ta"></textarea>
				<div class="rl_div">
					<input class="rl_file" type="file">
				</div>
			</div>
			<div class="rl_send">
				<div class="rl_send2">
					<div class="rl_send_div">
						<button class="rl_sbtn1 rl_cbtn">취소하기</button>
					</div>
					<div class="rl_send_div">
						<button class="rl_sbtn1 rl_sbtn">등록하기</button>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="../templates/footer.jsp"%>
</body>
</html>