package semi.KHC.foodticketDto;

import java.sql.Date;

public class FoodticketDto {


	private int foodticket_seq_id;
	private int user_seq;
	private String foodticket_qrcode;
	private String foodticket_name;
	private int foodticket_pay;
	private Date regdate;

	public FoodticketDto() {
		super();
	}

	public FoodticketDto(int foodticket_seq_id, int user_seq, String foodticket_qrcode, String foodticket_name,
			int foodticket_pay) {

		this.foodticket_seq_id = foodticket_seq_id;
		this.user_seq = user_seq;
		this.foodticket_qrcode = foodticket_qrcode;
		this.foodticket_name = foodticket_name;
		this.foodticket_pay = foodticket_pay;
		this.regdate = regdate;
	}

	public FoodticketDto(int foodticket_seq_id, String foodticket_qrcode) {
		this.foodticket_qrcode = foodticket_qrcode;
		this.foodticket_seq_id = foodticket_seq_id;
	}

	public FoodticketDto(int user_seq, String foodticket_name, int foodticket_pay) {
		this.user_seq = user_seq;
		this.foodticket_name = foodticket_name;
		this.foodticket_pay = foodticket_pay;
	}

	public FoodticketDto(int foodticket_seq_id) {
		this.foodticket_seq_id = foodticket_seq_id;
	}

	public int getFoodticket_seq_id() {
		return foodticket_seq_id;
	}

	public void setFoodticket_seq_id(int foodticket_seq_id) {
		this.foodticket_seq_id = foodticket_seq_id;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getFoodticket_qrcode() {
		return foodticket_qrcode;
	}

	public void setFoodticket_qrcode(String foodticket_qrcode) {
		this.foodticket_qrcode = foodticket_qrcode;
	}

	public String getFoodticket_name() {
		return foodticket_name;
	}

	public void setFoodticket_name(String foodticket_name) {
		this.foodticket_name = foodticket_name;
	}

	public int getFoodticket_pay() {
		return foodticket_pay;
	}

	public void setFoodticket_pay(int foodticket_pay) {
		this.foodticket_pay = foodticket_pay;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
