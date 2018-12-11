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
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>
 
<script type="text/javascript">
function board_cancel(){
	var check = confirm("글 수정을 '취소' 하시겠습니까?");
	if(check == true){
		location.href="controller.do?category=board_detail&board_seq_id="+$("#board_seq_id").val();
	}else {
		return false;
	}
}

$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "dist/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);

        //폼 submit
        $("#frm").submit();
    })

})

	function Popup(){
		var message = "<div style='background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span  style='color: #e6db74'>"+ "<xmp>"+" "+"</xmp>" + "</span></pre></div>" + "&nbsp" ;

		frames[0].window.document.getElementById("se2_iframe").contentWindow.document.body.innerHTML+=message;
		//frames[0].window.document.getElementById("se2_iframe").contentWindow.document.body.innerHTML=message;
	
	
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
				<form method="post" id="frm" action="controller.do?category=board_update" id="board_updateForm">
					<input type="hidden" name="board_seq_id" id="board_seq_id" value="${dto.board_seq_id }">
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
				 				<td><textarea name="content" id="smarteditor" class="form-control" placeholder="내용" name="content" maxlength="2048" style="height:350px">${dto.board_content }</textarea> </td>
				 			</tr>	
				 	</table> 
				 	<input type="submit" class="btn btn-primary pull-right" value="완료" id="savebutton" >
				 	<input type="button" class="btn btn-primary pull-right" value="취소" onclick="board_cancel()">
				 	<input type="button" value="코드" class="btn btn-primary pull-right" onclick="Popup()">
				 	
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