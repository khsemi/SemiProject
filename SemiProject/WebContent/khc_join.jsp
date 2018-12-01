<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/KHC.css">
<title>KH Community</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>
<script>
function roadaddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 도로명 주소 값 얻어오기
            document.getElementById('roadAddress').value = fullRoadAddr;

        }
    }).open();
    
    
}
</script>
</head>
<!-- 부트스트랩이 선언되기전에 jquery가 선언되어야한다. -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<body>

   <div class="layout-container">
      <div id="main">
         <!-- sidebar를 include해준다. -->
         <jsp:include page="sidebar.jsp" />
         <div class="form">
            <h2>회원가입 페이지</h2>
         </div>
         
         <div class="container">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
               <div class="jumbotron" style="padding-top: 20px;">
                  <!-- <form method="post" action="userRegisterAction.jsp"> -->
                  <form method="post" action="controller.do?category=user_insert">
                     <h3 style="text-align: center;">회원가입 화면</h3>
                     <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="user_id" maxlength="20">
                     </div>
                     <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="user_pw" maxlength="20">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" placeholder="이름" name="user_name" maxlength="20">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" placeholder="닉네임" name="user_nickname" maxlength="20">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" id="roadAddress" placeholder="주소" name="user_address" maxlength="20" readonly="readonly">
                        &nbsp
                        <input type="button" value="주소검색" class="btn btn-primary form-control" onclick="roadaddr()">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" placeholder="이메일" name="user_email" maxlength="25">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" placeholder="전화번호" name="user_phone" maxlength="20">
                     </div>
                     
                     <input type="submit" class="btn btn-primary form-control" value="회원가입" >
                  
                  </form>
               </div>
            </div>
         </div>
         <footer class="footer">Team.진선이와 아이들 1, 2, 3, 4, 5, 6 </footer>
      </div>
   </div>

   <div id="pasingInfo" style="text-align: center;"></div>
   <br>
   <script type="text/javascript" src="js/search.js"></script>
   <script type="text/javascript" src="js/pasing.js"></script>
   <hr>
</body>
</html>