<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/reviewUpdate.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
</head>
<body>
	<%@ include file="../templates/header.jsp"%>
	<div class="rl_body">
		<section class="rl_section">
			<form action="./reviewUpdate" method="post" enctype="multipart/form-data" id="reviewUpdate">
				<input type="hidden" name="boardNum" value="${reviewVO.boardNum}">
				<div class="rl_item">
					<div class="rl_item_pic">
						<img class="rl_item_img" alt="food" src="${pageContext.request.contextPath}/resources/upload/menu/${orderedVO.menuThumbImg}">
					</div>
					<div class="rl_item_info">
						<p class="rl_item_p">${orderedVO.marketName}</p>
						<h2 class="rl_item_h2">${orderedVO.menuName}</h2>
						<p class="rl_item_p">${orderedVO.cateMenuOptions}</p>
					</div>
				</div>
				<div class="rl_rate">
					<span class="rl_rate_span">음식을 평가해주세요!</span>
					<div class="rl_rating">
						<!-- 기존 평점이 체크되어있어야함 -->
						<input type="radio" class="ratings" name="rating" value="5">5점
						<input type="radio" class="ratings" name="rating" value="4">4점
						<input type="radio" class="ratings" name="rating" value="3">3점
						<input type="radio" class="ratings" name="rating" value="2">2점
						<input type="radio" class="ratings" name="rating" value="1">1점
					</div>
				</div>
				<div class="rl_review">
					<strong class="rl_review_strong">리뷰를 작성해 주세요!</strong>
					<!-- 기존 리뷰가 써있어야함 -->
					<textarea id="reviewText" class="rl_ta" name="contents">${reviewVO.contents}</textarea>
					<div class="rl_div">
						파일명 :
						<input class="rl_file" id="rl_file2" type="text" name="fileName" value="${reviewVO.fileName}" readonly="readonly" style="width: 275px;"> 
						<span class="rl_fileDel" id="rl_fileDel2">❌</span>
					</div>
				</div>
				<div class="rl_send">
					<div class="rl_send2">
						<div class="rl_send_div">
							<input type="button" class="rl_sbtn1 rl_cbtn" value="취소하기">
						</div>
						<div class="rl_send_div">
							<button type="submit" class="rl_sbtn1 rl_sbtn">수정하기</button>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
	<%@ include file="../templates/footer.jsp"%>


	
	<script type="text/javascript">
		$('.ratings').each(function() {
			
			if($(this).val() == ${reviewVO.rating}){
				$(this).prop("checked",true);
			}
			
		});
		
		$("#rl_fileDel2").click(function() {
			$("#rl_file2").prop("type","file");
			$("#rl_file2").attr("name","files");
			
		});
	
	
		
		
		
		
		
	</script>
</body>
</html>