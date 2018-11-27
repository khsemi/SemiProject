$(function() {
	//category 값을 split 해주는 이유는 검색을 한번 하면, category값에 "_search"라는 값이 붙어서
	//category 값이 넘어오기때문에, 검색 한 후 재검색을 하기위해서 여기서 split으로 "_"를 나눠 사용
	var category = $("#category").val().split("_");
	
	//<div id="search"> 에다가 append 해준다.(검색 옵션과, 검색창과, submit 버튼이 생긴다)
	
	/* 조건 선택 검색
	$("#search").append("<form action='controller.do' method='post' id='searchForm' name='searchForm'>"
			+"<input type='hidden' name='category' value='"+category+"_search'>"
			+"<input type='hidden' name='page' value='1'>"
			+	"<select name='searchType'>"
			+		"<option value='board_title' selected>제목</option>"
			+		"<option value='board_content' >내용</option>"
			+		"<option value='board_writer' >작성자</option>"
			+	"</select>"
			+	"<input type='text' name='keyword'>"
			+	"<input type='submit' value='검색'>"
			+"</form>");
	*/
	
	// 모든 조건 검색
	$("#search").append("<form action='controller.do' method='post' id='searchForm' name='searchForm'>"
			+"<input type='hidden' name='category' value='"+category[0]+"_search'>"
			+"<input type='hidden' name='page' value='1'>"
			+	"<input type='text' name='keyword'>"
			+	"<input type='submit' value='검색'>"
			+"</form>");
	
	//해당 searchForm 의 submit 버튼이 눌리면,
	$("#searchForm").submit(
			function(){
				//입력한 값이 공백이 아니면 submit은 정상동작하고,
				if(document.searchForm.keyword.value != ""){
					return true;
				}
				//아니라면 경고창을 띄워준다.
				alert("검색어를 입력해주세요!");
				return false;
			}
	);
})