<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1 style="color:red;">Error!!</h1>
	
	<%=request.getAttribute("msg") %>
	<a href = "controller.do?category=CALENDAR">처음으로...</a>
</body>
</html>