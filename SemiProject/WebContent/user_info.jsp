<%@page import="semi.KHC.userDto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

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
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>

<body>


	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<jsp:include page="sidebar.jsp" />
			<div class="form">
				<div class="container container-fluid">
					<h2>유저 정보</h2>
				</div>
				<div>
					<table class="table" style="text-align: left;">
						<col width="10px">
						<col width="200px">
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">아이디
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${userDto.user_id }
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">이름
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${userDto.user_name }
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">닉네임
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${userDto.user_nickname }
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">주소
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${userDto.user_address }
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">이메일
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${userDto.user_email }
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">전화번호
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${userDto.user_phone }
						</tr>
					</table>
					<a class="btn btn-warning" href="controller.do?category=USER_UPDATEFORM">정보 수정</a>
					<a class="btn btn-warning" href="controller.do?category=USER_DELETE">회원 탈퇴</a>
					</br>
					</br>
					</br>
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