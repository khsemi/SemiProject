package semi.KHC.userDao;

import semi.KHC.userDto.UserDto;

public interface UserDao {
	String USER_NAMESPACE = "kh_user.";
	
	//로그인 기능
	public UserDto login(String user_id);
	
	//회원가입 기능
	public boolean join(UserDto userDto);
	
	//유저 이메일 가져오는 기능
	public String getUser_email(String user_id);
	
	//유저 이메일 인증 후 이메일인증여부 셋팅
	public boolean setUser_email(String user_id);
	
	//정보수정 기능
	public int update(UserDto userDto);
	
	//회원탈퇴 기능
	public int delete(int user_seq);
	
	//정보조회 기능
	public UserDto select(int user_seq);
	
}
