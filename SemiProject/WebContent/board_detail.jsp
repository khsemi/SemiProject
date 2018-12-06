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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
<input type="hidden" id="category" value="${boardDto.board_category }">
<input type="hidden" id="board_seq_id" value="${boardDto.board_seq_id }">
<div class="layout-container">
		<div id="main">
			<jsp:include page="sidebar.jsp"></jsp:include>
			<div class="form">
				<h2 class="title"> ${boardDto.board_category } </h2> 
				<div class="detail_info">
					댓글 : ${boardDto.comment_count } | 추천 : ${boardDto.favorite_count } | 조회 : ${boardDto.view_count }
					<span class="timeago">
						[ 작성일 : <fmt:formatDate value="${boardDto.board_regdate }" pattern="yy.MM.dd HH:mm" /> ]
					</span>
				</div>
				<form method="post" action="controller.do?category=board_insert">
				 	<table class="table" style="text-align:center; border:1px; solid #dddddd">
							<tr>
								<td><input name="categoryType" id="category" type="text" class="form-control" placeholder="분류" name="type" maxlength="50" readonly="readonly" value="${boardDto.board_category }"></td>
							</tr>
							<tr>
				 				<td><input type="text" class="form-control" placeholder="작성자" maxlength="50" readonly="readonly" value="${boardDto.user_nickname }"></td>
				 			</tr>		 		
				 			<tr>
				 				<td><input name="title" type="text" class="form-control" placeholder="제목" name="title" maxlength="50" readonly="readonly" value="${boardDto.board_title }"></td>
				 			</tr>
				 			<tr>	
				 				<td><textarea name="content" class="form-control" placeholder="내용" name="content" maxlength="2048" style="height:350px" readonly="readonly">${boardDto.board_content }</textarea> </td>
				 			</tr>
				 	</table>
				 	<!-- 로그인한 사람이 쓴 글일 경우에만 수정,삭제 버튼이 보이게 해준다. 또는 로그인한 계정의 타입이 admin일 경우에도 보인다. -->
				 	<c:if test="${userDto.user_seq == boardDto.user_seq || userDto.user_type == 'ADMIN'}">
					 	<input type="button" class="btn btn-outline-primary pull-right" value="수정" onclick="board_update()">
					 	<input type="button" class="btn btn-outline-primary pull-right" value="삭제" onclick="board_delete()">
				 	</c:if>
				</form>
				<hr class="my-4">
				<ul class="list-group">
					<!-- 댓글창 -->
					<c:forEach items="${commentList }" var="commentDto">
					<li class="list-group-item note-item clearfix">
						<div class="content-body panel-body pull-left">
							<div class="avatar avatar-medium clearfix ">
								<div class="avatar-info">
								${commentDto.user_nickname }
									<div class="date-created">
										<span class="timeago">
											<fmt:formatDate value="${commentDto.comment_regdate }" pattern="yy.MM.dd HH:mm" />
										</span>
									</div>
								</div>
							</div>
						<fieldset class="form">
							<article class="list-group-item-text note-text">
								${commentDto.comment_content }
								${commentDto.user_seq }
							</article>
						</fieldset>
						</div>
							<div class="content-function pull-right">
								<div class="content-function-group">
									<c:if test="${userDto.user_seq == commentDto.user_seq || userDto.user_type == 'ADMIN'}">
										<div class="note-evaluate-wrapper">
											<div class="content-function-cog note-submit-buttons clearfix">
												<input type="button" name="comment_insert" id="button" class="btn btn-success btn-wide" value="수정">
												<input type="button" name="comment_insert" id="button" class="btn btn-success btn-wide" value="삭제">
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${empty userDto }">
							<li class="list-group-item note-form clearfix">
								<div>
									로그인을 하시면 댓글을 달 수 있습니다.
								</div>
							</li>
						</c:when>
						<c:otherwise>
						<!-- 댓글 입력창 -->
							<li class="list-group-item note-form clearfix">
								<form id="commentInsert" action="controller.do?category=comment_insert" method="post" class="note-create-form">
									<input type="hidden" name="board_seq_id" value="${boardDto.board_seq_id }">
									<input type="hidden" name="user_seq" value="${userDto.user_seq }">
									<div class="content-body panel-body pull-left">
										<div style="margin-left: 5px;">
											<div class="avatar avatar-medium clearfix ">
												<div class="avatar-info">
													<div class="activity block">
														<span class="fa fa-flash">
															${userDto.user_nickname }
														</span>
													</div>
												</div>
											</div>
										</div>
										<fieldset class="form">
											<input type="hidden" name="note.textType" value="HTML" id="note.textType">
											<textarea name="comment_content" id="comment_content" placeholder="댓글 쓰기" class="form-control"></textarea>
										</fieldset>
									</div>
									<div class="content-function-cog note-submit-buttons clearfix">
										<input type="submit" name="comment_insert" id="btn-create-btn" class="btn btn-success btn-wide" value="등록">
									</div>
								</form>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>