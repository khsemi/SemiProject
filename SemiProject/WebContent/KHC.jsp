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
<style type="text/css">

</style>
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
	<input type="hidden" id="category" value='${category }'>
	
	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<jsp:include page="sidebar.jsp" />
			<div class="container">
			<div class="form">
				<h2>메인페이지</h2></br></br>
				<!-- 메인페이지에 표시될 게시판들을 div와 table을 이용해서 코딩하면된다. -->
				<p><strong>로그인 정보</strong></p>
				<!-- 세션에 담긴 정보는 불러온다. -->
				<c:choose>
					<c:when test="${empty userDto }">
						<p>로그인을 해주세요!!</p>
					</c:when>
					<c:otherwise>
						<p>${userDto.user_nickname }님 안녕하세요!!</p>
						<p>아이디 : ${userDto.user_id }</p>
						<a class="btn btn-defult" type="button" href="controller.do?category=LOGOUT">로그아웃</a>
					</c:otherwise>
				</c:choose>
				
			</div></br></br>
			</div>
			

			<div class="row marketing">
				<div class="col-lg-6">
					<h4>Notice</h4>
					<table class="table table-hover">

						<col width="50px">
						<col width="500px">
						<col width="80px">
						<thead>
							<tr>
								<th>번호
								<th>제목
								<th>작성자
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardlist }">
									<tr>
										<td colspan="3" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardlist }" var="dto" >
										<c:if test="${dto.board_category eq 'NOTICE'}">
										<tr onclick="clickRow('${dto.board_seq_id}', '${userDto.user_seq }')">
											<td>${dto.board_seq_id }</td>
											<td>${dto.board_title }</td>
											<td>${dto.user_nickname }</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>

					<h4>Community</h4>
					<table class="table table-hover">

						<col width="50px">
						<col width="500px">
						<col width="80px">
						<thead>
							<tr>
								<th>번호
								<th>제목
								<th>작성자
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardlist }">
									<tr>
										<td colspan="3" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardlist }" var="dto" >
										<c:if test="${dto.board_category eq 'COMMUNITY'}">
										<tr onclick="clickRow('${dto.board_seq_id}', '${userDto.user_seq }')">
											<td>${dto.board_seq_id }</td>
											<td>${dto.board_title }</td>
											<td>${dto.user_nickname }</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<h4>Trade</h4>
					<table class="table table-hover">

						<col width="50px">
						<col width="500px">
						<col width="80px">
						<thead>
							<tr>
								<th>번호
								<th>제목
								<th>작성자
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardlist }">
									<tr>
										<td colspan="3" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardlist }" var="dto" >
										<c:if test="${dto.board_category eq 'TRADE'}">
										<tr onclick="clickRow('${dto.board_seq_id}', '${userDto.user_seq }')">
											<td>${dto.board_seq_id }</td>
											<td>${dto.board_title }</td>
											<td>${dto.user_nickname }</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<h4>Jobs</h4>
					<table class="table table-hover">

						<col width="50px">
						<col width="500px">
						<col width="80px">
						<thead>
							<tr>
								<th>번호
								<th>제목
								<th>작성자
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardlist }">
									<tr>
										<td colspan="3" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardlist }" var="dto" >
										<c:if test="${dto.board_category eq 'JOBS'}">
										<tr onclick="clickRow('${dto.board_seq_id}', '${userDto.user_seq }')">
											<td>${dto.board_seq_id }</td>
											<td>${dto.board_title }</td>
											<td>${dto.user_nickname }</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<div class="col-lg-6">
					<h4>QA</h4>
					<table class="table table-hover">

						<col width="50px">
						<col width="500px">
						<col width="80px">
						<thead>
							<tr>
								<th>번호
								<th>제목
								<th>작성자
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardlist }">
									<tr>
										<td colspan="3" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardlist }" var="dto" >
										<c:if test="${dto.board_category eq 'QA'}">
										<tr onclick="clickRow('${dto.board_seq_id}', '${userDto.user_seq }')">
											<td>${dto.board_seq_id }</td>
											<td>${dto.board_title }</td>
											<td>${dto.user_nickname }</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>

					<h4>Tips</h4>
					<table class="table table-hover">

						<col width="50px">
						<col width="500px">
						<col width="80px">
						<thead>
							<tr>
								<th>번호
								<th>제목
								<th>작성자
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardlist }">
									<tr>
										<td colspan="3" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardlist }" var="dto" >
										<c:if test="${dto.board_category eq 'TIPS'}">
										<tr onclick="clickRow('${dto.board_seq_id}', '${userDto.user_seq }')">
											<td>${dto.board_seq_id }</td>
											<td>${dto.board_title }</td>
											<td>${dto.user_nickname }</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>

					<h4>Food Info</h4>
					<table class="table table-hover">

						<col width="50px">
						<col width="500px">
						<col width="80px">
						<thead>
							<tr>
								<th>번호
								<th>제목
								<th>작성자
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardlist }">
									<tr>
										<td colspan="3" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardlist }" var="dto" >
										<c:if test="${dto.board_category eq 'FOODINFO'}">
										<tr onclick="clickRow('${dto.board_seq_id}', '${userDto.user_seq }')">
											<td>${dto.board_seq_id }</td>
											<td>${dto.board_title }</td>
											<td>${dto.user_nickname }</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<h4>Study</h4>
					<table class="table table-hover">

						<col width="50px">
						<col width="500px">
						<col width="80px">
						<thead>
							<tr>
								<th>번호
								<th>제목
								<th>작성자
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardlist }">
									<tr>
										<td colspan="3" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardlist }" var="dto">
										<c:if test="${dto.board_category eq 'STUDY'}">
										<tr onclick="clickRow('${dto.board_seq_id}', '${userDto.user_seq }')">
											<td>${dto.board_seq_id }</td>
											<td>${dto.board_title }</td>
											<td>${dto.user_nickname }</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			</br></br></br>
			<hr>
			<footer class="footer">Team.진선이와 아이들 1, 2, 3, 4, 5, 6 </footer>
			</br></br></br>
		</div>
	</div>

</body>
</html>