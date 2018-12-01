package semi.KHC.userDto;

public class UserDto {
	/*
	USER_SEQ 			NUMBER 			PRIMARY KEY,
    USER_ID         	VARCHAR2(4000)  UNIQUE   NOT NULL, 
    USER_PW         	VARCHAR2(4000)  NOT NULL, 
    USER_NAME      	 	VARCHAR2(4000)  NOT NULL, 
    USER_NICKNAME   	VARCHAR2(4000)  UNIQUE   NOT NULL, 
    USER_ADDRESS    	VARCHAR2(4000)  NOT NULL, 
    USER_EMAIL      	VARCHAR2(4000)  UNIQUE   NOT NULL,
    USER_EMAILHASH		VARCHAR2(4000) 	NOT NULL,
    USER_EMAILCHECKED	VARCHAR2(4000)  CHECK(USER_EMAILCHECKED IN('TRUE','FALSE')),
    USER_PHONE       	VARCHAR2(4000)  UNIQUE   NOT NULL, 
    USER_STATE 			VARCHAR2(10) 	CHECK(USER_STATE IN('TRUE','FALSE')),
    USER_TYPE 			VARCHAR2(10) 	CHECK(USER_TYPE IN('USER' , 'ADMIN'))
	 */
	
	
	private int user_seq;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nickname;
	private String user_address;
	private String user_email;
	private String user_emailhash;
	private String user_emailchecked;
	private String user_phone;
	private String user_state;
	private String user_type;
	
	public UserDto() {
		
	}
	public UserDto(String user_id, String user_pw, String user_name, String user_nickname, String user_address,
			String user_email, String user_emailhash, String user_emailchecked, int user_seq, String user_phone, String user_state, String user_type) {
		this.user_seq = user_seq;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.user_address = user_address;
		this.user_email = user_email;
		this.user_emailhash = user_emailhash;
		this.user_emailchecked = user_emailchecked;
		this.user_phone = user_phone;
		this.user_state = user_state;
		this.user_type = user_type;
	}
	
	public UserDto(String user_id, String user_pw, String user_name, String user_nickname, String user_address,
			String user_email, String user_phone) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.user_address = user_address;
		this.user_email = user_email;
		this.user_phone = user_phone;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_emailhash() {
		return user_emailhash;
	}
	public void setUser_emailhash(String user_emailhash) {
		this.user_emailhash = user_emailhash;
	}
	public String getUser_emailchecked() {
		return user_emailchecked;
	}
	public void setUser_emailchecked(String user_emailchecked) {
		this.user_emailchecked = user_emailchecked;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	
}
