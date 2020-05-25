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
        <form action="./reviewReplyUpdate" method="post">
        	<input type="hidden" name="boardNum" value="${reviewVO2.boardNum}"> <!-- 판매자번호 -->
			<div class="rl_item">
				<div class="rl_item_pic">
					<img class="rl_item_img" alt="리뷰사진1" src="${pageContext.request.contextPath}/resources/upload/review/${reviewVO.fileName}">
				</div>
				<div class="rl_item_info">
					<p class="rl_item_p">${requestScope.memberVO.nickName} / ${orderedVO.menuName}</p>
					<h2 class="rl_item_h2">${reviewVO.contents}</h2>
				</div>
			</div>
			<div class="rl_review">
				<strong class="rl_review_strong">답글을 작성해 주세요!</strong>
                <!-- 기존 답글이 써있어야함 -->
                 <textarea class="rl_ta" style="resize: none;" name="contents">${reviewVO2.contents}</textarea>
			</div>
			<div class="rl_send">
				<div class="rl_send2">
					<div class="rl_send_div">
                        <input type="button" id="btn-cancle" class="rl_sbtn1 rl_cbtn" value="취소하기">
					</div>
					<div class="rl_send_div">
						<button type="submit" class="rl_sbtn1 rl_sbtn">수정하기</button>
					</div>
				</div>
            </div>
        </form>
		</section>
    </div>
</body>
</html>