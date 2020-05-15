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
				<em>카테고리</em> <select id="ml_category">
					<option>카테고리</option>
					<c:forEach items="${categoryList}" var="cl">
						<option value="">${cl.name}</option>
					</c:forEach>
				</select> 
				<em>옵션</em> <select id="ml_option" disabled="disabled">
					<option>가격</option>
					<c:forEach items="${menuOptionList}" var="mol">
						<option value="${mol.name}" class="c_option">${mol.name}</option>
					</c:forEach>
				</select>
				<div class="ml_opDiv">
					
				</div>
				<nav></nav>
				<button id="ml_cart" type="button">장바구니</button>
				<button id="ml_order" type="submit">주문하기</button>
			</div>
		</div>
	</div>
	<%@ include file="../templates/footer.jsp"%>

	<script type="text/javascript">
		
		//카테고리를 선택해야 옵션이 활성화 됨 
		$("#ml_category").change(function() {
			if ($("#ml_category").text() == '카테고리') {
				$("#ml_option").attr('disabled', true);
			} else{
				$("#ml_option").attr('disabled', false);
			}
		});

		//카테고리와 옵션을 선택하면 div ml_cart에 추가, 삭제 버튼
		$("#ml_option").change(function() {
			var category= $("#ml_category option:selected").val();
			var option = $("#ml_option option:selected").val();
			
			$(".ml_opDiv").append('<div class="ml_opList">'
					+category +' / '+ option+
					'<span id="ml_opListDel">✖</span></div>');
		});
		
		$(".ml_opDiv").on('click', '#ml_opListDel', function () {
			$(this).parent().remove();
		});		

		//장바구니를 누르면 메뉴(옵션포함)추가
		$("#ml_cart").click(function() {
			alert('장바구니에 추가되었습니다.');
		});
		
	</script>
</body>
</html>