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
<title>Insert title here</title>
<script type="text/javascript">

   function allChk(bool){
      var chks = document.getElementsByName("chk");
      for(var i=0; i<chks.length; i++){
         chks[i].checked=bool;
      }
   }
</script>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/KHC.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>
</head>
<body>

<div class="layout-container">
		<div id="main">
			<jsp:include page="sidebar.jsp"></jsp:include>
			<div class="form">

	<h1>일정 목록 보기</h1>

	<form action="controller.do" method="post">
		<input type="hidden" name="category" value="muldel"/>
		<input type="hidden" name="ymd" value="${ymd }"/>
		
		<jsp:useBean id="util" class="semi.KHC.calendarDao.Util"/>
		
			<table class="table" style=" border:1px; solid #dddddd">
			<col width="50px">
			<col width="50px">
			<col width="300px">
			<col width="200px">
			<col width="100px">
			
			<tr>
				<th><input type="checkbox" name="all" onclick="allChk(this.checked)" class="form-control"></th>
				<th>번호</th><th>제목</th><th>일정</th><th>작성일</th>
			</tr>
		
			<c:choose>
				<c:when test="${empty list }">
						<tr>
							<td colspan="5">-----일정이 업습니다</td>
						</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach items="${list }" var ="dto">
						<tr> 
							<td><input type="checkbox" class="form-control" name="chk" value="${dto.cal_seq_id }"></td>
							<td>${dto.cal_seq_id }</td>
							<td><a>${dto.cal_title }</a></td>
							<td>
								<jsp:setProperty property="toDate" name="util" value="${dto.cal_mdate }"/>
								
								<jsp:getProperty property="toDate"  name="util"/>
								
							</td>
							<td><fmt:formatDate  value="${dto.cal_regdate }" pattern="yyyy-MM-dd"/>
								</td>
							
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5">
					<input type="submit" value="삭제" class="btn btn-primary pull-right">
					<input type="button" value="달력보기" class="btn btn-primary pull-right" onclick="location.href='controller.do?category=CALENDAR'">
			</tr>
		</table>

		
	</form>
	</div>
	</div>
	</div>
	
</body>
</html>