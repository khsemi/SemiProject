package semi.KHC.commentDao;

import java.util.ArrayList;
import java.util.List;

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
}
