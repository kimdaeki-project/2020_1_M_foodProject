<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세보기</title>
<link rel="stylesheet" href="../resources/css/menu/menuSelect.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
</head>
<body>
	<%@ include file="../templates/header.jsp"%>
	<div class="container">
		<div class="ms_menu">
			<img src="${pageContext.request.contextPath}/resources/img/food.jpg">
			<div class="ms_menuInfo">
				<h2>${menuVO.name}</h2>
				<p>${menuVO.price}</p>
				<nav></nav>
				<!-- 옵션 선택 페이지 -->
				<div class="ml_opSel">
					<dl class="ml_opSel_dl">
						<dt style="color: #3d3d3d;">카테고리명1</dt>
						<dd>
							<label class="ml_opLabel"> <input type="radio" name="test1">옵션명1 / 가격 </label>
						</dd>
						<dd>
							<label class="ml_opLabel"> <input type="radio" name="test1">옵션명2 / 가격 </label>
						</dd>
						<dd>
							<label class="ml_opLabel"> <input type="radio" name="test1">옵션명3 / 가격 </label>
						</dd>
						<nav></nav>
						<dt style="color: #3d3d3d;">카테고리명2</dt>
						<dd>
							<label class="ml_opLabel"> <input type="radio" name="test1">옵션명1 / 가격 </label>
						</dd>
						<dd>
							<label class="ml_opLabel"> <input type="radio" name="test1">옵션명2 / 가격 </label>
						</dd>
						<dd>
							<label class="ml_opLabel"> <input type="radio" name="test1">옵션명3 / 가격 </label>
						</dd>
					</dl>
				</div>
				<nav></nav>
				<button id="ml_cart" type="button">장바구니</button>
				<button id="ml_order" type="submit">주문하기</button>
			</div>
		</div>
	</div>
	<%@ include file="../templates/footer.jsp"%>

	<script type="text/javascript">
		//장바구니를 누르면 메뉴(옵션포함)추가
		$("#ml_cart").click(function() {
			alert('장바구니에 추가되었습니다.');
		});
	</script>
</body>
</html>