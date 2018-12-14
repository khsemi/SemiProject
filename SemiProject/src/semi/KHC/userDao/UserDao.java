package semi.KHC.userDao;

import java.util.List;

import semi.KHC.userDto.UserDto;

public interface UserDao {
	String USER_NAMESPACE = "kh_user.";
	
	//로그인 기능
	public UserDto login(String user_id);
	
	//아이디찾기
	public String find_id(String user_email);
	
	//비밀번호 이메일 찾기
	public boolean find_email(String user_email);
	
	//비밀번호 변경 성공
	public boolean user_updatePw(String user_pw, String user_email);	
	
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
	
	//회원 리스트 출력
	public List<UserDto> userList();
	public List<UserDto> userSearchList(String keyword);
	
}
