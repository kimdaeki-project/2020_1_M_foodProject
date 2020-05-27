<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>카카오 가입 완료하기</title>
<link rel="stylesheet"
   href="../resources/css/member/memberKakaoJoin.css">
</head>
<body>
   <%@ include file="../templates/header.jsp"%>
   <div class="mkjcontainer">
      <article class="mkj_article">
         <form action="../member/memberJoin" method="post" id="memberJoin">
            <header class="mkj_header">
               <p>푸드트럭</p>
            </header>
            <div>
               <fieldset class="mkj_fieldset">
                  <div>
                     <p>아이디</p>
                     <input type="text" placeholder="아이디를 입력해주세요!" class="mkj_input"
                        name="id">
                  </div>
                  <div class="mj_showIdChk" id="mj_showIdChk"></div>
                  <div>
                     <p>비밀번호</p>
                     <input type="password" placeholder="비밀번호를 입력해주세요!"
                        class="mkj_input" name="password">
                  </div>
                  <div>
                     <p>이름</p>
                     <input type="text" placeholder="이름을 입력해주세요!" class="mkj_input"
                        name="name">
                  </div>
                  <div>
                     <p>닉네임</p>
                     <input type="text" placeholder="닉네임을 입력해주세요!" class="mkj_input"
                        name="nickName" value="${nickname}">
                  </div>
                  <div>
                     <p>이메일</p>
                     <input type="email" placeholder="현재 사용하는 이메일을 입력해주세요!"
                        class="mkj_input" name="email" value="${email}">
                  </div>
                  <div>
                     <p>휴대폰 번호</p>
                     <input type="text" placeholder="01012345678" class="mkj_input"
                        name="phone">
                  </div>
                  <div>
                     <p>출생년월일</p>
                     <input type="date" class="mkj_input" name="birth">
                  </div>
                  <div>
                     <p>주소</p>
                     <input type="text"  class="mkj_input" name="address" id="address" onclick="goPopup();">
                  </div>
                  <div>
                     <p>성별</p>
                     <input type="hidden" id="genderData" value="${gender}"> <input
                        type="radio" class="mkj_radio" id="genderMale" name="gender"
                        value="1">남자 <input type="radio" class="mkj_radio"
                        id="genderFemale" name="gender" value="0">여자
                  </div>
               </fieldset>
            </div>
            <hr class="mkj_hr">
            	<div>
                    <label class="mkj_label">
                        <input type="checkbox" id="chk_all" name="chk">
                        <strong>이용약관 전체동의</strong>
                    </label>
                    <label class="mkj_label">
                        <input type="checkbox" id="chk_1" name="chk" class="check_btn">
                        <span>(필수)이용약관에 동의합니다.</span>
                        <span class="memberJoin_more">자세히</span>
                    </label>
                    <label class="mkj_label">
                        <input type="checkbox" id="chk_2" name="chk" class="check_btn">
                        <span>(필수)개인정보처리방침에 동의합니다.</span>
                        <span class="memberJoin_more"> 자세히</span>
                    </label>
                </div>
            <nav>
               <button type="submit" class="mkj_button">가입 완료 하기</button>
            </nav>

         </form>
      </article>
   </div>
   
   <form name="form" id="form" method="post" style="visibility: hidden;">
		<div id="list"></div>
		<div id="callBackDiv">
			<table>
				<tr><td></td><td><input type="hidden"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" /></td></tr>
				<tr><td> </td><td><input type="hidden"  style="width:500px;" id="roadAddrPart1"  name="roadAddrPart1" /></td></tr>
				<tr><td> </td><td><input type="hidden"  style="width:500px;" id="addrDetail"  name="addrDetail" /></td></tr>
				<tr><td></td><td><input type="hidden"  style="width:500px;" id="roadAddrPart2"  name="roadAddrPart2" /></td></tr>
				<tr><td> </td><td><input type="hidden"  style="width:500px;" id="engAddr"  name="engAddr" /></td></tr>
				<tr><td>지번                 </td><td><input type="hidden"  style="width:500px;" id="jibunAddr"  name="jibunAddr" /></td></tr>
				<tr><td>우편번호             </td><td><input type="hidden"  style="width:500px;" id="zipNo"  name="zipNo" /></td></tr>
				<tr><td>행정구역코드        </td><td><input type="hidden"  style="width:500px;" id="admCd"  name="admCd" /></td></tr>
				<tr><td>도로명코드          </td><td><input type="hidden"  style="width:500px;" id="rnMgtSn"  name="rnMgtSn" /></td></tr>
				<tr><td>건물관리번호        </td><td><input type="hidden"  style="width:500px;" id="bdMgtSn"  name="bdMgtSn" /></td></tr>
				<tr><td>상세번물명        	</td><td><input type="hidden"  style="width:500px;" id="detBdNmList"  name="detBdNmList" /></td></tr>
				<tr><td>건물명        		</td><td><input type="hidden"  style="width:500px;" id="bdNm"  name="bdNm" /></td></tr>
				<tr><td>공동주택여부       </td><td><input type="hidden"  style="width:500px;" id="bdKdcd"  name="bdKdcd" /></td></tr>
				<tr><td>시도명        		</td><td><input type="hidden"  style="width:500px;" id="siNm"  name="siNm" /></td></tr>
				<tr><td>시군구명        	</td><td><input type="hidden"  style="width:500px;" id="sggNm"  name="sggNm" /></td></tr>
				<tr><td>읍면동명        	</td><td><input type="hidden"  style="width:500px;" id="emdNm"  name="emdNm" /></td></tr>
				<tr><td>법정리명        	</td><td><input type="hidden"  style="width:500px;" id="liNm"  name="liNm" /></td></tr>
				<tr><td>도로명        		</td><td><input type="hidden"  style="width:500px;" id="rn"  name="rn" /></td></tr>
				<tr><td>지하여부        	</td><td><input type="hidden"  style="width:500px;" id="udrtYn"  name="udrtYn" /></td></tr>
				<tr><td>건물본번        	</td><td><input type="hidden"  style="width:500px;" id="buldMnnm"  name="buldMnnm" /></td></tr>
				<tr><td>건물부번        	</td><td><input type="hidden"  style="width:500px;" id="buldSlno"  name="buldSlno" /></td></tr>
				<tr><td>산여부        		</td><td><input type="hidden"  style="width:500px;" id="mtYn"  name="mtYn" /></td></tr>
				<tr><td>지번본번(번지)     </td><td><input type="hidden"  style="width:500px;" id="lnbrMnnm"  name="lnbrMnnm" /></td></tr>
				<tr><td>지번부번(호)       </td><td><input type="hidden"  style="width:500px;" id="lnbrSlno"  name="lnbrSlno" /></td></tr>
				<tr><td>읍면동일련번호       </td><td><input type="hidden"  style="width:500px;" id="emdNo"  name="emdNo" /></td></tr>
			</table>
		</div>
	</form>
   
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
   <script type="text/javascript">
      //성별가져오기?
      var gender = $('#genderData').val();
      console.log(gender);
      if (gender === 'male') {
         $('#genderMale').attr("checked", "checked");
         console.log("done");
      } else if (gender === 'female') {
         $('#genderFemale').attr("checked", "checked");
      }
   
    //우편번호 조회
  	function goPopup(){
  		var pop = window.open("../map/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
  	}

  	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
  		document.form.roadFullAddr.value = roadFullAddr;
  		document.form.roadAddrPart1.value = roadAddrPart1;
  		$("#address").val(roadAddrPart1);
  		
  		document.form.roadAddrPart2.value = roadAddrPart2;
  		document.form.addrDetail.value = addrDetail;
  		document.form.engAddr.value = engAddr;
  		document.form.jibunAddr.value = jibunAddr;
  		document.form.zipNo.value = zipNo;
  		document.form.admCd.value = admCd;
  		document.form.rnMgtSn.value = rnMgtSn;
  		document.form.bdMgtSn.value = bdMgtSn;
  		document.form.detBdNmList.value = detBdNmList;
  		document.form.bdNm.value = bdNm;
  		document.form.bdKdcd.value = bdKdcd;
  		document.form.siNm.value = siNm;
  		document.form.sggNm.value = sggNm;
  		document.form.emdNm.value = emdNm;
  		document.form.liNm.value = liNm;
  		document.form.rn.value = rn;
  		document.form.udrtYn.value = udrtYn;
  		document.form.buldMnnm.value = buldMnnm;
  		document.form.buldSlno.value = buldSlno;
  		document.form.mtYn.value = mtYn;
  		document.form.lnbrMnnm.value = lnbrMnnm;
  		document.form.lnbrSlno.value = lnbrSlno;
  		document.form.emdNo.value = emdNo;
  	}
  	
  	
      //validate 유효성 검사
      $("#joinForm").validate({
          rules:{
              name:{required: true, maxlength: 6},
              nickName:{required: true, maxlength: 6},
              id:{required: true, rangelength:[5, 10], eng_number:true},
              email:{required: true, email:true},
              password:{required: true, rangelength:[5, 10], eng_number:true},
              password_check:{required: true, equalTo:"#password"},
              phone:{required: true, maxlength:11, digits: true},
              birth:{required: true},
              gender:{required: true}
          },
          messages:{
              name:{
                  required:"필수 입력 사항입니다.",
                  maxlength:"6글자까지만 입력 가능합니다."
                  },
              nickName:{
                  required:"필수 입력 사항입니다.",
                  maxlength:"6글자까지만 입력 가능합니다."
              },
              id:{
                  required:"필수 입력 사항입니다.",
                  rangelength:"최소 5글자, 10글자 사이여야 합니다.",
                  eng_number:"영어와 숫자만 입력가능합니다."
              },
              email:{
                  required:"필수 입력 사항입니다.", 
                  email:"이메일 형식으로 입력해주세요."
              },
              password:{
                  required:"필수 입력 사항입니다.",
                  rangelength:"최소 5글자, 10글자 사이여야 합니다.",
                  eng_number:"영어와 숫자만 입력가능합니다."
              },
              password_check:{
                  required:"필수 입력 사항입니다.",
                  equalTo:"입력하신 비밀번호와 일치하지 않습니다."
              },
              phone:{
                  required:"필수 입력 사항입니다.",
                  maxlength:"최대 11자리까지 입력 가능합니다.",
                  digits:"숫자만 입력해 주세요."
              },
              birth:{
                  required:"필수 입력 사항입니다."
              },
              gender:{
                  required:"필수 입력 사항입니다."
              }
          }
      });


  	$(function() {
          
          //아이디 중복검사
          $("#id").keyup(function() {
          	console.log('성공');
              var id = $("#id").val();
              console.log(id);
              console.log(id.length);
              $.ajax({
                  url:'./memberIdCheck',
                  type:'get',
                  data:{ id:id },
                  success: function(data) {
                  	if (data===0){
                          //사용중인 아이디라고 화면에 뜨게하기
                          $("#mj_showIdChk").text("중복되는 아이디입니다.");
  						$("#mj_showIdChk").css("color", "red");
                      } else if(data===1) {
                      	// 5자리 갯수 이상, 사용 가능한 아이디라고 화면에 뜨게하기
                      	if(id.length > 4) {
                          	$("#mj_showIdChk").text("사용가능한 아이디입니다.");
  							$("#mj_showIdChk").css("color", "#27b06e");
                      	} else {
                      		$("#mj_showIdChk").empty();
                      	}
                      }
                  },
                  error: function() {
  						console.log("연결 실패");
  				}
              });
          });
  		
  		//체크 박스 전체선택, 해제
  		$("#chk_all").click(function() {
  			if ($("#chk_all").is(':checked')) {
  				$(".check_btn").prop("checked", true);
  				console.log('?');
  			}else {
  				$(".check_btn").prop("checked", false);
  				console.log('!');
  			}
  		});
  		
  		//체크박스 부분 선택
  		$('.check_btn').each(function() {
  			$(this).click(function() {
  				
  				var check = true;
  				$('.check_btn').each(function() {
  					if($(this).prop('checked') === false) {
  						check = false;
  						return;
  					}
  				});
  				
  				$('#chk_all').prop('checked', check);
  			});
  		});
  		
  		//약관 동의 안하면 가입 못함
  		$(function() {
  			$(".memberjoin_button").click(function() {
  				if ($("#chk_all").is(':checked')) {
  				}else {
  					alert('모든 약관에 동의해야 가입이 가능합니다!');
  					return false;
  				}
  			})
          })
          
  	});

   </script>
   <%@ include file="../templates/footer.jsp"%>
</body>
</html>