<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
<link rel="stylesheet" href="../resources/css/member/memberLogin.css">
</head>
<body>
   <%@ include file="../templates/header.jsp"%>
   <div class="memberLogin_container" style="padding-top: 103px">
      <article class="memberLogin_article">
         <header class="memberLogin_header">
            <img alt="logo"
               src="${pageContext.request.contextPath}/img/logo.png"
               class="memberLogin_img">

            <p>프리미엄 샐러드 배송</p>
         </header>
         <form action="./memberLogin" method="post">
            <input id="latitude" type="hidden" name="latitude" value="">
            <input id="longitude" type="hidden" name="longitude" value="">
            <div>
               <input name="id" type="text" placeholder="이메일을 입력해주세요" class="memberLogin_input" id="id" value="${cookie.cId.value}"> 
               <input name="password" id="password" type="password" placeholder="비밀번호를 입력해주세요" class="memberLogin_input">
            </div>
            <label class="autologin"> 
            <c:if test="${cookie.cookieId.value eq ''}">
               <input type="checkbox" name="remember" id="idSaveCheck" value="remember" >아이디 기억하기
            </c:if>
            <c:if test="${cookie.cookieId.value ne ''}">
               <input type="checkbox" name="remember" id="idSaveCheck" value="remember" checked="checked" >아이디 기억하기
            </c:if>
            
            </label>
            <nav>
               <input id="btn-login" class="memberLogin_login memberLogin_button" type="submit" value="로그인">
            </nav>
         </form>




         <nav class="joinandfind">
            <div>
               <a href="./memberIdFind" id="btn-id-search" class="memberLogin_a btn-mailCertification">아이디 찾기</a>
            </div>
            <div>
               <a href="./memberPwFind" id="btn-pwd-search" class="memberLogin_a btn-mailCertification">비밀번호 찾기</a>
            </div>
            <div>
               <a href="${pageContext.request.contextPath}/member/memberJoin"
                  class="memberLogin_a">회원가입</a>
            </div>
         </nav>

         <div class="ml_kakao">
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=97f1860e20781cd962ba73e33913c194&redirect_uri=http://localhost:8080/project/auth/kakao&response_type=code">
               카카오로 시작하기
            </a>
         </div>
      </article>
   </div>
   <%@ include file="../templates/footer.jsp"%>

   <script type="text/javascript">
      
      //로그인 한 사람 좌표 불러오기
      if (navigator.geolocation) {
         navigator.geolocation.getCurrentPosition(showPosition);
      } else {
         alert("허용안해서 주소 못불러옴")
      }

      function showPosition(position) {
         $("#latitude").val(position.coords.latitude + "");
         $("#longitude").val(position.coords.longitude + "");
      }
      
      //유효성 검사
      $("#joinForm").validate({

        rules:{
            id:{required: true},
            password:{required: true},
        },
        messages:{
            id:{
                required:"아이디를 입력해주세요!",
            },
            password:{
                required:"비밀번호를 입력해주세요!",
            }
        }

       });


      
   </script>

</body>
</html>






