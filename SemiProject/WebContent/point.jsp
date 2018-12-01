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
					<h2>포인트 관리</h2>
				</div>
				<div class="container container-fluid">
					<div class="jumbotron jumbotron-fluid">
						<p>포인트 조회</p>
						<p>
							보유 포인트 : ${dto.user_nickname }
							
						</p>

						<div class="container container-fluid">
							<button type="button" class="btn btn-primary">반게시판</button>
							<button type="button" class="btn btn-primary">캘린더</button>

							<table class="table table-striped">
								<col width="50px">
								<col width="300px">
								<col width="80px">
								<col width="100px">
								<thead>
									<tr>
										<!-- searchForm -->
										<td colspan="4" align="right"><div id="search"></div></td>
									</tr>
								</thead>
								<tr>
									<th>번호
									<th>충전날짜
									<th>충전금액
									<th>상태
								</tr>
								<tbody>
									<c:choose>
										<c:when test="${empty boardList }">
											<tr>
												<td colspan="4" align="center">===== 충전내역이 없습니다. =====</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${pointlist }" var="dto">
												<tr>
													<td>${dto.point_seq_id }</td>
													<td><fmt:formatDate value="${dto.point_regdate }"
															pattern="yy.MM.dd HH:mm" /></td>
													<td>${dto.point_balance }</td>
													<td>${dto.point_state }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>

						</div>
						<hr class="my-4">
										<p>포인트 결제</p>
					
									</div>
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