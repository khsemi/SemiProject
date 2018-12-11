<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/KHC.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>

</head>
<%
   int year = Integer.parseInt(request.getParameter("year"));
   int month = Integer.parseInt(request.getParameter("month"));
   int date = Integer.parseInt(request.getParameter("date"));
   int lastday = Integer.parseInt(request.getParameter("lastday"));
   
   Calendar cal = Calendar.getInstance();
   int hour = cal.get(Calendar.HOUR_OF_DAY);
   int min = cal.get(Calendar.MINUTE);
   
  
%>
<body>
	<div class="layout-container">
		<div id="main">
			<jsp:include page="sidebar.jsp"></jsp:include>
			<div class="form">

				<h1>일정 작성</h1>

				<form action="controller.do" method="post">
					<input type="hidden" name="category" value="insertcal" />
					<table class="table" style="border: 1px;">
						<tr>
							<th>닉네임</th>
							<td class="form-control">${userDto.user_nickname }</td>
						</tr>
						<tr>
							<th>일정</th>
							<td class="form-control"><select name="year">
									<%
               for(int i=year-5; i<year+5;i++){

%>
									<option value="<%=i %>" <%=(year==i)?"selected":"" %>><%=i %></option>
									<%    
               }
%>

							</select>년 <select name="month">
									<%                
               for(int i=1;i<=12;i++){
%>
									<option value="<%=i%>" <%=(month==i)?"selected":"" %>><%=i %></option>
									<%
               }
%>
							</select>월 <select name="date">
									<%
               for(int i=1; i<=lastday;i++){

%>
									<option value="<%=i %>" <%=(date==i)?"selected":"" %>><%=i %></option>
									<%    
               }
%>
							</select>일 <select name="hour">
									<%
               for(int i=1; i<=24;i++){
%>
									<option value="<%=i %>" <%=(hour==i)?"selected":"" %>><%=i %></option>
									<%                   
               }
%>
							</select>시 <select name="min">
									<%
               for(int i=0; i<=60;i++){
%>
									<option value="<%=i %>" <%=(min==i)?"selected":"" %>><%=i %></option>
									<%                   
               }
%>
							</select>분</td>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" class="form-control"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="10" cols="60" name="content"
									class="form-control"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit"
								class="btn btn-primary pull-right" value="일정작성" /> <input
								type="button" class="btn btn-primary pull-right" value="돌아가기"
								onclick="location.href='controller.do?category=CALENDAR'" /></td>
						</tr>
					</table>
				</form>
			</div>
			</br></br></br>
			<hr>
			<footer class="footer">Team.진선이와 아이들 1, 2, 3, 4, 5, 6 </footer>
			</br></br></br>
		</div>
	</div>

</body>
</html>