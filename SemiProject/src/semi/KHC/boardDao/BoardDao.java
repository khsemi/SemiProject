package semi.KHC.boardDao;

import java.util.List;

import semi.KHC.boardDto.BoardDto;

public interface BoardDao {
	String BOARD_NAMESPACE = "kh_board.";
	
	//일반 게시판 조회
	public int totalCount(String category);
	public List<BoardDto> selectPage(String category, int page);
	//검색 게시판 조회
	public int totalCount_search(String category, String keyword);
	public List<BoardDto> selectPage_search(String category, int page, String keyword);
	
} 
