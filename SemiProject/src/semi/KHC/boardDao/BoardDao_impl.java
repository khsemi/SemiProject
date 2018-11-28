package semi.KHC.boardDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDto.BoardDto;

public class BoardDao_impl extends SqlMapConfig implements BoardDao{

	@Override
	public int totalCount(String category) {
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		int totalCount = session.selectOne(BOARD_NAMESPACE+"totalCount", category);
		
		session.close();
		
		return totalCount;
	}

	@Override
	public List<BoardDto> selectPage(String category, int page) {
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("category", category);
		map.put("page", page);
		
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		boardList = session.selectList(BOARD_NAMESPACE+"selectPage",map);
		
		session.close();
		
		return boardList;
	}

	@Override
	public int totalCount_search(String category, String keyword) {
		//넘어온 category를 split해주는 이유는 검색을 하면
		//category에 "_search"가 붙기 때문이다.
		String[] category_split = category.split("_");
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("category", category_split[0]);
		map.put("keyword", keyword);
		
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		int totalCount = session.selectOne(BOARD_NAMESPACE+"totalCount_search",map);
		
		session.close();
		
		return totalCount;
	}

	@Override
	public List<BoardDto> selectPage_search(String category, int page, String keyword) {
		//넘어온 category를 split해주는 이유는 검색을 하면
		//category에 "_search"가 붙기 때문이다.
		String[] category_split = category.split("_");
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("category", category_split[0]);
		map.put("page", page);
		map.put("keyword", keyword);
		
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		boardList = session.selectList(BOARD_NAMESPACE+"selectPage_search",map);
		
		session.close();
		
		return boardList;
	}
	@Override
	public BoardDto detail(int board_seq_id) {
		BoardDto dto = new BoardDto();
		
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		dto = session.selectOne(BOARD_NAMESPACE+"detail",board_seq_id);
		return dto;
	}
	@Override
	public int insert(BoardDto dto) {
		SqlSession session = null;
		session = getSqlSessionFactory().openSession(true);
		session.insert(BOARD_NAMESPACE+"insert",dto);
		//입력된 글의 번호
		int Board_seq_id = dto.getBoard_seq_id();
		
		return Board_seq_id;
	}
	@Override
	public int update(BoardDto dto) {
		SqlSession session = null;
		session = getSqlSessionFactory().openSession(true);
		session.update(BOARD_NAMESPACE+"update",dto);
		//입력된 글의 번호
		int Board_seq_id = dto.getBoard_seq_id();
		
		return Board_seq_id;
	}
	@Override
	public int delete(int board_seq_id) {
		SqlSession session = null;
		session = getSqlSessionFactory().openSession(true);
		int result = session.delete(BOARD_NAMESPACE+"delete",board_seq_id);
		
		return result;
	}

}
