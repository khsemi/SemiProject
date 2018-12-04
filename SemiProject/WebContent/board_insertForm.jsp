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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
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
            fOnBeforeUnload : function(){
                
            }

        },
    	fOnAppLoad : function(){
        	//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
        	oEditors.getById["smarteditor"].exec("PASTE_HTML", ["<b>db</b>"]);
    	}
    });
    
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
      
        frames[0].window.document.getElementById("se2_iframe").contentWindow.document.body.innerHTML = message;
        //폼 submit
        $("#frm").submit();
    })
})

</script>
<body>
<input type="hidden" id="categoryVal" value="${category }">

<div class="layout-container">
		<div id="main">
			<jsp:include page="sidebar.jsp"></jsp:include>
			<div class="form">
				<h2> 글 입력 :: ${userDto.user_seq }</h2>
				<form id="frm" method="post" action="controller.do?category=board_insert">
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
				 				<td><textarea id="smarteditor" name="content" class="form-control" placeholder="내용" name="content" maxlength="2048" style="height:350px"></textarea> </td>
				 			</tr>	
				 	</table>
					<input type="submit" id="savebutton" class="btn btn-primary pull-right" value="글쓰기">
				</form>
			</div>
		</div>
	</div>
</body>
</html>