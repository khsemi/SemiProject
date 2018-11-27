package semi.KHC.sevice;

import java.util.Map;
//Controller 에서는 Dao를 직접 호출하지않고 Service만 호출한다.
public interface Service {
	//일반 게시판을 보여주기위해 category와 page를 이용하여 Dao의 totalCount와 boardList를 구한다.
	public Map<String, Object> board(String category, int page);
	//조건 선택 검색 
	//public Map<String, Object> board_search(String category, int page, String searchType, String keyword);
	//모든 조건 검색
	public Map<String, Object> board_search(String category, int page, String keyword);
	
}
