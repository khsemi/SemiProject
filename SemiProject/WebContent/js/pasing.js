$(function(){
	
	//totalCount = 전체 게시글 수 
	//page = 현재 페이지 
	//command = command
	
	//-----------------아래 두개는 검색을 위해 사용되는 것임.---------------------
	//searchType = 어떤 조건으로 검색을 할것인지에 대한 값
	//keyword = 게시판(DB TABLE)내에 검색을 위해 필요한 검색 값
	//-------------------------------------------------------------------
	
	//listSize = 한 페이지당 보여줄 게시글 수 
	//totalPage = 총 페이지 수 
	
	//var totalCount = document.getElementById("totalCount").value;
	var totalCount = $("#totalCount").val();
	var page = $("#page").val();
	var category = $("#category").val();
	var user_seq = $("#user_seq").val();
	
	//----------------검색을 위해 필요한 값들 가져오기-------------------
	var searchType = $("#searchType").val();
	var keyword = $("#keyword").val();
	
	var listSize = 10; 
	var totalPage = parseInt(totalCount / listSize); //총 페이지 수
	
	//총 게시글(totalCount)를 한페이지당 보여줄 게시글 수(listSize)로 나눴을때 나머지가 0보다크다는것은
	//게시글이 최소 1개이상 더 있다는 뜻이므로, 전체페이지를 하나더 추가해줘야함.
	if(totalCount % listSize > 0){
		totalPage++;
	}
	
	//전체 페이지(totalPage) 보다 현재 page가 크다면, 현재 페이지를 totalPage로 맞춰준다.
	//ex) 전체페이지는 24 인데 현재 페이지가 26이라면 현재 페이지를 24로 만들어주는 것임.
	if(totalPage < page){
		page = totalPage;
	}
	
	//하단에 표시될 페이지들을 출력해주기위하여 startPage & endPage 를 계산해준다.
	//내가 고른 페이지가 4 라면 1~10 까지 표시해주어야하며, 13이라면 11~20을 표시해줘야하기때문이다.
	var startPage = parseInt((page - 1) / 10) * 10 + 1;
	var endPage = startPage + listSize - 1;
	
	//마지막페이지(endPage)가 전체 페이지(totalPage) 보다 크다면, 마지막페이지를 전체페이지로 맞춰준다.
	if (endPage > totalPage) {
	    endPage = totalPage;
	}
	
	//-----------------------실제 하단에 페이징 표시되기 위한 코드----------------------------
	//현재 별 의미없이 공백이나 괄호들을 append해줬는데 일시적으로 눈에 잘 보이기위해 처리해준것임.
	//부트스트랩이나, css를 만들어서 처리한다면 저런것들은 지우면됨.
	//.append 해주는 코드 안에 <a>태그 말고 <li>로 해도됨 (원하는 형식대로 출력하게하면됨)
	
	if(startPage > 1){
		$("#pasing").append("<li class=''><a href='controller.do?category="+category+"&page=1&searchType="+searchType+"&keyword="+keyword+"&user_seq="+user_seq+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	}else{
		$("#pasing").append("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	}
	
	if(page > 1){
		$("#pasing").append("<li class=''><a href='controller.do?category="+category+"&page="+(page-1)+"&searchType="+searchType+"&keyword="+keyword+"&user_seq="+user_seq+"' aria-label='Previous'><span aria-hidden='true'>&lang;</span></a></li>");
	}else{
		$("#pasing").append("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&lang;</span></a></li>");
	}
	
	for(var iCount = startPage; iCount <= endPage; iCount++) {
		if (iCount == page) {
	       $("#pasing").append("<li class='active'><a href='#'>"+iCount+"<span class='sr-only'></span></a></li>");
	    } else {
	    	$("#pasing").append("<li class=''><a href='controller.do?category="+category+"&page="+iCount+"&searchType="+searchType+"&keyword="+keyword+"&user_seq="+user_seq+"'>" + iCount + "<span class='sr-only'></span></a></li>");
	    }
	}
	
	if(page < totalPage){
		$("#pasing").append("<li class=''><a href='controller.do?category="+category+"&page="+(Number(page)+1)+"&searchType="+searchType+"&keyword="+keyword+"&user_seq="+user_seq+"' aria-label='Next'><span aria-hidden='true'>&rang;</span></a></li>");
	}else{
		$("#pasing").append("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&rang;</span></a></li>");
	}
	
	if(endPage < totalPage){
		$("#pasing").append("<li class=''><a href='controller.do?category="+category+"&page="+totalPage+"&searchType="+searchType+"&keyword="+keyword+"&user_seq="+user_seq+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	}else{
		$("#pasing").append("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	}
	
	/*
	$("#pasingInfo").append(  "총 게시글 수 : " + totalCount +"<br>" +
						"게시판에 보여줄 게시글 수 : "+listSize+" <br>" +
						"게시판 총 페이지 : "+totalPage+" <br>" +
						"시작페이지 : "+startPage+" <br>" +
						"엔드페이지 : "+endPage+" <br>" +
						"command : "+command+"<br>"+
						"검색한 단어 : "+keyword+"<br>");
	*/
})

