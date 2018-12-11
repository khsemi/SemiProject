package semi.KHC.commentDto;

import java.util.Date;

public class CommentDto {
	/*
	 COMMENT_SEQ_ID     NUMBER      NOT NULL, 
	 BOARD_SEQ_ID       NUMBER      NOT NULL, 
	 USER_SEQ           NUMBER      NOT NULL, 
	 COMMENT_CONTENT    VARCHAR2(4000)    NOT NULL, 
	 COMMENT_REGDATE    DATE        NOT NULL, 
	*/
	
	private int comment_seq_id;
	private int board_seq_id;
	private int user_seq;
	private String user_nickname;
	private String comment_content;
	private Date comment_regdate;
	
	CommentDto(){
		
	}
	
	//insert(댓글입력시)
	CommentDto(int board_seq_id, int user_seq, String comment_content){
		this.board_seq_id = board_seq_id;
		this.user_seq = user_seq;
		this.comment_content = comment_content;
	}

	public int getComment_seq_id() {
		return comment_seq_id;
	}

	public void setComment_seq_id(int comment_seq_id) {
		this.comment_seq_id = comment_seq_id;
	}

	public int getBoard_seq_id() {
		return board_seq_id;
	}

	public void setBoard_seq_id(int board_seq_id) {
		this.board_seq_id = board_seq_id;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_regdate() {
		return comment_regdate;
	}

	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}

}
