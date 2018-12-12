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
function clickRow(board_seq_id, user_seq) {
	location.href="controller.do?category=board_detail&board_seq_id="+board_seq_id+"&user_seq="+user_seq;

}
</script>
<body>
<input type="hidden" id="totalCount" value='${totalCount }'>
<input type="hidden" id="page" value='${page }'>
<input type="hidden" id="user_seq" value='${page }'>


	<div class="layout-container">
	<jsp:include page="khc_mypage.jsp" />
		<div id="main">
			<div>
			<h2>내가 작성한 게시물</h2>
			<table class="table table-hover">
					
						<col width="50px">
						<col width="500px">
						<col width="80px">
						<col width="100px">
						<col width="10px">
						<col width="10px">
						<col width="10px">
						<thead>
							<tr>
								<th>번호 <th>제목 <th>작성자 <th>날짜 <th>댓글 <th>추천 <th>조회
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardList }">
									<tr>
										<td colspan="7" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise> 
									<c:forEach items="${boardList }" var="dto">
										<tr onclick="clickRow('${dto.board_seq_id}', '${userDto.user_seq }')">
											<td>${dto.board_seq_id } </td>
											<td>${dto.board_title }</td>
											<td>${dto.user_nickname } </td>
											<td><fmt:formatDate value="${dto.board_regdate }" pattern="yy.MM.dd HH:mm"/></td>
											<td>${dto.comment_count }</td>
											<td>${dto.favorite_count }</td>
											<td>${dto.view_count }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<nav aria-label="..." style="text-align: center;">
						<ul class="pagination" id="pasing"></ul>
					</nav>
			</div>
			</br></br></br>
			<hr>
			<footer class="footer">Team.진선이와 아이들 1, 2, 3, 4, 5, 6 </footer>
			</br></br></br>
		</div>
	</div>
</body>
</html>