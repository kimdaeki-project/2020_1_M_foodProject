<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<link rel="stylesheet" href="../resources/css/board/order.css">
</head>
<body>
<div class="order">
        <button class="orderbox">주문서</button>
        <div class="method box">
            <p class="div_title">결제방법 선택</p>
            <div class="method_body">
                <div class="method_body_radio">
                    <input type="radio" value="online" name="payment" id="online" checked="checked">
                    <label for="online">온라인 결제</label>
                </div>
                <div class="method_body_radio">
                    <input type="radio" value="offline" name="payment" id="offline">
                    <label for="offline">현장 결제</label>
                </div>
            </div>
        </div>
        <div class="cart box">
            <p class="div_title">장바구니</p>
            <ul class="cart_list">
                <li class="cart_lists">
                    <img alt="" src="../resources/img/food.jpg">
                </li>
                <li class="cart_lists">
                    <img alt="" src="../resources/img/food.jpg">
                </li>
                <li class="cart_lists">
                    <img alt="" src="../resources/img/food.jpg">
                </li>
            </ul>
        </div>
        <div class="bill box">
            <p class="div_title">결제예상금액</p>
            <div class="bill_body">
                <div class="bill_body_box">
                    <div class="bill_body_title">상품 수 / 금액</div>
                    <div class="bill_body_title right">0개 / 0원</div>
                </div>
                <div class="bill_body_box">
                    <div class="bill_body_title">할인금액</div>
                    <div class="bill_body_title right">0원</div>
                </div>
                <div class="bill_body_box all">
                    <div class="bill_body_title">총 금액</div>
                    <div class="bill_body_title right">0원</div>
                </div>
            </div>
        </div>
        <button class="payment">결제하기</button>
    </div>
</body>
</html>