<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu/menuMod.css">
</head>
<body>
    <form action="./menuMod" method="post" enctype="multipart/form-data" name="menuMod">
		<h2>메뉴 수정</h2>
		<div class="mm_box">
            <label for="title">기존메뉴명 : </label> 
            <input type="text" id="title" name="name" value="" class="mm_input">
		</div>
		<div class="mm_box">
            <label for="price">기존가격 : </label> 
            <input type="text" id="price" name="price" value="" class="mm_input">
		</div>
		<div class="mm_box">
            <label for="detail">기존상세 :</label> 
            <input type="text" id="detail" name="detail" value="" class="mm_input">
        </div>
        




		<div class="mm_box">
            카테고리명:
            <div style="display: table; width: 100%;">
                <input type="text" id="input" style="display: table-cell; width: 30%;"  class="mm_input">
                <button id="addCategory" type="button" style=" width: 19%; display: table-cell; margin-left: 10px;">카테고리 생성</button>
            </div>
            <div id="category_box">
                <!-- 기존 카테고리와 옵션 -->
            </div>
        </div>
        
        <!-- 카테고리명과 옵션추가버튼 div -->
        <!-- style="display: table; width: 100%;" -->
        <div> 
            <!-- style="display: table-cell; margin-left: 10px;" --> 
            카테고리명<button>옵션추가</button>
        </div>

        <!-- 추가될 옵션 div -->
        <div class="mm_opDiv">
            <!---- placeholder="옵션명" style="display: table-cell; width: 20%; margin-right: 5px;"> -->
            <input>
            <input>
            <!--  style="display: table-cell; width: 8.5%;"  -->
            <button>삭제하기</button>
        </div>

		<div class="mm_box">
			<label for="thumbImg">메뉴 이미지: </label> <input type="file"
				id="thumbImg" name="files" class="mm_input">
		</div>
		<div class="mm_box">
			<label for="thumbImg">메뉴 이미지: </label> <input type="file"
				id="thumbImg" name="files" class="mm_input">
		</div>
		<div class="mm_box">
			<button type="button" id="submit">확인</button>
		</div>
    </form>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

	//카테고리, 옵션 html 추가
	var num=0;
	var caIndex = [];
	var opIndex = [];
	
	$(function() {
		$("#addCategory").click(function() {
			caIndex.push(num);
			var test = $("#input").val();
			var c_name = '<div class="cb" title="'+num+'">'+test+'<input type="button" class="addO" value="옵션 추가"></div>';
			num++;
			$("#category_box").append(c_name);
			opIndex.push(0);
		});
			
		//옵션추가 버튼을 누르면 각 카테고리에 옵션추가
		$("#category_box").on('click', '.addO', function () {
			var index = $(this).parent().prop("title");
			
			var c_name = '<div class="opDiv"><input type="text" id="opName'+index+opIndex[index]+'"><input type="text" id="opPrice'+index+opIndex[index]+'"><input type="button" class="delO" value="옵션 삭제"></div>';
			$(this).parent().append(c_name);
			opIndex[index]++;		
		});		
			
		//옵션삭제 버튼을 누르면 옵션삭제
		$("#category_box").on('click', '.delO', function () {
			$(this).parent().remove();
		});		
			
	});
		
	$("#submit").click(function() {
		
		var categorys = [];
		$('.cb').each(function(){
			caNum = $(this).prop("title");
			//console.log("caNum : "+caNum);
			
			ep = opIndex[caNum];
			//console.log("ep : "+ep);
			
			var options = [];
			
			for(i=0; i<ep; i++) {
				var opName = $("#opName"+caNum+i).val();
				//console.log(opName);
				var opPrice = $("#opPrice"+caNum+i).val();
				//console.log(opPrice);
				
				var option = {
						"opName": opName,
						"opPrice": opPrice
				}
				
				options.push(option);
			}
			
			
			var categoryName = $(this).text();
			category = {
					"categoryName": categoryName,
					"options" : options
			}
			
			categorys.push(category);
		});
		
		console.log(categorys);
		











		//ajax 전송
		var objParams = {
			"categorys" : categorys
		};

		$.ajax({
			url : "./menuMod",
			type : "post",
			data : objParams,
			traditional : true,
			success : function() {
				console.log('성공');
			},
			error : function() {
				console.log('실패');
			}
		});
	});
</script>
</body>
</html>