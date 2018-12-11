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
<script type="text/javascript">
function CheckForm(Join){
    
    //체크박스 체크여부 확인 [하나]
    var test1=document.noteForm.note_title;
    var textarea1=document.noteForm.note_content;
    if (test1.value==""){
    	alert('제목을 작성해주세요.');
    	test1.focus();
    	return false;
    }
    
    if(textarea1.value==""){
        alert('내용을 작성해주세요.');
        textarea1.focus();
        return false;
    } 
}

</script>
<body>
	<div class="container container-fluid">
		<form action="controller.do?category=NOTESEND" method="post" name="noteForm" onSubmit="return CheckForm(this)">
		<input type="hidden" name="user_nickname" value="${userDto.user_nickname }">
			<div class="form-group">
				<label for="recive_user_id">받는 사람</label> <input id="recive_user_id" name="recive_user_id"
					class="form-control" type="text" value="${recive_user_id }" readonly>
			</div>
			<div class="form-group">
				<label for="note_title">쪽지 제목</label> <input id="note_title"
					type="text" class="form-control" name="note_title" placeholder="Text input">
			</div>
			<div class="form-group">
				<label for="note_content">쪽지 내용</label>
				<textarea id="note_content" class="form-control" name="note_content" rows="3"></textarea>
			</div>
			<button type="submit" class="btn btn-default" >제출</button>
		</form>
	</div>
</body>
</html>