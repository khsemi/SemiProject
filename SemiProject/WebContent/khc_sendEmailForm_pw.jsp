<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/KHC.css">
<title>KHC sendEmail</title>

</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>
<!-- 부트스트랩이 선언되기전에 jquery가 선언되어야한다. -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>
<body>
<input type="hidden" id="category" value='${category }'>
   <div class="layout-container">
      <div id="main">
         <!-- sidebar를 include해준다. -->
         <jsp:include page="sidebar.jsp" />
         <div class="form">
            <h2>비밀번호(email 인증)페이지</h2>
         </div>
         <div class="container">
			<h4>해당메일에 비밀번호 인증메일을 발송하였습니다.</h4>
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