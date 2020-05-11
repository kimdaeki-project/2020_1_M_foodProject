<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="../resources/css/market/marketSelect.css">
</head>
<body>
<%@ include file="../templates/header.jsp"%>
    <div class="container" style="margin-top: 103px;">
        <article class="boardItem_article">
            <div class="boardItem_menu_head">
                <img alt="" src="../img/food.jpg">
                <div class="boardItem_menu_body">
                    <header>
                        <h2>${marketVO.marketName}</h2>
                        <p>${marketVO.marketIntro}</p>
                    </header>
                    <hr class="boardItem_hr">
                    <button onclick="location.href='./'">장바구니</button>
                    <button onclick="location.href='./board/boardOrder'">주문하기</button>
                </div>
            </div>
            <div class="boardItem_menu_tab">
                <nav>
                    <a href="#info">
                        <button>상품정보</button></a>
                    <a href="#buy">
                        <button>구매정보</button></a>
                    <a href="#deliver">
                        <button>배송정보</button></a>
                    <a href="#review">
                        <button>후기보기</button></a>
                </nav>
            </div>
            <a name="info"></a>
            <div class="menu_info boardItem_menudiv"></div>
            <a name="buy"></a>
            <div class="menu_buy boardItem_menudiv"></div>
            <a name="deliver"></a>
            <div class="menu_deliber boardItem_menudiv"></div>
            <a name="review"></a>
            <div class="boardItem_menu_review boardItem_menudiv">
                <div>
                    <strong>평점</strong>
                    <span>사용자 총 평점 100</span>
                    <span>전체리뷰 100</span>
                </div>
                <section>
                    <h3>사진 모아보기</h3>
                    <img src="../resources/img/food.jpg">
                    <img src="../resources/img/food.jpg">
                    <img src="../resources/img/food.jpg">
                    <img src="../resources/img/food.jpg">
                </section>
                <hr class="boardItem_hr">
                <section>
                    <span>등록된 리뷰 10개</span>
                    <ul class="boardItem_review">
                        <li id="1" class="boardItem_review_block">
                            <div>
                                <dl>이*름 (이메일주소)</dl>
                                <div class="boardItem_review_info">💚💚💚💚💚 5
                                    <p>리뷰리뷰리뷰리뷰</p>
                                </div>
                                <p>2020.05.05</p>
                            </div>
                            <figure>
                                <img src="../resources/img/food.jpg">
                                <img src="../resources/img/food.jpg">
                            </figure>
                        </li>
                        <hr class="boardItem_hr">
                        <li></li>
                    </ul>
                </section>
            </div>
        </article>
    </div>
<%@ include file="../templates/footer.jsp"%>
</body>
</html>