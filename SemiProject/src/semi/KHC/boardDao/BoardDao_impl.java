package semi.KHC.boardDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDto.BoardDto;
import semi.KHC.commentDao.CommentDao_impl;

public class BoardDao_impl extends SqlMapConfig implements BoardDao {

	@Override
	public int totalCount(String category) {
		SqlSession session = null;
		int totalCount = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			totalCount = session.selectOne(BOARD_NAMESPACE + "totalCount", category);

		} catch (Exception e) {
			System.out.println("totalCount 오류 : " + e);
		} finally {
			session.close();
		}

		return totalCount;
	}

	@Override
	public List<BoardDto> selectPage(String category, int page) {
		SqlSession session = null;
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("category", category);
		map.put("page", page);

		try {
			session = getSqlSessionFactory().openSession(true);
			boardList = session.selectList(BOARD_NAMESPACE + "selectPage", map);
		} catch (Exception e) {
			System.out.println("selectPage 오류 : " + e);
		} finally {
			session.close();
		}
		return boardList;
	}
	
	@Override
	public int totalCount(int user_seq) {
		SqlSession session = null;
		int totalCount = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			totalCount = session.selectOne(BOARD_NAMESPACE+"myPage_totalCount",user_seq);
		} catch (Exception e) {
			System.out.println("totalCount(user_seq) 오류 : " + e);
		} finally {
			session.close();
		}
		return totalCount;
	}

	@Override
	public List<BoardDto> selectPage(int user_seq, int page) {
		SqlSession session = null;
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_seq", user_seq);
		map.put("page", page);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			boardList = session.selectList(BOARD_NAMESPACE+"myPage_selectPage",map);
		} catch (Exception e) {
			System.out.println("selectPage(user_seq, page) 오류 : "+e);
		} finally {
			session.close();
		}
		return boardList;
	}

	@Override
	public int totalCount_search(String category, String keyword) {
		SqlSession session = null;
		// 넘어온 category를 split해주는 이유는 검색을 하면
		// category에 "_search"가 붙기 때문이다.
		int totalCount = 0;
		String[] category_split = category.split("_");
		Map<String, String> map = new HashMap<String, String>();

		map.put("category", category_split[0]);
		map.put("keyword", keyword);

		try {
			session = getSqlSessionFactory().openSession(true);
			totalCount = session.selectOne(BOARD_NAMESPACE + "totalCount_search", map);

		} catch (Exception e) {
			System.out.println("totalCount_search 오류 : " + e);
		} finally {
			session.close();
		}
		return totalCount;
	}

	@Override
	public List<BoardDto> selectPage_search(String category, int page, String keyword) {
		SqlSession session = null;
		// 넘어온 category를 split해주는 이유는 검색을 하면
		// category에 "_search"가 붙기 때문이다.
		String[] category_split = category.split("_");
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("category", category_split[0]);
		map.put("page", page);
		map.put("keyword", keyword);

		
		try {
			session = getSqlSessionFactory().openSession(true);
			boardList = session.selectList(BOARD_NAMESPACE + "selectPage_search", map);
		} catch (Exception e) {
			System.out.println("selectPage_search 오류 : "+e);
		}finally {
			session.close();
		}
		return boardList;
	}

	@Override
	public BoardDto detail(int board_seq_id) {
		BoardDto dto = new BoardDto();

		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(BOARD_NAMESPACE + "detail", board_seq_id);
		} catch (Exception e) {
			System.out.println("detail 오류 : " + e);
		} finally {
			session.close();
		}
		return dto;
	}
	
	@Override
	public boolean updateViewCount(int board_seq_id) {
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(BOARD_NAMESPACE+"updateViewCount",board_seq_id);
			
		}catch (Exception e) {
			System.out.println("updateViewCount_up 오류 : "+e);
			return false;
		}finally {
			session.close();
		}
		return true;
	}

	@Override
	public int insert(BoardDto dto) {
		SqlSession session = null;
		int board_seq_id = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			session.insert(BOARD_NAMESPACE + "insert", dto);
			// insert가 성공하면, 그 성공한 객체의 seq를 가져온다.
			board_seq_id = dto.getBoard_seq_id();
		} catch (Exception e) {
			System.out.println("insert 오류 : " + e);
		} finally {
			session.close();
		}
		return board_seq_id;
	}

	@Override
	public int update(BoardDto dto) {
		SqlSession session = null;
		int board_seq_id = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(BOARD_NAMESPACE + "update", dto);
			board_seq_id = dto.getBoard_seq_id();
		} catch (Exception e) {
			System.out.println("update 오류 : "+e);
		} finally {
			session.close();
		}
		return board_seq_id;
	}

	@Override
	public int delete(int board_seq_id) {
		SqlSession session = null;
		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			result = session.delete(BOARD_NAMESPACE + "delete", board_seq_id);
		} catch (Exception e) {
			System.out.println("delete 오류 : "+e);
		} finally {
			session.close();
		}
		return result;
	}
}
