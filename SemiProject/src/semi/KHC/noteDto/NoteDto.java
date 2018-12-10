package semi.KHC.noteDto;

import java.util.Date;

public class NoteDto {

//	  NOTE_SEQ_ID       NUMBER      NOT NULL, 
//    NOTE_REGDATE      DATE        NOT NULL, 
//    NOTE_TITLE        VARCHAR2(4000)    NOT NULL, 
//    NOTE_CONTENT      CLOB        NOT NULL, 
//    SEND_USER_ID      VARCHAR2(4000)    NOT NULL, 
//    RECIVE_USER_ID    VARCHAR2(4000)    NOT NULL, 
	
	private int note_seq_id;
	private Date note_regdate;
	private String note_title;
	private String note_content;
	private String send_user_id;
	private String recive_user_id;
	
	
	
	public NoteDto() {
		super();
	}
	public NoteDto(int note_seq_id, Date note_regdate, String note_title, String note_content, String send_user_id,
			String recive_user_id) {
		super();
		this.note_seq_id = note_seq_id;
		this.note_regdate = note_regdate;
		this.note_title = note_title;
		this.note_content = note_content;
		this.send_user_id = send_user_id;
		this.recive_user_id = recive_user_id;
	}
	public NoteDto(String note_title, String note_content, String send_user_id, String recive_user_id) {
		super();
		this.note_title = note_title;
		this.note_content = note_content;
		this.send_user_id = send_user_id;
		this.recive_user_id = recive_user_id;
	}
	public int getNote_seq_id() {
		return note_seq_id;
	}
	public void setNote_seq_id(int note_seq_id) {
		this.note_seq_id = note_seq_id;
	}
	public Date getNote_regdate() {
		return note_regdate;
	}
	public void setNote_regdate(Date note_regdate) {
		this.note_regdate = note_regdate;
	}
	public String getNote_title() {
		return note_title;
	}
	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}
	public String getNote_content() {
		return note_content;
	}
	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}
	public String getSend_user_id() {
		return send_user_id;
	}
	public void setSend_user_id(String send_user_id) {
		this.send_user_id = send_user_id;
	}
	public String getRecive_user_id() {
		return recive_user_id;
	}
	public void setRecive_user_id(String recive_user_id) {
		this.recive_user_id = recive_user_id;
	}
	
}
