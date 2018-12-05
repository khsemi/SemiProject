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
<title>board detail</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function board_update(){
	location.href="controller.do?category=board_updateForm&board_seq_id="+$("#board_seq_id").val();
}
function board_delete(){
	var check = confirm("글을 '삭제' 하시겠습니까?");
	if(check == true){
		var category = $("#categoryVal").val().split("_");
		location.href="controller.do?category=board_delete&board_seq_id="+$("#board_seq_id").val()+"&categoryType="+category;
	}else {
		return false;
	}
}
</script>
<body>
<input type="hidden" id="category" value="${dto.board_category }">
<input type="hidden" id="board_seq_id" value="${dto.board_seq_id }">
<div class="layout-container">
		<div id="main">
			<jsp:include page="sidebar.jsp"></jsp:include>
			<div class="form">
				<h2> ${dto.board_category } </h2>
				<form method="post" action="controller.do?category=board_insert">
				 	<table class="table" style="text-align:left; border:2px; solid #dddddd">
							<tr>
								<td><input name="categoryType" id="category" type="text" class="form-control" placeholder="분류" name="type" maxlength="50" readonly="readonly" value="${dto.board_category }"></td>
							</tr>
							<tr>
				 				<td><input type="text" class="form-control" placeholder="작성자" maxlength="50" readonly="readonly" value="${dto.user_nickname }"></td>
				 			</tr>		 		
				 			<tr>
				 				<td><input name="title" type="text" class="form-control" placeholder="제목" name="title" maxlength="50" readonly="readonly" value="${dto.board_title }"></td>
				 			</tr>
				 			<tr>	
				 				<td><div class="form-control" style="height:auto; width:1050px;">${dto.board_content }</div> </td>
				 			</tr> 
				 	</table>
				 	<!-- 로그인한 사람이 쓴 글일 경우에만 수정,삭제 버튼이 보이게 해준다. 또는 로그인한 계정의 타입이 admin일 경우에도 보인다. -->
				 	<c:if test="${userDto.user_seq == dto.user_seq || userDto.user_type == 'ADMIN'}">
					 	<input type="button" class="btn btn-outline-primary pull-right" value="수정" onclick="board_update()">
					 	<input type="button" class="btn btn-outline-primary pull-right" value="삭제" onclick="board_delete()">
				 	</c:if> 
				</form>
			</div>
		</div>
	</div>
</body>
</html>