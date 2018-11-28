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
<title>board</title>
</head>
<!-- 부트스트랩이 선언되기전에 jquery가 선언되어야한다. -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(function() {
		//category 값을 split 해주는 이유는 검색을 한번 하면, category값에 "_search"라는 값이 붙어서
		//category 값이 넘어오기때문에, 검색 한 후 재검색을 하기위해서 여기서 split으로 "_"를 나눠 사용
		var category = $("#category").val().split("_");
		$("#categoryView").append(
				"<h2><a href='controller.do?category=" + category[0]
						+ "&page=1'>" + category[0] + "</a></h2>");

	})
	//글쓰기 버턴을 누르면 실행되는 insert() 함수 
	function board_insert() {
		var category = $("#category").val().split("_");
		location.href = "controller.do?category=" + category[0] + "_insertForm";
	}
</script>
<body>

<!-- search,pasing에 필요한 값들을 controller 에서 받아와, hidden값으로 선언하여, search.js, pasing.js에서 사용할 수 있게 한다. -->
<input type="hidden" id="totalCount" value='${totalCount }'>
<input type="hidden" id="page" value='${page }'>
<input type="hidden" id="category" value='${category }'>
<input type="hidden" id="searchType" value='${searchType }'>
<input type="hidden" id="keyword" value='${keyword }'>
				
	<div class="layout-container">
		<div id="main">
		<div id="categoryView"></div>
			<!-- sidebar를 include해준다. -->
			<jsp:include page="sidebar.jsp"/>
			<div class="form">
				<!-- 내가 보고있는 게시판 TABLE(DB)의 카테고리 컬럼(즉, command가 된다) -->
<%-- 				<h2>${command }</h2> --%>
				
					<!-- 어떠한 테이블의 리스트를 받아와도 똑같은 모양으로 출력한다. -->
					<table class="table table-striped">
					
						<col width="50px">
						<col width="500px">
						<col width="80px">
						<col width="100px">
						<thead>
						<tr><!-- searchForm -->
							<td colspan="4" align="right"><div id="search"></div></td>
						</tr>	
						</thead>
						
							<tr>
								<th>번호 <th>제목 <th>작성자 <th>날짜
							</tr>
						
						<tbody>
							<c:choose>
								<c:when test="${empty boardList }">
									<tr>
										<td colspan="4" align="center">===== 글이 없습니다 =====</td>
									</tr>
								</c:when>
								<c:otherwise> 
									<c:forEach items="${boardList }" var="dto">
										<tr>
											<td>${dto.board_seq_id } </td>
											<td><a href="controller.do?category=board_detail&board_seq_id=${dto.board_seq_id}">${dto.board_title }</a></td>
											<td>${dto.user_seq } </td>
											<td><fmt:formatDate value="${dto.board_regdate }" pattern="yy.MM.dd HH:mm"/></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<input type="button" class="btn btn-primary pull-right" value="글쓰기" onclick="board_insert()">
					<!-- pasing -->
					<nav aria-label="..." style="text-align: center;">
						<ul class="pagination" id="pasing"></ul>
					</nav>
					
					<a href="test_board_select.jsp">글입력/글보기</a>
					
				</div>
				<footer class="footer">Team.진선이와 아이들
									1, 2, 3, 4, 5, 6
				</footer>
			</div>
		</div>
	
	<div id="pasingInfo" style="text-align: center;"></div>
	<br>
	<script type="text/javascript" src="js/search.js"></script>
	<script type="text/javascript" src="js/pasing.js"></script>
</body>
</html>