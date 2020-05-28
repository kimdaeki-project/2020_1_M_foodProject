<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓에 달린 리뷰</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <section class="menu-review__index">
        <h2 class="headerH2">마켓 리뷰 모음</h2>
        
        <c:if test="${empty reviewList}">
			<div class="empty">작성된 리뷰가 없습니다.</div>
		</c:if>
		
        <ul id="review_table">
        	<c:forEach var="reviewVO" items="${reviewList}">
                <c:if test="${reviewVO.step eq 0}">
                    <li>
                        <div class="review-item">
                            <dl class="row--v-center review-item__head">
                                <dt class="col">
                                    <strong>${reviewVO.memberVO.nickName}닉네임</strong> 
                                    <em>(${reviewVO.memberVO.email})이메일</em>
                                </dt>
                                <input type="button" value="답글달기" class="col_reply">
                            </dl>
                            <div class="review-item__body">
                                <div>
                                    <div class="review-item__score vue-star-rating"
                                        style="display: grid">
                                        <div class="vue-star-rating">
                                            <!-- 별점 5개 -->
                                            <c:forEach begin="1" end="${reviewVO.rating}">
                                                <span class="vue-star-rating-star"> 
                                                    <img alt="pngwing.com.png" src="${pageContext.request.contextPath}/resources/img/pngwing.com.png">
                                                </span>
                                            </c:forEach>
                                            <span
                                                class="vue-star-rating-rating-text state-rating-label"
                                                style="font-size: 16px; color: #6f7174; font-weight: 600;">
                                                ${reviewVO.rating}별점</span>
                                        </div>
                                        <p class="review-item__comment">${reviewVO.contents}</p>
                                    </div>
                                </div>
                                <figure class="review-item__photos">
                                    <!-- 회원이 이미지를 등록했을 때만 이미지 html문을 추가해 출력해준다 -->
                                    <p>
                                        <a href="javascript:"> <i
                                            style="background-image: url(&quot;../resources/upload/review/${reviewVO.fileName}&quot;);">photo</i>
                                        </a>
                                    </p>
                                </figure>
                            </div>
                            <p class="review-item__date">
                            	작성일 <em>${reviewVO.regDate}</em>
                            </p>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>

        <!-- 페이지 버튼 구현 -->
        <div class="nav-paginate-wrap__desktop">
            <nav class="nav-paginate">
                <c:if test="${pager.curBlock gt 1}">
                    <a id="btn-pre" title="./marketSelect?curPage=${pager.startNum-1}&userNum=${marketVO.userNum}" class="nav-paginate__dir nav-paginate-dir-prev"></a>
                </c:if>

                <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                    <a class="nav_pagerA btn_page">${i}</a>
                </c:forEach>
                    
                    
                <c:if test="${pager.curBlock lt pager.totalBlock}">
                    <a id="btn-next" title="./marketSelect?curPage=${pager.lastNum+1}&userNum=${marketVO.userNum}" class="nav-paginate__dir nav-paginate-dir-next">
                        <i></i>
                    </a>
                </c:if>
                
            </nav>
        </div>
    </section>
    
    <script type="text/javascript">
    
    	//수정하기
    	$(".col_reply").click(function() {
			location.href='리뷰에 답글달기';
		});
    	
    </script>
</body>
</html>