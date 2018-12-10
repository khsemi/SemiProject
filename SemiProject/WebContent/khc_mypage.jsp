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
</head>
<!-- 부트스트랩이 선언되기전에 jquery가 선언되어야한다. -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="css/bootstrap-theme.min.css">
<script
	src="js/bootstrap.min.js"></script>

<body>
	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<jsp:include page="sidebar.jsp" />
			<div class="form">
				<div class="container container-fluid">
					<h2>마이페이지</h2>
				</div>
				<div class="container container-fluid">
					<div class="jumbotron jumbotron-fluid">
						<h1 class="display"><img alt="프로필 사진" src="img/man.png" style="width: 150px;height: 170px;">&nbsp;${userDto.user_nickname }</h1>
						<!-- 유저 닉네임 -->

						<hr class="my-4">
						<p class="lead">
							<a href="controller.do?category=USER_INFO" type="button" class="btn btn-primary" >개인정보 조회/수정</a>
							<a href="controller.do?category=POINT" type="button" class="btn btn-primary">포인트 조회/결제</a>
							<a href="controller.do?category=FOODTICKET" type="button" class="btn btn-primary">식권</a>
							<a href="controller.do?category=NOTE" type="button" class="btn btn-primary">쪽지함</a>
							<a href="#" type="button" class="btn btn-primary">반게시판</a>
							<a href="#" type="button" class="btn btn-primary">캘린더</a>
							<a href="controller.do?category=PROFILESEARCH" type="button" class="btn btn-primary">친구 찾기</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="pasingInfo" style="text-align: center;"></div>
	<br>
	<script type="text/javascript" src="js/search.js"></script>
	<script type="text/javascript" src="js/pasing.js"></script>
	<hr>
</body>
</html>