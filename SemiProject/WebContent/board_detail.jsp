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
<title>board detail</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#comment_delete_form").submit(function(){
		var check = confirm("댓글을 '삭제' 하시겠습니까?");
		if(check == true){
			return true;
		}else{
			console.log("test");
			return false;
		}
	});
});

function board_update(){
	location.href="controller.do?category=board_updateForm&board_seq_id="+$("#board_seq_id").val();
}
function board_delete(){
	var check = confirm("글을 '삭제' 하시겠습니까?");
	if(check == true){
		var category = $("#category").val().split("_");
		location.href="controller.do?category=board_delete&board_seq_id="+$("#board_seq_id").val()+"&categoryType="+category[0]+"&maps_id="+$("#maps_id").val();
	}else {
		return false;
	}
}

function comment_delete(comment_seq_id){
	alert(comment_seq_id);
}

function favorite_up(){
	if($("#user_seq").val() == 0){
		var loginGo = confirm("로그인이 필요합니다. \n로그인 창으로 갈까요?");
		if(loginGo == true){
			location.href="controller.do?category=LOGIN";
			return false;
		}else{
			return false;
		}
	}
	if($("#favorite_check").val() == 0){
		$("#favorite_check").val(1);
		$.ajax({
			url:"ajax.do",
			type:"post",
			data:{
				category : "favorite_up",
				board_seq_id : $("#board_seq_id").val(),
				user_seq : $("#user_seq").val(),
			},
			success:function(){
				alert("추천하였습니다!");
				$("#favorite").val(Number($("#favorite").val())+1);
			},
			error:function(){	
				alert("추천/비추천 오류!");
			}
		})
	}else if($("#favorite_check").val() == 1){
		var check = confirm("추천을 취소하시겠습니까?");
		if(check == true){
			$("#favorite_check").val(0);
			$.ajax({
				url:"ajax.do",
				type:"post",
				data:{
					category : "favorite_delete",
					board_seq_id : $("#board_seq_id").val(),
					user_seq : $("#user_seq").val(),
				},
				success:function(){
					alert("추천을 취소하였습니다.");
					$("#favorite").val(Number($("#favorite").val())-1);
				},
				error:function(){	
					  alert("실패");
				}
			})
		}else {
			return false;
		}
	}
}

function favorite_down(){
	if($("#user_seq").val() == 0){
		var loginGo = confirm("로그인이 필요합니다. \n로그인 창으로 갈까요?");
		if(loginGo == true){
			location.href="controller.do?category=LOGIN";
			return false;
		}else{
			return false;
		}
	}
	if($("#favorite_check").val() == 0){
		$("#favorite_check").val(-1);
		$.ajax({
			url:"ajax.do",
			type:"post",
			data:{
				category : "favorite_down",
				board_seq_id : $("#board_seq_id").val(),
				user_seq : $("#user_seq").val(),
			},
			success:function(){
				alert("비추천 하였습니다 .");
				$("#favorite").val(Number($("#favorite").val())-1);
			},
			error:function(){	
				alert("실패");
			}
		})
	}else if($("#favorite_check").val() == -1){
		var check = confirm("비추천을 취소하시겠습니까?");
		if(check == true){
			$("#favorite_check").val(0);
			$.ajax({
				url:"ajax.do",
				type:"post",
				data:{
					category : "favorite_delete",
					board_seq_id : $("#board_seq_id").val(),
					user_seq : $("#user_seq").val(),
				},
				success:function(){
					alert("비추천을 취소하였습니다.");
					$("#favorite").val(Number($("#favorite").val())+1);
				},
				error:function(){	
					  alert("실패");
				}
			})
		}else {
			return false;
		}
	}
	
}

</script>
<body>
<input type="hidden" id="category" value="${boardDto.board_category }">
<input type="hidden" id="board_seq_id" value="${boardDto.board_seq_id }">
<input type="hidden" id="maps_id" value="${boardDto.maps_id }">
<input type="hidden" id="user_seq" value="${userDto.user_seq }">
<input type="hidden" id="favorite_check" value="${favorite }">
<div class="layout-container">
		<div id="main">
			<jsp:include page="sidebar.jsp"></jsp:include>
			<div class="form">
				<h2 class="title"> ${boardDto.board_category } </h2> 
				<div class="detail_info">
					댓글 : ${boardDto.comment_count } | 조회 : ${boardDto.view_count } |
					<span class="timeago">
						[ 작성일 : <fmt:formatDate value="${boardDto.board_regdate }" pattern="yy.MM.dd HH:mm" /> ]
					</span>
				</div>
				<form method="post" action="controller.do?category=board_insert">
				 	<table class="table" style="border:1px; solid #dddddd">
							<tr>
								<td><input name="categoryType" id="category" type="text" class="form-control" placeholder="분류" name="type" maxlength="50" readonly="readonly" value="${boardDto.board_category }"></td>
							</tr>
							<tr>
				 				<td><input type="text" class="form-control" placeholder="작성자" maxlength="50" readonly="readonly" value="${boardDto.user_nickname }"></td>
				 			</tr>
				 			<tr>
				 				<td><input name="title" type="text" class="form-control" placeholder="제목" name="title" maxlength="50" readonly="readonly" value="${boardDto.board_title }"></td>
				 			</tr>
				 			<!-- 요식업체 소개 -->
				 			<c:if test="${boardDto.board_category eq 'FOODINFO' }">
				 			<tr>				 				
				 				<td>				 				
				 				<h3>제휴업체명: 『${mapdto.maps_name}』</h3>				 				
				 				<div id="map" style="width:100%;height:350px;"></div>
				 				</td>
				 			</tr>
				 			</c:if>
				 			
				 			<!-- 스터디 모집 -->
				 			<c:if test="${boardDto.board_category eq 'STUDY' }">
				 			<c:if test="${boardDto.maps_id eq '0' }">
				 			</c:if>
				 			<c:if test="${boardDto.maps_id ne '0' }">
				 			<tr>				 				
				 				<td>
				 				
				 				<h3>스터디 장소: ${mapdto.maps_name}</h3>
				 			
				 				<div id="map" style="width:100%;height:350px;"></div>
				 				</td>
				 			</tr>
				 			</c:if>
				 			</c:if>
				 			
				 			<tr>
				 				<!--  <td><textarea name="content" class="form-control" placeholder="내용" name="content" maxlength="2048" style="height:350px" readonly="readonly">${boardDto.board_content }</textarea> </td>-->
				 				<td><div class="form-control" style="height:350px; width:1050px;">${boardDto.board_content }</div></td>
				 			</tr>
				 	</table>
				 	<div >
					 	<input type="button" class="btn pull-left" value="추천" onclick="favorite_up()">
						<input type="button" class="btn pull-left" value="${boardDto.favorite_count }" name="favorite" id="favorite">
						<input type="button" class="btn pull-left" value="비추천" onclick="favorite_down()">
				 	
				 		<!-- 로그인한 사람이 쓴 글일 경우에만 수정,삭제 버튼이 보이게 해준다. 또는 로그인한 계정의 타입이 admin일 경우에도 보인다. -->
				 		<c:if test="${userDto.user_seq == boardDto.user_seq || userDto.user_type == 'ADMIN'}">
					 		<input type="button" class="btn btn-outline-primary pull-right" value="수정" onclick="board_update()">
					 		<input type="button" class="btn btn-outline-primary pull-right" value="삭제" onclick="board_delete()">
				 		</c:if>
				 	</div>
				</form>
				<hr class="my-4">
				<hr class="my-4">
				<ul class="list-group">
					<!-- 댓글창 -->
					<c:forEach items="${commentList }" var="commentDto">
					<li class="list-group-item note-item clearfix">
						<div class="content-body panel-body pull-left">
							<div class="avatar avatar-medium clearfix ">
								<div class="avatar-info">
								<!-- comment_seq_id를 이렇게 못받아온다면, form으로 처리해서 컨트롤러로 바로 보내버리자. -->
								${commentDto.user_nickname }
									<div class="date-created">
										<span class="timeago">
											<fmt:formatDate value="${commentDto.comment_regdate }" pattern="yy.MM.dd HH:mm" />
										</span>
									</div>
								</div>
							</div>
						<fieldset class="form">
							<article class="list-group-item-text note-text">
								${commentDto.comment_content }
							</article>
						</fieldset>
						</div>
							<div class="content-function pull-right">
								<div class="content-function-group">
									<c:if test="${userDto.user_seq == commentDto.user_seq || userDto.user_type == 'ADMIN'}">
										<div class="note-evaluate-wrapper">
											<div class="content-function-cog note-submit-buttons clearfix">
											
											<form id="comment_delete_form" method="post" action="controller.do?category=comment_delete"> 
												<input type="hidden" name="user_seq" id="user_seq" value="${userDto.user_seq }">
												<input type="hidden" name="board_seq_id" id="board_seq_id" value="${boardDto.board_seq_id }">
												<input type="hidden" name="comment_seq_id" id="comment_seq_id" value="${commentDto.comment_seq_id }">
												<input style="float: right;" type="submit" id="button" class="btn btn-success btn-wide" value="삭제">
											</form>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${empty userDto }">
							<li class="list-group-item note-form clearfix">
								<div>
									로그인을 하시면 댓글을 달 수 있습니다.
								</div>
							</li>
						</c:when>
						<c:otherwise>
						<!-- 댓글 입력창 -->
							<li class="list-group-item note-form clearfix">
								<form id="commentInsert" action="controller.do?category=comment_insert" method="post" class="note-create-form">
									<input type="hidden" name="board_seq_id" value="${boardDto.board_seq_id }">
									<input type="hidden" name="user_seq" value="${userDto.user_seq }">
									<div class="content-body panel-body pull-left">
										<div style="margin-left: 5px;">
											<div class="avatar avatar-medium clearfix ">
												<div class="avatar-info">
													<div class="activity block">
														<span class="fa fa-flash">
															${userDto.user_nickname }
														</span>
													</div>
												</div>
											</div>
										</div>
										<fieldset class="form">
											<input type="hidden" name="note.textType" value="HTML" id="note.textType">
											<textarea name="comment_content" id="comment_content" placeholder="댓글 쓰기" class="form-control"></textarea>
										</fieldset>
									</div>
									<div class="content-function-cog note-submit-buttons clearfix">
										<input style="float: right;" type="submit" name="comment_insert" id="btn-create-btn" class="btn btn-success btn-wide" value="등록">
									</div>
								</form>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			</br></br></br>
			<hr>
			<footer class="footer">Team.진선이와 아이들 1, 2, 3, 4, 5, 6 </footer>
			</br></br></br>
		</div>
	</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bad3b4587d72464d66aa25f00a8c89b4"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${mapdto.maps_x},${mapdto.maps_y}), // 지도의 중심좌표 => 전달받은 좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var positions = [
    {
        title: 'KH정보교육원 강남1관', 
        latlng: new daum.maps.LatLng(37.498992, 127.032878)
    }
    ]
    
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}

// 마커를 표시할 위치입니다 
var position =  new daum.maps.LatLng(${mapdto.maps_x},${mapdto.maps_y}); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
  position: position
});

// 마커를 지도에 표시합니다.
marker.setMap(map);

// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
var iwContent = '<div style="padding:5px;">${mapdto.maps_name}</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

// 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
    content : iwContent
});

// 마커에 마우스오버 이벤트를 등록합니다
daum.maps.event.addListener(marker, 'mouseover', function() {
  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
    infowindow.open(map, marker);
});

// 마커에 마우스아웃 이벤트를 등록합니다
daum.maps.event.addListener(marker, 'mouseout', function() {
    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
    infowindow.close();
});
</script>
	
</body>
</html>