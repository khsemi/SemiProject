package semi.KHC.boardDao;

import java.util.List;

import semi.KHC.boardDto.BoardDto;

public interface BoardDao {
	String BOARD_NAMESPACE = "kh_board.";
	
	//일반 게시판 조회
	public int totalCount(String category);
	public List<BoardDto> selectPage(String category, int page);
	//내가 쓴 글 조회
	public int totalCount(int user_seq);
	public List<BoardDto> selectPage(int user_seq, int page);
	//검색 게시판 조회
	public int totalCount_search(String category, String keyword);
	public List<BoardDto> selectPage_search(String category, int page, String keyword);
	
	public BoardDto detail(int board_seq_id);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int board_seq_id);
	
	public List<BoardDto> selectAll();
	
} 
