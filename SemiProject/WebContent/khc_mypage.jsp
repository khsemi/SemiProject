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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<body>
	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<jsp:include page="sidebar.jsp" />
			<div class="form">
				<div class="container container-fluid">
					<h2>마이페이지</h2>
				</div>
				<div class="container container-fluid">
					<div class="jumbotron jumbotron-fluid">
						<h1 class="display">${userDto.user_nickname }</h1>
						<!-- 유저 닉네임 -->

						<hr class="my-4">
						<p class="lead">
							<a type="button" class="btn btn-primary" >개인정보 조회/수정</a>
							<a href="controller.do?category=POINT"type="button" class="btn btn-primary">포인트 조회/결제</a>
							<a type="button" class="btn btn-primary">식권</a>
							<a type="button" class="btn btn-primary">쪽지함</a>
						</p>
					</div>
				</div>

				<div class="container container-fluid">
					<button type="button" class="btn btn-primary">반게시판</button>
					<button type="button" class="btn btn-primary">캘린더</button>
					
					<table class="table table-striped">
						<col width="50px">
						<col width="50px">
						<col width="300px">
						<col width="80px">
						<col width="100px">
						<thead>
							<tr>
								<!-- searchForm -->
								<td colspan="5" align="right"><div id="search"></div></td>
							</tr>
						</thead>
							<tr>
								<th>번호
								<th>카테고리
								<th>제목
								<th>작성자
								<th>날짜
							</tr>
						<tbody>
							<c:choose>
								<c:when test="${empty boardList }">
									<tr>
										<td colspan="5" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardList }" var="dto">
										<tr>
											<td>${dto.board_seq_id }</td>
											<td>${dto.board_category }</td>
											<td><a href="controller.do?category=board_detail&board_seq_id=${dto.board_seq_id}">${dto.board_title }</a></td>
											<td>${dto.user_nickname }</td>
											<td><fmt:formatDate value="${dto.board_regdate }"
													pattern="yy.MM.dd HH:mm" /></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<!-- pasing -->
					<nav aria-label="..." style="text-align: center;">
						<ul class="pagination" id="pasing"></ul>
					</nav>
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