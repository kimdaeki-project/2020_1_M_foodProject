<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name = (String)request.getAttribute("name");
    String email = (String)request.getAttribute("email");
    String phone = (String)request.getAttribute("phone");
    String address = (String)request.getAttribute("address");
    int totalPrice = (int)request.getAttribute("totalPrice");    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init(`imp87607408`); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            //pg : 'html5_inicis',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '결제테스트',
        	amount : 1,	// 최소 100원이상(이니시스 기준)
        	buyer_email : 'iamport@siot.do',
        	buyer_name : '구매자',
        	buyer_tel : '010-1234-5678',
        	buyer_addr : '서울특별시 강남구 삼성동',
        	buyer_postcode : '123-456'
        }, function(rsp) {
        	//console.log(rsp);
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }

            //alert(msg);
            //console.log(msg);
        });
    });
    </script>
 
</body>
</html>
