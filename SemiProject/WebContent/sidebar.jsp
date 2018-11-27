<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
</head>
<script type="text/javascript">
$(function(){
	var category = $("#category").val().split("_");
	
	if(category[0]=="QA"){
		$("#QA").addClass("active");
	}else if(category[0]=="STUDY"){
		$("#STUDY").addClass("active");
	}else if(category[0]=="TIPS"){
		$("#TIPS").addClass("active");
	}
})
</script>
<body>
	<div class="sidebar" style="text-align: center;">
		<div class="logo">
			<h1>KH</h1>
			<h3>커뮤니티</h3>
		</div>
		<div class="">로그인폼
		</div>
		<nav class="nav-sidebar">
			<ul class="nav nav-sidebar">
				<li id="test_board_select"><a href="sidebar.jsp">a</a></li>
				<li id="test_board_search"><a href="controller.do?category=testBoard&page=1"><span>메뉴</span></a></li>
				<!--  <li id="test_board"><a href="controller.do?category=testBoard&page=1">TEST_BOARD</a></li>-->
				<li id="QA"><a href="controller.do?category=QA&page=1">QA</a></li>
				<li id="STUDY"><a href="controller.do?category=STUDY&page=1">STUDY</a></li>
				<li id="TIPS"><a href="controller.do?category=TIPS&page=1">TIPS</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>