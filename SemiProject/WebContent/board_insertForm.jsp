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
<title>board insert</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	var category = $("#categoryVal").val().split("_");
	//input id = category 에 category[0]을 넣어준다.
	$("#categoryType").val(category[0]);
})
</script>
<body>
<input type="hidden" id="categoryVal" value="${category }">

<div class="layout-container">
		<div id="main">
			<jsp:include page="sidebar.jsp"></jsp:include>
			<div class="form">
				<h2> 글 입력 :: ${userDto.user_seq }</h2>
				<form method="post" action="controller.do?category=board_insert">
					<input type="hidden" name="user_seq" value="${userDto.user_seq }">
				 	<table class="table" style="text-align:center; border:1px; solid #dddddd">
							<tr>
								<td><input name="categoryType" id="categoryType" type="text" class="form-control" placeholder="분류" name="type" maxlength="50" readonly="readonly"></td>
							</tr>
							<tr>
				 				<td><input name="writer" type="text" class="form-control" placeholder="작성자" name="writer" maxlength="50" value="${userDto.user_nickname}" readonly="readonly"></td>
				 			</tr>		 		
				 			<tr>
				 				<td><input name="title" type="text" class="form-control" placeholder="제목" name="title" maxlength="50"></td>
				 			</tr>
				 			<tr>	
				 				<td><textarea name="content" class="form-control" placeholder="내용" name="content" maxlength="2048" style="height:350px"></textarea> </td>
				 			</tr>	
				 	</table>
					<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
				</form>
			</div>
		</div>
	</div>
</body>
</html>