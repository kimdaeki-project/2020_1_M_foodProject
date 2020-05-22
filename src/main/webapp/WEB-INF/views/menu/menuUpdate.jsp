<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menuUpdate</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu/menuUpdate.css">
</head>
<body>
    <form action="./menuUpdate" method="post" enctype="multipart/form-data" name="menuUpdate" id="manuUpdate">
		<h2>메뉴 추가</h2>
		<div class="menuAdd_box">
			<label for="title">메뉴명 : </label> <input type="text" id="title" name="title" value="${vo.title}이전값">
		</div>
		<div class="menuAdd_box">
			<label for="price">가격 : </label> <input type="text" id="price" name="price" value="${vo.price}이전값">
		</div>
		<div class="menuAdd_box">
			<label for="detail">상세 :</label> <input type="text" id="detail" name="detail" value="${vo.detail}이전값">
		</div>
		<label>카테고리명:</label>
		<div class="menuAdd_box_cate">
			<input type="text" id="input" name="catename">
			<button id="addCategory" type="button">카테고리 생성</button>
		</div>
		
		<!-- 추가된 카테고리 박스 -->
		<div id="category_box">
		
			<!-- 기존 카테고리박스와 옵션값 -->
			<c:forEach items="${menuList}" var="op">
				<div class="opDiv">
					<span>${op.name}</span>
					<input class="opName" type="text" id="" value="">
				</div>
			</c:forEach>
			
		</div>
		
		<div class="menuAdd_box">
			<label for="thumbImg">메뉴 이미지: </label>
			<div style="display: flex;">
				<input type="file" id="thumbImg" name="files" class="thumbImg1" value="${vo.detail}이전값"> <span id="ma_fileDel">✖</span>
			</div>
			<div style="display: flex;">
				<input type="file" id="thumbImg" name="files" class="thumbImg2" value="${vo.detail}이전값"> <span id="ma_fileDel2">✖</span>
			</div>
		</div>
		<div class="menuAdd_box">
			<button type="submit" id="submit">확인</button>
		</div>
	</form>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript">

	//카테고리 이름 입력
	$("#addCategory").click(function() {
		if ($("#input").val() == '') {
			//placeholder수정하고 작동X
			$('#input').attr("placeholder", "카테고리명을 입력해주세요!");
			preventDefault();
		}
	});

	//카테고리, 옵션 html 추가
	var num = 0;
	var caIndex = [];
	var opIndex = [];

	$(function() {
		$("#addCategory").click(function () {
			caIndex.push(num);
							var test = $("#input").val();
							var c_name = '<div class="cb" title="'+num+'">'
									+ test
									+ '<input type="button" class="addO" value="옵션 추가"></div>';
							num++;
							$("#category_box").append(c_name);
							opIndex.push(0);
						});

		//옵션추가 버튼을 누르면 각 카테고리에 옵션추가
		$("#category_box").on('click','.addO',function() {
							var index = $(this).parent().prop("title");
							var c_name = '<div class="opDiv"><input name="opName" class="opName" placeholder="옵션 이름" type="text" id="opName'+index+opIndex[index]+'"><input name="opPrice" class="opPrice" type="text" placeholder="가격" id="opPrice'+index+opIndex[index]+'"><input type="button" class="delO" value="옵션 삭제"></div>';
							$(this).parent().append(c_name);
							opIndex[index]++;
						});

		//옵션삭제 버튼을 누르면 옵션삭제
		$("#category_box").on('click', '.delO', function() {
			$(this).parent().remove();
		});

	});
	
	//X누르면 파일 내용 삭제
	$("#ma_fileDel").click(function() {
		$(".thumbImg1").val("");
	});
	
	$("#ma_fileDel2").click(function() {
		$(".thumbImg2").val("");
	});

	//전송
	$("#submit").click(function() {

		var categorys = [];
		$('.cb').each(function() {
			caNum = $(this).prop("title");
			ep = opIndex[caNum];

			var options = [];

			for (i = 0; i < ep; i++) {
				var opName = $("#opName" + caNum + i).val();
				var opPrice = $("#opPrice" + caNum + i).val();

				var option = {
					"opName" : opName,
					"opPrice" : opPrice
				}

				options.push(option);
			}

			var categoryName = $(this).text();
			category = {
				"categoryName" : categoryName,
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
			url : "./menuAdd",
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
	

	//유효성 검사
	$("#manuUpdate").validate({
        rules:{
            title:{required: true},
            price:{required: true, digits: true},
            opName:{required: true},
            opPrice:{required: true, digits: true}
        },
        messages:{
            title:{
                required:"필수 입력 사항입니다."
                },
           price:{
                required:"필수 입력 사항입니다.",
                digits:"숫자만 입력해주세요."
            },
           opName:{
                required:"필수 입력 사항"
                },
           opPrice:{
                required:"필수 입력 사항",
                digits:"숫자만 입력"
            }
        }
    });

</script>
</body>
</html>