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
<title>PW 찾기</title>
</head>
<!-- 부트스트랩이 선언되기전에 jquery가 선언되어야한다. -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>

<body>

	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<jsp:include page="sidebar.jsp" />
			<div class="form">
				<h2>패스워드 찾기</h2>
			</div>
			<div class="container">
				<div class="col-lg-4"></div>
				<div class="col-lg-4"></div>
				<div class="jumbotron" style="padding-top: 20px;">
					<h3 style="text-align: center">PW 찾기에 실패 하였습니다.</h3>
					<a href="khc_login.jsp">로그인 화면으로...</a></br>
					

				</div>
			</div>

			</br>
			</br>
			</br>
			<hr>
			<footer class="footer">Team.진선이와 아이들 1, 2, 3, 4, 5, 6 </footer>
			</br>
			</br>
			</br>
		</div>
	</div>

</body>
</html>