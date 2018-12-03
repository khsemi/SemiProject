<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
$(function() {
	
		var IMP = window.IMP;
		IMP.init('imp54383215'); // 아임포트 관리자 페이지의 "시스템 설정" > "내 정보" 에서 확인 가능
		
		IMP.request_pay({
		    pg : 'kakaopay', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'KHC 포인트 결제', //String
		    amount : ${point_val},			
		    buyer_email : "구매자이메일",	//String
		    buyer_name : '구매자이름',				//String
		    buyer_tel : '010-1234-5678',		//String
		    buyer_addr : '서울특별시 강남구 삼성동',	//String
		    buyer_postcode : '123-456',			//String
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
// 		        msg += '고유ID : ' + rsp.imp_uid;
// 		        msg += '상점 거래ID : ' + rsp.merchant_uid;
// 		        msg += '결제 금액 : ' + rsp.paid_amount;
// 		        msg += '카드 승인번호 : ' + rsp.apply_num;
				
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    location.href="controller.do?category=POINT&point_val="+rsp.paid_amount;
		});

})

	
</script>
</head>

<body>

	<h1> 결제 진행중입니다. </h1>
</body>
</html>