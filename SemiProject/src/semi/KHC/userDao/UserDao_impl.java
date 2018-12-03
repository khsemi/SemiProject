package semi.KHC.userDao;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDao.SqlMapConfig;
import semi.KHC.userDto.UserDto;

public class UserDao_impl  extends SqlMapConfig implements UserDao {

	@Override
	public UserDto login(String user_id) {
		SqlSession session = null;
		UserDto dto = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(USER_NAMESPACE+"login", user_id);
		} catch (Exception e) {
			System.out.println("login 오류 : "+e);
		} finally {
			session.close();
		}
		return dto;
	}

	@Override
	public boolean join(UserDto userDto) {
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			session.insert(USER_NAMESPACE + "join", userDto);
		} catch (Exception e) {
			System.out.println("join 오류 : "+e);
			return false;
		} finally {
			session.close();
		}
		return true;
	}
	@Override
	public String getUser_email(String user_id) {
		SqlSession session = null;
		String result = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			result = session.selectOne(USER_NAMESPACE+"getEmail",user_id);
		} catch (Exception e) {
			System.out.println("getUser_email 오류 : "+e);
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public boolean setUser_email(String user_id) {
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(USER_NAMESPACE+"setEmail",user_id);
			
		} catch (Exception e) {
			System.out.println("setUser_email 오류 : "+e);
			return false;
		} finally {
			session.close();
		}
		return true;
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
