<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/reviewReply.css">
</head>
<body>
<div class="rl_body">
		<section class="rl_section">
        <form action="./reviewReply" method="post">
        	<input type="hidden" name="boardNum" value="${reviewVO.boardNum}">
        	<input type="hidden" name="orderNum" value="${reviewVO.orderNum}">
        	<input type="hidden" name="memberNum" value="${sessionScope.memberVO.num}">
        	<input type="hidden" name="marketNum" value="${sessionScope.marketVO.num}">
        	
			<div class="rl_item">
				<div class="rl_item_pic">
					<img class="rl_item_img" alt="리뷰사진" src="${pageContext.request.contextPath}/resources/upload/review/${reviewVO.fileName}">
				</div>
				<div class="rl_item_info">
					<p class="rl_item_p">${requestScope.memberVO.nickName} / ${orderedVO.menuName}</p>
					<h2 class="rl_item_h2">${reviewVO.contents}</h2>
				</div>
			</div>
			<div class="rl_review">
				<strong class="rl_review_strong">답글을 작성해 주세요!</strong>
                <textarea class="rl_ta" style="resize: none;" name="contents"></textarea>
			</div>
			<div class="rl_send">
				<div class="rl_send2">
					<div class="rl_send_div">
                        <input type="button" class="rl_sbtn1 rl_cbtn" value="취소하기">
					</div>
					<div class="rl_send_div">
						<button type="submit" class="rl_sbtn1 rl_sbtn">작성하기</button>
					</div>
				</div>
            </div>
        </form>
		</section>
    </div>
</body>
</html>