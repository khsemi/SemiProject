<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>
<%
	String user_nickname = request.getParameter("user_nickname");
%>
<body>
	<div class="container container-fluid">
		<form action="#" method="post">
			<div class="form-group">
				<label for="recive_user_id">받는 사람</label> <input id="recive_user_id"
					class="form-control" type="text" placeholder="<%=user_nickname %>" readonly>
			</div>
			<div class="form-group">
				<label for="note_title">쪽지 제목</label> <input id="note_title"
					type="text" class="form-control" placeholder="Text input">
			</div>
			<div class="form-group">
				<label for="note_content">쪽지 내용</label>
				<textarea id="note_content" class="form-control" rows="3"></textarea>
			</div>
			<button type="submit" class="btn btn-default">제출</button>
		</form>
	</div>
</body>
</html>