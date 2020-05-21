<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세보기</title>
<link rel="stylesheet" href="../resources/css/menu/menuSelect.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

<body>
	<%@ include file="../templates/header.jsp"%>
	<div class="container">
		<div class="ms_menu">
			<input type="hidden" id="marekt_num" name="num" value="${marketNum}">
			<img src="${pageContext.request.contextPath}/resources/upload/menu/${menuVO.thumbImg}">
			<div class="ms_menuInfo">
				<h2>${menuVO.name}</h2>
				<p>${menuVO.price}</p>
				<nav></nav>
				<!-- 옵션 선택 페이지 -->
				<div class="ml_opSel">
					<dl class="ml_opSel_dl">
						
						<c:forEach var="categoryVO" items="${cateList}" >

								<dt style="color: #3d3d3d;">${categoryVO.name}</dt>
									<c:forEach var="vo" items="${categoryVO.menuOptionVOs}">
										<dd>
											<label class="ml_opLabel">
											<input class="option_num" type="checkbox" name="test1" value="${vo.num}" >${vo.name}/${vo.price}</label>
										</dd>
									</c:forEach>
								<nav></nav>
							</c:forEach>
					</dl>
				</div>
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
			//var name = $(".ms_menuInfo h2").text();
			//var price = $(".ms_menuInfo p").text();
			
			var num = $("#marekt_num").val();
			var optionNum = [];
			
			//선택한 옵션 번호 구별 num값 추출
			$(".option_num").each(function() {
				if($(this).prop("checked") == true){
					
					optionNum.push($(this).val());
				}
			});
			
			console.log(num);
			console.log(optionNum);
			
			console.log(typeof num);
			console.log(typeof optionNum);
			
			var data = {
					num : num,
					optionNum : optionNum
			}
			
			
			$.ajax({
				url:"../cart/cartAdd",
				method:"get",
				data: data,
				success:function(result){
					alert(result);
				}
			});
			
		});
		
		$("#ml_order").click(function() {

		})
	</script>
</body>
</html>