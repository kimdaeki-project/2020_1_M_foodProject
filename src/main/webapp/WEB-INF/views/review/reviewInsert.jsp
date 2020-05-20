<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="../resources/css/review/reviewInsert.css">
</head>
<body>
	<%@ include file="../templates/header.jsp"%>
	<div class="rl_body">
	<form action="" id="reviewInsert">
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
					<input type="radio" name="rate">5점 
					<input type="radio" name="rate">4점 
					<input type="radio" name="rate">3점
					<input type="radio" name="rate">2점 
					<input type="radio" name="rate">1점
				</div>
				<label class="error" for="rate" generated="true" style="display:none; margin-bottom: 10px;"></label>
			</div>
			<div class="rl_review">
				<strong class="rl_review_strong">리뷰를 작성해 주세요!</strong>
				<textarea class="rl_ta" name="reviewText"></textarea>
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
		</form>
	</div>
	<%@ include file="../templates/footer.jsp"%>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
	<script type="text/javascript">
	//validate 유효성 검사
    $("#reviewInsert").validate({
        rules:{
            rate:{required: true},
            reviewText:{required: true}
        },
        messages:{
            rate:{
                required:"평점을 선택해 주세요!"
                },
            reviewText:{
                required:"리뷰를 작성해주세요!"
            }
        }
    });
	</script>
</body>
</html>