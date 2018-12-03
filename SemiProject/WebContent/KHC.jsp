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
<title>KH Community</title>
</head>
<!-- 부트스트랩이 선언되기전에 jquery가 선언되어야한다. -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<body>
<input type="hidden" id="category" value='${category }'>
	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<jsp:include page="sidebar.jsp"/>
			<div class="form">
				<h2>메인페이지</h2>
					<!-- 메인페이지에 표시될 게시판들을 div와 table을 이용해서 코딩하면된다. -->
					<p>로그인 정보 </p>
					<!-- 세션에 담긴 정보는 불러온다. -->
					<p>아이디 : ${userDto.user_id }</p>
					<p>계정번호 : ${userDto.user_seq }</p>
					<br/>
					<a type="button" href="controller.do?category=LOGOUT">로그아웃</a>
			</div>
			<footer class="footer">Team.진선이와 아이들
									1, 2, 3, 4, 5, 6
			</footer>
		</div>
	</div>
	
	<div id="pasingInfo" style="text-align: center;"></div>
	<br>
	<script type="text/javascript" src="js/search.js"></script>
	<script type="text/javascript" src="js/pasing.js"></script>
	<hr>
</body>
</html>