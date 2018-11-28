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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
						<form method="post" action="joinAction.jsp">
							<h3 style="text-align: center;">회원가입 화면</h3>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디"
									name="userID" maxlength="20">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="userPassword" maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름"
									name="userName" maxlength="20">
							</div>
							<div class="form-group" style="text-align: center;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active"> <input
										type="radio" name="userGender" autocomplete="off" value="남자"
										checked>남자
									</label> <label class="btn btn-primary"> <input type="radio"
										name="userGender" autocomplete="off" value="여자">여자
									</label>
								</div>
							</div>
							<div class="form-group">
								<input type="email" class="form-control" placeholder="이메일"
									name="userEmail" maxlength="20">
							</div>
							<input type="submit" class="btn btn-primary form-control"
								value="회원가입">
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