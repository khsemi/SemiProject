<%@page import="semi.KHC.userDto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

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

function signUpCheck() {
    var form = document.update_form;
    if(!form['pw'].value) {
        alert("패스워드를 입력해주세요");
        form['pw'].focus();
        return false;
    }
    if(!form['pw_check'].value) {
        alert("패스워드를 확인해주세요");
        form['pw_check'].focus();
        return false;
    }
    if(form['pw'].value != form['pw_check'].value) {
        alert("입력하신 패스워드와 패스워드 확인이 틀립니다.");
        form['pw_check'].focus();
        return false;
    }
    if(!form['nickname'].value) {
        alert("닉네임을 입력해주세요");
        form['nickname'].focus();
        return false;
    }
    if(!form['address'].value) {
        alert("주소를 입력해주세요");
        form['address'].focus();
        return false;
    }
    if(!form['phone'].value) {
        alert("전화번호를 입력해주세요");
        form['phone'].focus();
        return false;
    }
    alert("정보수정이 완료되었습니다. 다시 로그인 해주시기 바랍니다.");
}
</script>
<body>


	<div class="layout-container">
	<jsp:include page="khc_mypage.jsp" />
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<jsp:include page="sidebar.jsp" />
			<div class="form">
				<div class="container container-fluid">
					<h2>유저 정보 수정</h2>
				</div>
				<div>
				<form action="controller.do?category=USER_UPDATE" method="post" name="update_form" onsubmit="return signUpCheck();">
				<input type="hidden" name="user_seq" value="${userDto.user_seq }">
					<table class="table" style="text-align: left;">
					
						<col width="10px">
						<col width="200px">
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">아이디
							<td><input type="text" class="form" value="${userDto.user_id }" readonly="readonly"/>&nbsp;&nbsp;
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">패스워드
							<td><input name="pw" type="password" class="form" placeholder="패스워드"/>
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">
							<td><input name="pw_check" type="password" class="form" placeholder="패스워드확인"/> <!--패스워드 비교후 텍스트 출력 -->
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">이름
							<td><input type="text" class="form" value="${userDto.user_name }" readonly="readonly"/>
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">닉네임
							<td><input name="nickname" type="text" class="form" value="${userDto.user_nickname }"/>&nbsp;&nbsp;<button>중복 검사</button>
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">주소
							<td><input name="address" type="text" class="form" value="${userDto.user_address }"/>&nbsp;&nbsp;<button>주소 검색</button>
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">이메일
							<td><input type="text" class="form" value="${userDto.user_email }" readonly="readonly"/>
						</tr>
						<tr>
							<th style="background-color: #d4d4d4;text-align: center;">전화번호
							<td><input name="phone" type="text" class="form" value="${userDto.user_phone }"/>
						</tr>
					</table>
					<input type="submit" class="btn btn-warning" value="저장" />
					</br>
					</br>
					</br>
				</form>
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