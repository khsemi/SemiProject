package semi.KHC.userDao;

import semi.KHC.userDto.UserDto;

public interface UserDao {
	String USER_NAMESPACE = "kh_user.";
	
	//로그인 기능
	public UserDto login(String user_id);
	
	//회원가입 기능
	public int join(UserDto userdto);
	
	//정보수정 기능
	public int update(UserDto userdto);
	
	//회원탈퇴 기능
	public int delete(int user_seq);
	
	//정보조회 기능
	public UserDto select(int user_seq);
	
}
