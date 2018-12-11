<%@page import="semi.KHC.userDto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/KHC.css">
<title>KH Community</title>
</head>
<!-- 부트스트랩이 선언되기전에 jquery가 선언되어야한다. -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function allChk(bool){
	var chks = document.getElementsByName("chk");
	for(var i = 0 ; i < chks.length ; i++){
		chks[i].checked=bool;
	}
}
function allChk1(bool){
	var chks = document.getElementsByName("chk1");
	for(var i = 0 ; i < chks.length ; i++){
		chks[i].checked=bool;
	}
}
//체크를 하나도 안하면 submit 이벤트 취소
//(유효값 처리)
$(function(){
	$("#notelist_recive").submit(function(){
		if($("#notelist_recive input:checked").length==0){
			alert("하나 이상 체크해 주세요!");
			return false;
		}
	});
	$("#notelist_send").submit(function(){
		if($("#notelist_send input:checked").length==0){
			alert("하나 이상 체크해 주세요!");
			return false;
		}
	});
	$("input[name=chk]").click(function(){
        if($("input[name=chk]:checked").length==$("input[name=chk]").length){
           $("input[name=all]").prop("checked",true);
        }else{
           $("input[name=all]").prop("checked",false);
        }
     });
	$("input[name=chk1]").click(function(){
        if($("input[name=chk1]:checked").length==$("input[name=chk1]").length){
           $("input[name=all1]").prop("checked",true);
        }else{
           $("input[name=all1]").prop("checked",false);
        }
     });
});

function openWin(btn){  
	window.open("controller.do?category=NOTEDETAIL&note_seq_id="+btn, "쪽지 읽기", "width=520, height=420, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  

}  
</script>
<body>


	<div class="layout-container">
	<jsp:include page="khc_mypage.jsp" />
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<div class="form">
				<div class="container container-fluid">
					<h2>쪽지함</h2>
				</div>
				<div class="container container-fluid">
					<!-- 					<div class="jumbotron jumbotron-fluid"> -->

					<div class="container container-fluid">
						<form action="#" method="post" id="notelist_recive">
						<table class="table table-hover row-clickable" id="tableId">
							<h6>받은 쪽지</h6>
							<col width="30px">
							<col width="50px">
							<col width="100px">
							<col width="300px">
							<col width="100px">

							<tr>
								<th><input type="checkbox" name="all1" onclick="allChk1(this.checked)" /></th>
								<th>번호
								<th>보낸 사람
								<th>제목
								<th>받은 날짜
							</tr>
							<tbody>
								<c:choose>
									<c:when test="${empty notelist }">
										<tr>
											<td colspan="5" align="center">===== 쪽지가 없습니다. =====</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${notelist }" var="dto">
											<c:if test="${dto.recive_user_id eq userDto.user_nickname}">
												<tr onClick="openWin('${dto.note_seq_id }');">
													<td><input type="checkbox" name="chk1" value="#" /></td>
													<td>${dto.note_seq_id }</td>
													<td>${dto.send_user_id }</td>
													<td>${dto.note_title }</td>
													<td><fmt:formatDate value="${dto.note_regdate }"
															pattern="yy.MM.dd HH:mm" /></td>
												</tr>
											</c:if>	
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
							<input type="submit" value="삭제" class="btn btn-primary"/>
						
						</form>
					</div>
					<hr class="my-4">
					<div class="container container-fluid">
						<form action="#" method="post" id="notelist_send">
						<table class="table table-hover">
							<h6>보낸 쪽지</h6>
							<col width="30px">
							<col width="50px">
							<col width="100px">
							<col width="300px">
							<col width="100px">

							<tr>
								<th><input type="checkbox" name="all" onclick="allChk(this.checked)" /></th>
								<th>번호
								<th>받은 사람
								<th>제목
								<th>보낸 날짜
							</tr>
							<tbody>
								<c:choose>
									<c:when test="${empty notelist }">
										<tr>
											<td colspan="5" align="center">===== 쪽지가 없습니다. =====</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${notelist }" var="dto">
											<c:if test="${dto.send_user_id eq userDto.user_nickname}">
												<tr onClick="openWin('${dto.note_seq_id }');">
													<td><input type="checkbox" name="chk" value="#" /></td>
													<td>${dto.note_seq_id }</td>
													<td>${dto.recive_user_id }</td>
													<td>${dto.note_title }</td>
													<td><fmt:formatDate value="${dto.note_regdate }"
															pattern="yy.MM.dd HH:mm" /></td>
												</tr>
											</c:if>	
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
							<input type="submit" value="삭제" class="btn btn-primary"/>
						
						</form>
						</br></br>
					</br></br>
					</div>
					<!-- 					</div> -->
					
				</div>

			</div>
			<footer class="footer">Team.진선이와 아이들 1, 2, 3, 4, 5, 6 </footer>
		</div>
	</div>

	<div id="pasingInfo" style="text-align: center;"></div>
	<br>
	<script type="text/javascript" src="js/search.js"></script>
	<script type="text/javascript" src="js/pasing.js"></script>
	<hr>
</body>
</html>