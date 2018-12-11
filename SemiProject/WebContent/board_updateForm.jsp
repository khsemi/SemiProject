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
<title>board update</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function board_cancel(){
	var check = confirm("글 수정을 '취소' 하시겠습니까?");
	if(check == true){
		location.href="controller.do?category=board_detail&board_seq_id="+$("#board_seq_id").val()+"&user_seq="+$("#user_seq").val();
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
				<form method="post" action="controller.do?category=board_update" id="board_updateForm">
					<input type="hidden" name="board_seq_id" id="board_seq_id" value="${dto.board_seq_id }">
					<input type="hidden" id="user_seq"	value="${userDto.user_seq }">
				 	<table class="table" style="text-align:center; border:1px; solid #dddddd">
							<tr>
								<td><input name="categoryType" id="category" type="text" class="form-control" placeholder="분류" name="type" maxlength="50" readonly="readonly" value="${dto.board_category }"></td>
							</tr>
							<tr>
				 				<td><input name="user_seq" type="text" class="form-control" placeholder="작성자" name="user_seq" maxlength="50" readonly="readonly" value="${dto.user_seq }"></td>
				 			</tr>		 		
				 			<tr>
				 				<td><input name="title" type="text" class="form-control" placeholder="제목" name="title" maxlength="50" value="${dto.board_title }"></td>
				 			</tr>
				 			<tr>	
				 				<td><textarea name="content" class="form-control" placeholder="내용" name="content" maxlength="2048" style="height:350px">${dto.board_content }</textarea> </td>
				 			</tr>	
				 	</table>
				 	<input type="submit" class="btn btn-primary pull-right" value="완료" >
				 	<input type="button" class="btn btn-primary pull-right" value="취소" onclick="board_cancel()">
				</form>
			</div>
		</div>
	</div>
</body>
</html>