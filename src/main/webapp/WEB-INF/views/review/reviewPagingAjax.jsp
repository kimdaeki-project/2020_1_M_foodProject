<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


						<c:forEach var="reviewVO" items="${reviewList}">
							<c:if test="${reviewVO.step eq 0}">
								<li>
									<div class="review-item">
										<dl class="row--v-center review-item__head">
											<dt class="col">
												<strong>${reviewVO.memberVO.nickName}</strong> <em>(${reviewVO.memberVO.email})</em>
											</dt>
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
															${reviewVO.rating}</span>
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


							<!-- 판매자의 덧글 존재시 출력 -->
							<c:if test="${reviewVO.step eq 1}">
								<div class="review-item__reply" style="margin-bottom: 20px;">
									<p style="margin: 0px; color: rgb(31, 182, 109); font-size: 15px;">${reviewVO.memberVO.nickName}</p>
									<p class="review-item__comment">${reviewVO.contents}</p>
									<p class="review-item__date">
										작성일 <em>${reviewVO.regDate}</em>
									</p>
								</div>
							</c:if>
						</c:forEach>
