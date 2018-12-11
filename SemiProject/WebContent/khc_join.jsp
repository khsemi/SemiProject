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
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- google -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="176135213372-ecvs65c2k7vbbdpp1hhgu6hqnf7sstoj.apps.googleusercontent.com">

<link rel="stylesheet" type="text/css" href="css/KHC.css">
<title>KH Community</title>
<!-- 다음도로명주소사용시 필요 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript"
	src="http://t1.daumcdn.net/postcode/api/core/180928/1538455030985/180928.js"></script>
<script>
	function roadaddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 도로명 주소 값 얻어오기
				document.getElementById('roadAddress').value = fullRoadAddr;

			}
		}).open();

	}
</script>
</head>
<!-- 구글로그인api -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- 부트스트랩이 선언되기전에 jquery가 선언되어야한다. -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<body>

	<div class="layout-container">
		<div id="main">
			<!-- sidebar를 include해준다. -->
			<jsp:include page="sidebar.jsp" />
			<div class="form">
				<h2>회원가입 페이지</h2>
			</div>

			<div class="container">
				<div class="col-lg-4"></div>
				<div class="col-lg-4">
					<div class="jumbotron" style="padding-top: 20px;">
						<!-- <form method="post" action="userRegisterAction.jsp"> -->
						<form method="post" action="controller.do?category=user_insert">
							<h3 style="text-align: center;">회원가입 화면</h3>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디"
									name="user_id" maxlength="20">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="user_pw" maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름"
									name="user_name" id="name" maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="닉네임"
									name="user_nickname" id="nickname" maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="roadAddress"
									placeholder="주소" name="user_address" maxlength="20"
									readonly="readonly"> &nbsp <input type="button"
									value="주소검색" class="btn btn-primary form-control"
									onclick="roadaddr()">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이메일"
									name="user_email" id="email" maxlength="25">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="전화번호"
									name="user_phone" maxlength="20">
							</div>

							<input type="submit" class="btn btn-primary form-control"
								value="회원가입">

						</form>
					</div>
					<div class="jumbotron" style="padding-top: 20px;">
						<form method="post" action="KHC.jsp">
							<h3 style="text-align: center;">SNS 로그인</h3>
							<!-- kakao login -->
							<a id="kakao-login-btn"></a> <a
								href="http://developers.kakao.com/logout"></a>
							<script type='text/javascript'>
								//<![CDATA[
								// 사용할 앱의 JavaScript 키를 설정해 주세요.
								//3853ad64b43b2a8cba8111cf4b7be9b4
								Kakao.init('3853ad64b43b2a8cba8111cf4b7be9b4');
								// 카카오 로그인 버튼을 생성합니다.
								Kakao.Auth
										.createLoginButton({
											container : '#kakao-login-btn',
											success : function(authObj) {
												// 로그인 성공시, API를 호출합니다.
												Kakao.API
														.request({
															url : '/v2/user/me',
															success : function(
																	res) {
																//alert(JSON.stringify(res));
																document
																		.getElementById("nickname").value = res.properties.nickname;
															},
															fail : function(
																	error) {
																alert(JSON
																		.stringify(error));
															}
														});
											},
											fail : function(err) {
												alert(JSON.stSringify(err));
											}
										});
								//]]>
							</script>
							&nbsp
							<!-- google login -->
							<div class="g-signin2" data-width="220" data-height="50"
								data-onsuccess="onSignIn" data-theme="dark"></div>
							<script>
								function onSignIn(googleUser) {
									// Useful data for your client-side scripts:
									var profile = googleUser.getBasicProfile();
									console.log("ID: " + profile.getId()); // Don't send this directly to your server!
									console.log('Full Name: '
											+ profile.getName());
									console.log('Given Name: '
											+ profile.getGivenName());
									console.log('Family Name: '
											+ profile.getFamilyName());
									console.log("Image URL: "
											+ profile.getImageUrl());
									console.log("Email: " + profile.getEmail());

									document.getElementById("name").value = profile
											.getName();
									document.getElementById("email").value = profile
											.getEmail();

									var id_token = googleUser.getAuthResponse().id_token;
									console.log("ID Token: " + id_token);
								};
							</script>
							&nbsp
							<!--naver login -->
							<div id="naver_id_login"></div>
							<script type="text/javascript">
								//"E5rJW2stR52BfztsAF_h","http://localhost:8787/SemiProject/khc_join.jsp"
								var naver_id_login = new naver_id_login(
										"E5rJW2stR52BfztsAF_h",
										"http://localhost:8787/SemiProject/khc_join.jsp");
								var state = naver_id_login.getUniqState();
								naver_id_login.setButton("green", 2.5, 48);
								naver_id_login
										.setDomain("http://localhost:8787/SemiProject/khc_join.jsp");
								naver_id_login.setState(state);
								naver_id_login.init_naver_id_login();
							</script>
							<script type="text/javascript">
								function naverSignInCallback() {
									document.getElementById("name").value = naver_id_login
											.getProfileData('name');
									document.getElementById("email").value = naver_id_login
											.getProfileData('email');
								}

								naver_id_login
										.get_naver_userprofile("naverSignInCallback()");
							</script>
							&nbsp
							<!-- facebook login -->
							<div id="fb_id_login"></div>
							<script>
								function statusChangeCallback(response) {
									if (response.status === 'connected') {
										testAPI();
									}
								}

								function checkLoginState() {
									FB.getLoginStatus(function(response) {
										statusChangeCallback(response);
									});
								}

								window.fbAsyncInit = function() {
									FB.init({
										appId : '325126211551688',
										cookie : true, // enable cookies to allow the server to access the session
										xfbml : true, // parse social plugins on this page
										version : 'v2.8' // use graph api version 2.8
									});

									FB.getLoginStatus(function(response) {
										statusChangeCallback(response);
									});

								};

								(function(d, s, id) {
									var js, fjs = d.getElementsByTagName(s)[0];
									if (d.getElementById(id))
										return;
									js = d.createElement(s);
									js.id = id;
									js.src = "https://connect.facebook.net/en_US/sdk.js";
									fjs.parentNode.insertBefore(js, fjs);
								}(document, 'script', 'facebook-jssdk'));

								function testAPI() {
									FB
											.api(
													'/me',
													{
														fields : 'email,name'
													},
													function(response) {
														document
																.getElementById('name').value = response.name;
													});
								}

								var finished_rendering = function() {
									var spinner = document
											.getElementById("spinner");
									spinner.removeAttribute("style");
									spinner.removeChild(spinner.childNodes[0]);
								}
								FB.Event.subscribe('xfbml.render',
										finished_rendering);
							</script>
							<div class="fb-login-button" data-max-rows="1" data-size="large"
								data-width="220" data-height="50"
								data-button-type="continue_with" data-use-continue-as="true"></div>
						</form>

					</div>
				</div>
			</div>
			</br>
			</br>
			</br>
			<hr>
			<footer class="footer">Team.진선이와 아이들 1, 2, 3, 4, 5, 6 </footer>
			</br>
			</br>
			</br>
		</div>
	</div>
</body>
</html>