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
<title>board update</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>
 
<script type="text/javascript">
function board_cancel(){
	var check = confirm("글 수정을 '취소' 하시겠습니까?");
	if(check == true){
		location.href="controller.do?category=board_detail&board_seq_id="+$("#board_seq_id").val();
	}else {
		return false;
	}
}

$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "dist/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);

        //폼 submit
        $("#frm").submit();
    })

})

	function Popup(){
		var message = "<div style='background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;'><pre style='margin: 0; line-height: 125%'><span  style='color: #e6db74'>"+ "<xmp>"+" "+"</xmp>" + "</span></pre></div>" + "&nbsp" ;

		frames[0].window.document.getElementById("se2_iframe").contentWindow.document.body.innerHTML+=message;
		//frames[0].window.document.getElementById("se2_iframe").contentWindow.document.body.innerHTML=message;
	
	
}


	
</script>
<body>
<input type="hidden" id="category" value="${dto.board_category }">
<input type="hidden" id="board_seq_id" value="${dto.board_seq_id }">
<div class="layout-container">
		<div id="main">
			<jsp:include page="sidebar.jsp"></jsp:include>
			<div class="form">
				<h2> ${dto.board_category } </h2>
				<form method="post" id="frm" action="controller.do?category=board_update" id="board_updateForm">
					<input type = "hidden" name = "maps_seq_id" id ="maps_seq_id" value = "${mapdto.maps_seq_id }">
					<input type="hidden" name="board_seq_id" id="board_seq_id" value="${dto.board_seq_id }">
					<input type="hidden" id="latitude" name="latitude" value="0">
					<input type="hidden" id="longtitude" name="longtitude" value="0">
					<input type="hidden" id="user_seq" name="user_seq" value="${dto.user_seq }">
				 	<table class="table" style="text-align:center; border:1px; solid #dddddd">
							<tr>
								<td><input name="categoryType" id="category" type="text" class="form-control" placeholder="분류" name="type" maxlength="50" readonly="readonly" value="${dto.board_category }"></td>
							</tr>
							<tr>
				 				<td><input name="user_nickname" type="text" class="form-control" placeholder="작성자" maxlength="50" readonly="readonly" value="${dto.user_nickname }"></td>
				 			</tr>		 		
				 			<tr>
				 				<td><input name="title" type="text" class="form-control" placeholder="제목" name="title" maxlength="50" value="${dto.board_title }"></td>
				 			</tr>
				 			
				 			<c:if test="${dto.board_category eq 'FOODINFO' || dto.board_category eq 'STUDY' }">
						 	<tr>
						 		<td><input name="location" type="text" class="form-control" placeholder="장소" name="location" maxlength="50" value ="${mapdto.maps_name }"></td>
						 	</tr>
				 			
				 			<tr>
				 				<td><div id="map" style="width: 100%; height: 350px;"></div></td>
				 			</tr>
				 			</c:if>
				 			<tr>	
				 				<td><textarea name="content" id="smarteditor" class="form-control" placeholder="내용" name="content" maxlength="2048" style="height:350px">${dto.board_content }</textarea> </td>
				 			</tr>	
				 	</table> 
				 	<input type="submit" class="btn btn-primary pull-right" value="완료" id="savebutton" >
				 	<input type="button" class="btn btn-primary pull-right" value="취소" onclick="board_cancel()">
					<c:if test="${category eq 'TIPS_insertForm' || category eq 'QA_insertForm'}">
					<input type="button" value="코드" class="btn btn-primary pull-right" onclick="Popup()">
					</c:if>				 	
				</form> 
			</div>
			</br></br></br>
			<hr>
			<footer class="footer">Team.진선이와 아이들 1, 2, 3, 4, 5, 6 </footer>
			</br></br></br>
		</div>
	</div>
	
<div id="clickLatlng"></div>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bad3b4587d72464d66aa25f00a8c89b4"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${mapdto.maps_x }, ${mapdto.maps_y }), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
// '37.498992', '127.032878'
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


// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new daum.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    alert(latlng);
   // alert($("#latitude").val());
	//alert($("#longtitude").val());
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
// var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
// message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    //var resultDiv = document.getElementById('clickLatlng'); 
    //resultDiv.innerHTML = message;S
   
	$("#latitude").val(latlng.getLat());
	// id값 가져올 때는 #써서 가져온다 , latitude 값에 위도값을 넣는다?
	$("#longtitude").val(latlng.getLng());
	  //id가 longtitude 인 곳에 경도 값을 넣는다
	
	
    alert($("#latitude").val());   
	alert($("#longtitude").val());
	//alert를 호출하려 latitude와 longtitude에 값이 제대로 전달, 저장되었는지 확인
    
}
);
</script>	
</body>
</html>