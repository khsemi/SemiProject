package semi.KHC.commentDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDao.SqlMapConfig;
import semi.KHC.commentDto.CommentDto;

public class CommentDao_impl extends SqlMapConfig implements CommentDao{

	@Override
	public List<CommentDto> selectList(int board_seq_id) {
		List<CommentDto> commentList = new ArrayList<CommentDto>();
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			
			commentList = session.selectList(COMMENTNAMESPACE+"commentList",board_seq_id);
		} catch (Exception e) {
			System.out.println("selectList(comment) 오류 : " + e);
		}
		return commentList;
	}

	@Override
	public boolean insert(int board_seq_id, int user_seq, String comment_content) {
		SqlSession session = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_seq_id", board_seq_id);
		map.put("user_seq", user_seq);
		map.put("comment_content", comment_content);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.insert(COMMENTNAMESPACE+"commentInsert", map);
		} catch (Exception e) {
			System.out.println("comment_insert 오류 : " + e);
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	@Override
	public boolean delete(int comment_seq_id) {
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.delete(COMMENTNAMESPACE+"commentDelete",comment_seq_id);
		} catch (Exception e) {
			System.out.println("comment_delete 오류 : "+e);
			return false;
		} finally {
			session.close();
		}
		return true;
	}
}
