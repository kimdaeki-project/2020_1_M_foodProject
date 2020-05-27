<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu/menuUpdate.css">

    <form action="../menu/menuUpdate" method="post" enctype="multipart/form-data" name="menuUpdate" id="manuUpdate" style="margin-left: 50px;">
		<h2>메뉴 수정</h2>
		<input type="hidden" id="menuNum" name="num" value="${menuVO.num}">
		<div class="menuAdd_box" style="margin-top: 12px">
			<label for="title">메뉴명 : </label> 
			<input type="text" id="title" name="name" value="${menuVO.name}">
		</div>
		<div class="menuAdd_box">
			<label for="price">가격 : </label> 
			<input type="text" id="price" name="price" value="${menuVO.price}">
		</div>
		<div class="menuAdd_box">
			<label for="detail">상세 :</label> 
			<input type="text" id="detail" name="detail" value="${menuVO.detail}">
		</div>
		<label>카테고리명:</label>
		<div class="menuAdd_box_cate">
			<input type="text" id="input" name="catename">
			<input type="button" id="addCategory" type="button" value="카테고리 추가">
		</div>
		
		
		<!-- 추가된 카테고리 박스 -->
		<div id="category_box">


			
			<c:forEach var="categoryVO" items="${cateList}" varStatus="i">
				<div class="cb" title="1">${categoryVO.name.trim()}
					<input type="button" class="add" id="cateName${i.index+1}" name="cate_name_${i.index+1}" title="${i.index+1}" value="옵션추가">
					<input type="button" class="del" value="카테고리 삭제">
							
					<c:forEach var="vo" items="${categoryVO.menuOptionVOs}" varStatus="k">
						<div class="opDiv">
							<input name="op_name_${i.index+1}_${k.index+1}" class="opName" type="text" id="cateName${i.index+1}" value="${vo.name}">
							<input name="op_price_${i.index+1}_${k.index+1}" class="opPrice" type="text" id="catePrice${i.index+1}" value="${vo.price}">
							<input type="button" class="delO" value="옵션삭제">
					 	</div>
					 	<script type="text/javascript">
					 		$(".cb").attr("title",${k.index+2});
					 	</script>
					</c:forEach>
				</div>
				<input type="hidden" value="${categoryVO.name}" name="cate_name_${i.index+1}">
			</c:forEach>
			
			

			
		</div>
		
		<div class="menuAdd_box">
			<label for="thumbImg">메뉴 이미지: </label>
			<div style="display: flex;">
				<c:if test="${empty menuVO.thumbImg}">
					<input type="file" id="thumbImg" name="files" class="thumbImg1"> 
				</c:if>
				<c:if test="${not empty menuVO.thumbImg}">
					<input type="text" id="thumbImg" name="thumbImg" class="thumbImg1" value="${menuVO.thumbImg}" readonly="readonly"> 
					<span id="ma_fileDel">✖</span>
				</c:if>
				
			</div>
		</div>
		<div class="menuAdd_box">
			<button type="submit" id="submit">확인</button>
		</div>
	</form>
</body>


	<script type="text/javascript">
	
		var i = ${fn:length(cateList)};
	
		//옵션추가 해놓고 아무것도 안적으면 submit안됨
		$("#btn-sub").click(function() {
			if ($(".opName").val() == '' && $(".opPrice").val() == '') {
				alert('옵션값을 입력해주세요!');
				event.preventDefault();
			}
		});
		
		//가격에 숫자만 입력
		$(".opPrice").on("keyup", function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});

		//카테고리 추가 버튼 누르면 박스추가 (카테고리명이 안나옴)
		$("#addCategory").click(function() {
			if ($("#input").val() == '') {
				//placeholder수정하고 작동X
				$('#input').attr("placeholder", "카테고리명을 입력해주세요!");
				preventDefault();
			}

			i++;
			var cateVal = $("#input").val();
			var c_name = '<div class="cb" title="1">'
				+ cateVal
				+ '<input type="button" class="add" value="옵션 추가" id="cateName'+i+'" name="cate_name_'+i+'" title="'+i+'">'
				+ '<input type="button" class="del" value="카테고리 삭제">'
				+ '</div>';
			var c_hidden = '<input type="hidden" value="'+cateVal+'" name="cate_name_'+i+'">';

			$("#category_box").append(c_name);
			$("#category_box").append(c_hidden);
		});

		//옵션추가 버튼을 누르면 각 카테고리에 옵션추가 (O)
		$("#category_box").on('click',".add",function() {
		
			var index = $(this).attr("title");
			var index2 = parseInt($(this).parent().attr("title")); //cb
			var c_name = '<div class="opDiv"><input name="op_name_'+index+'_'+ index2 +'" class="opName" placeholder="옵션 이름" type="text"><input name="op_price_'+index+'_'+ index2 +'" class="opPrice" type="number" placeholder="가격"><input type="button" class="delO" value="옵션 삭제"></div>';
				
			$(this).parent().append(c_name);
			$(this).parent().attr("title", ++index2);
				
		});
				
		//옵션삭제 버튼을 누르면 옵션삭제 (O)
		$("#category_box").on('click', '.delO', function() {
			$(this).parent().remove();
		});
				
		//X누르면 파일 내용 삭제
		$("#ma_fileDel").click(function() {
			//ajax FILE DELETE
			var menuNum = $("#menuNum").val();
			
			$.get("../fileInfo/fileDelete?kind=3&refNum="+menuNum,function(result){
				if(result > 0){
					$(".thumbImg1").val("");
					$(".thumbImg1").prop("type","file");
					$(".thumbImg1").prop("name","files");
				}else{
					alert("파일 삭제에 실패했습니다.");
				}
			});
		});
				
		//카테고리 삭제 버튼 누르면 그 카테고리 박스 삭제
		$("#category_box").on('click', '.del', function() {
			$(this).parent().remove();
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
