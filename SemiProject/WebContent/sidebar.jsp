<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	}else if(category[0]=="NOTICE"){
		$("#NOTICE").addClass("active");
	}else if(category[0]=="COMMUNITY"){
		$("#COMMUNITY").addClass("active");
	}else if(category[0]=="TRADE"){
		$("#TRADE").addClass("active");
	}else if(category[0]=="JOBS"){
		$("#JOBS").addClass("active");
	}else if(category[0]=="FOODINFO"){
		$("#FOODINFO").addClass("active");
	}else if(category[0]=="LOGIN"){
		$("#LOGIN").addClass("active");
	}else if(category[0]=="MYPAGE"){
		$("#MYPAGE").addClass("active");
	}
})
</script>
<body>
	<input type="hidden" id="category" value='${category }'>
	<div class="sidebar" style="text-align: center;">
		<div class="logo">
			<h1 style="color: white;">KHC</h1>
		</div>

		<nav class="nav-sidebar">
			<ul class="nav nav-sidebar">
				<li id="MAIN"><a href="controller.do?category=MAIN"><span>Main</span></a></li>

				<c:choose>
					<c:when test="${empty userDto }">
						<li id="LOGIN"><a href="controller.do?category=LOGIN"><span>Login</span></a></li>
					</c:when>
					<c:otherwise>
						<li id="MYPAGE"><a href="controller.do?category=MYPAGE&page=1"><span>Mypage</span></a></li>
					</c:otherwise>
				</c:choose>


				<li id="NOTICE"><a href="controller.do?category=NOTICE&page=1&sortType=BOARD_REGDATE">Notice</a></li>
				<li id="COMMUNITY"><a href="controller.do?category=COMMUNITY&page=1&sortType=BOARD_REGDATE">Community</a></li>
				<li id="TRADE"><a href="controller.do?category=TRADE&page=1&sortType=BOARD_REGDATE">Trade</a></li>
				<li id="JOBS"><a href="controller.do?category=JOBS&page=1&sortType=BOARD_REGDATE">Jobs</a></li>
				<li id="QA"><a href="controller.do?category=QA&page=1&sortType=BOARD_REGDATE">QA</a></li>
				<li id="TIPS"><a href="controller.do?category=TIPS&page=1&sortType=BOARD_REGDATE">Tips</a></li>
				<li id="FOODINFO"><a href="controller.do?category=FOODINFO&page=1&sortType=BOARD_REGDATE">Food Info</a></li>
				<li id="STUDY"><a href="controller.do?category=STUDY&page=1&sortType=BOARD_REGDATE">Study</a></li>
				
			</ul>
		</nav>
		
	</div>
	
</body>
</html>