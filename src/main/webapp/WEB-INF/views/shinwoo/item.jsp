<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="./css/item.css">
</head>
<body>
    <div class="container">
        <article>
            <div class="menu_head">
                <img alt="" src="../img/food.jpg">
                <div class="menu_body">
                    <header>
                        <h2>상품명</h2>
                        <pre>상품설명</pre>
                    </header>
                    <hr>
                    <button>주문하기</button>
                </div>
            </div>
            <div class="menu_tab">
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
            <div class="menu_info menudiv"></div>
            <a name="buy"></a>
            <div class="menu_buy menudiv"></div>
            <a name="deliver"></a>
            <div class="menu_deliber menudiv"></div>
            <a name="review"></a>
            <div class="menu_review menudiv">
                <div>
                    <strong>평점</strong>
                    <span>사용자 총 평점 100</span>
                    <span>전체리뷰 100</span>
                </div>
                <section>
                    <h3>사진 모아보기</h3>
                    <img src="../img/food.jpg">
                    <img src="../img/food.jpg">
                    <img src="../img/food.jpg">
                    <img src="../img/food.jpg">
                </section>
                <hr>
                <section>
                    <span>등록된 리뷰 10개</span>
                    <ul class="review">
                        <li id="1" class="review_block">
                            <div>
                                <dl>김*우 (yo********@naver.com)</dl>
                                <div class="review_info">💚💚💚💚💚 5
                                    <p>항상 맛있게 잘 먹고 있습니다!</p>
                                </div>
                                <p>2020.05.05</p>
                            </div>
                            <figure>
                                <img src="../img/food.jpg">
                                <img src="../img/food.jpg">
                            </figure>
                        </li>
                        <hr>
                        <li></li>
                    </ul>
                </section>
            </div>
        </article>
    </div>
</body>
</html>