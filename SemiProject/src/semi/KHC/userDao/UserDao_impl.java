package semi.KHC.userDao;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDao.SqlMapConfig;
import semi.KHC.userDto.UserDto;

public class UserDao_impl  extends SqlMapConfig implements UserDao {

	@Override
	public UserDto login(String user_id) {
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		UserDto dto = session.selectOne(USER_NAMESPACE+"login", user_id);
		
		session.close();
		
		return dto;
	}

	@Override
	public int join(UserDto userdto) {
		return 0;
	}

	@Override
	public int update(UserDto userdto) {
		return 0;
	}

	@Override
	public int delete(int user_seq) {
		return 0;
	}

	@Override
	public UserDto select(int user_seq) {
		return null;
	}

}
