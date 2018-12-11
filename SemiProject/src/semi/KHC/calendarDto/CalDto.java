package semi.KHC.calendarDto;

import java.sql.Date;



public class CalDto {
	
	private int cal_seq_id;
	private int user_seq;
	private String cal_title;
	private String cal_content;
	private String cal_mdate;
	private Date cal_regdate;
	private String cal_category;
	public CalDto(int cal_seq_id, int user_seq, String cal_title, String cal_content, String cal_mdate,
			Date cal_regdate, String cal_category) {
		super();
		this.cal_seq_id = cal_seq_id;
		this.user_seq = user_seq;
		this.cal_title = cal_title;
		this.cal_content = cal_content;
		this.cal_mdate = cal_mdate;
		this.cal_regdate = cal_regdate;
		this.cal_category = cal_category;
	}
	
	public CalDto(int user_seq, String cal_title, String cal_content, String cal_mdate, String cal_category) {
		super();
		this.user_seq = user_seq;
		this.cal_title = cal_title;
		this.cal_content = cal_content;
		this.cal_mdate = cal_mdate;
		this.cal_category = cal_category;
	}
	
	public int getCal_seq_id() {
		return cal_seq_id;
	}
	public void setCal_seq_id(int cal_seq_id) {
		this.cal_seq_id = cal_seq_id;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public String getCal_content() {
		return cal_content;
	}
	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}
	public String getCal_mdate() {
		return cal_mdate;
	}
	public void setCal_mdate(String cal_mdate) {
		this.cal_mdate = cal_mdate;
	}
	public Date getCal_regdate() {
		return cal_regdate;
	}
	public void setCal_regdate(Date cal_regdate) {
		this.cal_regdate = cal_regdate;
	}
	public String getCal_category() {
		return cal_category;
	}
	public void setCal_category(String cal_category) {
		this.cal_category = cal_category;
	}
	
	
}
