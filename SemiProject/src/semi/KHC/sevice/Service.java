package semi.KHC.sevice;

import java.util.List;
import java.util.Map;
//Controller 에서는 Dao를 직접 호출하지않고 Service만 호출한다.

import semi.KHC.boardDto.BoardDto;
import semi.KHC.pointDto.PointDto;
import semi.KHC.userDto.UserDto;
public interface Service {
	//일반 게시판을 보여주기위해 category와 page를 이용하여 Dao의 totalCount와 boardList를 구한다.
	public Map<String, Object> board(String category, int page);
	//조건 선택 검색 
	//public Map<String, Object> board_search(String category, int page, String searchType, String keyword);
	//모든 조건 검색
	public Map<String, Object> board_search(String category, int page, String keyword);

	// board_detail
	public BoardDto board_detail(int board_seq_id);

	// board_insert
	public int board_insert(String board_category, String board_title, String board_content, int user_seq);

	// board_update
	public int board_update(int board_seq_id, String board_title, String board_content);

	// board_delete
	public boolean board_delete(int board_seq_id);

	// 로그인
	public UserDto login(String user_id, String user_pw);
	
	// 포인트 충전 내역
	public List<PointDto> point_selectAll(int user_seq);
}
