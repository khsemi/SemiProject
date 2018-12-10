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
function openWin(btn){  
	window.open("noteSendingForm.jsp?user_nickname="+btn, "쪽지 보내기", "width=520, height=330, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  

}  
</script>
<body>


	<div class="layout-container">
		<jsp:include page="khc_mypage.jsp" />
		<div id="main">
			<!-- sidebar를 include해준다. -->

			<div class="container container-fluid">
				<h2>친구 찾기</h2>

			</div>
			
			<div class="container container-fluid">
				<form class="needs-validation" action="#" method="post">
					<input type="text" class="" placeholder="Search...">
					<button type="submit" class="btn">검색</button>
				</form>
				<table class="table table-hover">
					<col width="100px">
					<col width="100px">
					<col width="100px">

					<thead>
						<tr>
							<th>회원 목록</th>
							
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty userlist }">

							</c:when>
							<c:otherwise>
								<c:forEach items="${userlist }" var="dto">
									<tr>
										<td><img alt="프로필 사진" src="img/man.png" style="width: 50px;height: 60px;"></td>
										<td><a href="#"><strong Style="font-size: 18px;">${dto.user_nickname }</strong></a></td>
										<td><button class="btn" value="${dto.user_nickname }" onclick="openWin(this.value);" >
												<img src="img/sendingIcon.png" style="height: 30px;width: 30px;">&nbsp;쪽지보내기
											</button></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>

			</div>
			</br> </br> </br>
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