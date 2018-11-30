package semi.KHC.pointDto;

import java.util.Date;

public class PointDto {
	private int point_seq_id;
	private int user_id;
	private Date point_regdate;
	private int point_balance;
	private int point_state;
	
	
	public PointDto() {
		super();
	}
	
	public PointDto(int point_seq_id, int user_id, Date point_regdate, int point_balance, int point_state) {
		super();
		this.point_seq_id = point_seq_id;
		this.user_id = user_id;
		this.point_regdate = point_regdate;
		this.point_balance = point_balance;
		this.point_state = point_state;
	}
	
	public int getPoint_state() {
		return point_state;
	}

	public void setPoint_state(int point_state) {
		this.point_state = point_state;
	}

	public int getPoint_seq_id() {
		return point_seq_id;
	}
	public void setPoint_seq_id(int point_seq_id) {
		this.point_seq_id = point_seq_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getPoint_regdate() {
		return point_regdate;
	}
	public void setPoint_regdate(Date point_regdate) {
		this.point_regdate = point_regdate;
	}
	public int getPoint_balance() {
		return point_balance;
	}
	public void setPoint_balance(int point_balance) {
		this.point_balance = point_balance;
	}
	
	
}
