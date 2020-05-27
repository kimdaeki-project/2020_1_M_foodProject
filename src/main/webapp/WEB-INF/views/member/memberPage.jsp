<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../resources/css/member/memberPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5330df6f4ac31d266d5cced5bfc44a1e&libraries=services,clusterer,drawing"></script>

</head>
<body>
   <%@ include file="../templates/header.jsp"%>
   <div class="divBody">
      <div class="mp_myInfoBox">
         <div class="mp_pic">
            <img src="${pageContext.request.contextPath}/resources/img/ico-leaf.svg">
         </div>
         <div class="mp_me">
            <strong class="mp_me_strong">${memberVO.name}</strong> 
            <span class="mp_me_span">${memberVO.email}</span>
         </div>
         <div class="mp_num">
            <span class="mp_num_span">수령예정</span> 
            <em class="mp_num_em">0</em>
         </div>
         <div class="mp_num">
            <span class="mp_num_span">총 주문회수</span> 
            <em class="mp_num_em">0</em>
         </div>
      </div>

      <!-- 토글 버튼 -->
      <c:if test="${not empty sessionScope.marketVO}">
         <div class="toggleWrap" style="float: right;">
            <span class="storeOpen">영업 시작</span> 
            <input type="checkbox" id="toggle_alarm" name="" value="0" />
            <div>
            	<label id="btn-toggle" for="toggle_alarm"> 
            		<span></span>
            	</label>
            </div>
         </div>
      </c:if>

      <div class="mp_myInfoNav">
         <aside class="mp_myInfoNav_aside">
            <h2>마이 페이지</h2>
            <ul class="mp_myInfoNav_ul">
               <li id="orderAndPay" class="mp_myInfoNav_li" title="${memberVO.num}">
               <a class="mp_myInfoNav_a" href="#">주문/결제 내역</a></li>
               
               
               <li id="myReview" class="mp_myInfoNav_li">
               <a class="mp_myInfoNav_a" href="#">나의 후기</a></li>
               <li id="memberUpdate" class="mp_myInfoNav_li">
               <a class="mp_myInfoNav_a" href="#">회원정보 수정</a></li>


				<!-- 판매자가 아닐때 -->
               <c:if test="${empty sessionScope.marketVO}">
                  <li id="marketJoin" class="mp_myInfoNav_li">
                  <a class="mp_myInfoNav_a">판매자 신청</a></li>
               </c:if>
               
               
				<!-- 판매자 일 때 -->
               <c:if test="${not empty sessionScope.marketVO}">
               	  <li id="marketPage" class="mp_myInfoNav_li">
                  	<a class="mp_myInfoNav_a" href="#">[마켓] 정보 수정</a>
                  </li>
                  <!-- 트럭 주문 들어온 내역 -->
                  <li id="marketOrder" class="mp_myInfoNav_li">
                  	<a class="mp_myInfoNav_a" href="#">[마켓] 주문 리스트</a>
                  <li id="marketMenu" class="mp_myInfoNav_li">
                  	<a class="mp_myInfoNav_a" href="#">[마켓] 메뉴 리스트</a>
                  </li>
                  <li id="reviewMarket" class="mp_myInfoNav_li">
                  	<a class="mp_myInfoNav_a" href="#">[마켓] 리뷰 리스트</a>
                  </li>
               </c:if>
                    
                 <c:if test="${memberVO.isFoodTruck eq '2'}">  
                  <li id="marketManage" class="mp_myInfoNav_li">
                  	<a class="mp_myInfoNav_a" href="#">[관리자] 마켓 신청관리</a>
                  </li>
                  <li id="reviewManage" class="mp_myInfoNav_li">
                  	<a class="mp_myInfoNav_a" href="#">[관리자] 리뷰 관리</a>
                  </li>                 
                 </c:if>


              <li id="member_delete" class="mp_myInfoNav_li">
              	<a class="mp_myInfoNav_a">탈퇴하기</a>
              </li>
               <li id="li5" class="mp_myInfoNav_li">
               <a class="mp_myInfoNav_a" href="${pageContext.request.contextPath}/member/memberLogout?num=${sessionScope.memberVO.num}">로그아웃</a></li>
            </ul>
         </aside>
         <div class="mp_box" style="width: 100%"></div>
      </div>
   </div>
   <%@ include file="../templates/footer.jsp"%>

   <script type="text/javascript">

      if('${marketVO.isOpen}' == 1){
         $(".toggleWrap").addClass("on");
      }
   
      //menu-tab누를시 적용 클래스 변경
      $("#toggle_alarm").click(function() {
         var latitude,longitude;
         
         var check = $("#toggle_alarm").val();
         if(check == 0){
            //영업시작
            $("#toggle_alarm").val(1);
            $(".toggleWrap").addClass("on");
            
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                   latitude = position.coords.latitude;
                   longitude = position.coords.longitude;
                   
                   latitude = Math.floor(latitude*1000000)/1000000;
                   longitude = Math.floor(longitude*1000000)/1000000;
                   
                   console.log(latitude);
                   console.log(longitude);
                   
                  $.post("../market/marketIsOpen",{
                     num:'${memberVO.num}',
                     isOpen:$("#toggle_alarm").val(), 
                     latitude:latitude, longitude:longitude}, function(result){
                     console.log("p result:"+result);
                  })
                  
                  // kakao 이용 현재 마켓 주소 업데이트
                  var geocoder = new kakao.maps.services.Geocoder();
                  var coord = new kakao.maps.LatLng(latitude, longitude);
                  //var coord = new kakao.maps.LatLng(37.699445, 126.745396);
                  geocoder.coord2Address(coord.getLng(), coord.getLat(), function(result, status) {
                     
                      if (status === kakao.maps.services.Status.OK) {
                           console.log(result[0].address.address_name);
                           $.post("../market/marketGeoUpdate", {userNum:'${memberVO.num}', address: result[0].address.address_name },function(result) {
                           		console.log("GeoUpdate : "+result);
                           });
                      }
                  });
               });
            }else { 
                 alert("허용안해서 주소 못불러옴")
            }
            
         }else{
            //영업종료
            $("#toggle_alarm").val(0);
            $.get("../market/marketIsOpen?num=${memberVO.num}&isOpen="+$("#toggle_alarm").val(),function(result){
               console.log("result:"+result);
            })
            $(".toggleWrap").removeClass("on");
         }
      });
 
 
 
		
	
		
		
		//사용자 ===================================
		// 주문/결제 내역
		$('#orderAndPay').click(function() {
			var num = $(this).prop("title");
			var url = "../ordered/orderAndPay?num="+num;
			$.get(url, function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		
		//나의 리뷰 목록
		$('#myReview').click(function() {
			$.get("../review/myReviewList?num=${memberVO.num}", function(result) {
				
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		//회원정보 수정
		$('#memberUpdate').click(function() {
			$.get("./memberUpdate", function(result) {
				
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		
		
		
		
		//마켓 ===================================
		//마켓 등록
		$('#marketJoin').click(function() {
			$.get("../market/marketJoin", function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});

        //마켓 정보수정  페이지
		$('#marketPage').click(function() {
			$.get("../market/marketPage?num=${memberVO.num}", function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});

		//마켓 메뉴 리스트 조회
		$('#marketMenu').click(function() {
// 			location.href="../menu/marketMenu?marketNum=${sessionScope.marketVO.num}";
			$.get("../menu/marketMenu?marketNum=${sessionScope.marketVO.num}", function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		//마켓 리뷰 리스트 조회
		$('#reviewMarket').click(function() {
// 			location.href="../review/reviewMarket?num=${sessionScope.marketVO.num}";
			$.get("../review/reviewMarket?num=${sessionScope.marketVO.num}", function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		// 마켓 주문 리스트 조회
		$('#marketOrder').click(function() {
			console.log("save");
			$.get("../market/marketOrder?num=${sessionScope.marketVO.num}", function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		//관리자 ===================================
		//마켓 등록
		$('#marketManage').click(function() {
			$.get("../market/marketManage", function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		$('#reviewManage').click(function() {
			$.get("../review/reviewManage", function(result) {
				$('.mp_box').empty();
				$('.mp_box').append(result);
			});
		});
		
		//공통 ===================================
		//탈퇴하기
		$("#member_delete").click(function() {
			var check = confirm("탈퇴하시겠습니까?");
			if (check) {
				location.href = "./memberDelete?num=${sessionScope.memberVO.num}";
			}
		});

	</script>
</body>
</html>