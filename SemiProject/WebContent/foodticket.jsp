<%@page import="java.util.List"%>
<%@page import="semi.KHC.foodticketDto.FoodticketDto"%>
<%@page import="semi.KHC.foodticketDao.FoodticketDao"%>
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
	function CheckForm(Join) {

		//체크박스 체크여부 확인 [하나]
		var chk1 = document.payment.paymentCheck;
		var select1 = document.payment.foodticket_name;
		if (select1.value == "") {
			alert('구매할 식권을 선택해주세요.');
			select1.focus();
			return false;
		}

		if (!chk1.checked) {
			alert('구매 동의를 체크해 주세요');
			chk1.focus();
			return false;
		}
	}
</script>
<body>

	<div class="layout-container">
	<jsp:include page="khc_mypage.jsp" />
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<div class="form">
				<div class="container container-fluid">
					<h2>식권 관리</h2>
				</div>
				<div class="container container-fluid">
					<p>식권 조회</p>

					<div class="container container-fluid">

						<table class="table table-striped">
							<h6>보유 식권 목록</h6>
							<col width="80px">
							<col width="150px">
							<col width="150px">
							<col width="100px">
							<col width="70px">

							<tr>
								<th>식권 아이디</th>
								<th>식당 이름</th>
								<th>QR쿠폰</th>
							</tr>
							<tbody>


								<c:choose>
									<c:when test="${empty foodlist }">
										<tr>
											<td colspan="3" align="center">===== 보유 식권이 없습니다. =====</td>

										</tr>
									</c:when>

									<c:otherwise>
										<c:forEach items="${foodlist }" var="dto">
											<tr>
												<td>${dto.foodticket_seq_id }</td>
												<td>${dto.foodticket_name }</td>
												<td><a type="button" href="http://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=${dto.foodticket_qrcode }">${dto.foodticket_qrcode }</a>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

					</div>

					<hr class="my-4">




					<p>식권 구매</p>
					<p>보유 포인트 : ${point }</p>
					<div class="container">
						<div class="col-md-8 order-md-1">
							<form class="needs-validation" method="post" action="controller.do?category=FOODTICKET_INSERT" name="payment" onSubmit="return CheckForm(this)">
							<input type="hidden" name="point" value="${point }">
								<div class="form-group">

									<labelfor="foodticket">식권 선택</label> 
									<select class="form-control form-control-lg" name="foodticket_name">
										<option value="">구매할 식권을 선택해주세요.</option>
										<option value="맥주창고_4000">맥주창고 : 4000point</option>
										<option value="7그램 커피_2000">7그램 커피 : 2000point</option>
									</select>
								</div>
								<div class="form-group form-check">
									<input type="checkbox" class="form-check-input" id="paymentCheck" name="paymentCheck"> 
										<label class="form-check-label" for="paymentCheck"> 식권 구매 진행에 동의합니다.</label>
								</div>

								<button type="submit" class="btn btn-primary mb-2">구입하기</button>
								</br> </br> </br>
							</form>

						</div>
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