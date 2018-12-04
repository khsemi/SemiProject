package semi.KHC.commentDao;

import java.util.List;

import semi.KHC.commentDto.CommentDto;

public interface CommentDao {
	String COMMENTNAMESPACE = "kh_comment.";
	
	public List<CommentDto> selectList(int board_seq_id);
}
