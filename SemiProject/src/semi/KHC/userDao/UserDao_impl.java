package semi.KHC.userDao;

import java.util.ArrayList;
import java.util.List;

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
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(USER_NAMESPACE+"update", userdto);
		} catch (Exception e) {
			System.out.println("update 오류 : "+e);
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int delete(int user_seq) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(USER_NAMESPACE+"delete", user_seq);
		} catch (Exception e) {
			System.out.println("delete 오류 : "+e);
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public UserDto select(int user_seq) {
		SqlSession session = null;
		UserDto dto = null;
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(USER_NAMESPACE+"selectOne", user_seq);
		} catch (Exception e) {
			System.out.println("select 오류 : "+e);
		} finally {
			session.close();
		}
		return dto;	
		
	}
	@Override
	public List<UserDto> userList() {
		SqlSession session = null;
		List<UserDto> userlist = new ArrayList<UserDto>();
		try {
			session = getSqlSessionFactory().openSession(true);
			userlist = session.selectList(USER_NAMESPACE+"userList");
		} catch (Exception e) {
			System.out.println("select 오류 : "+e);
		} finally {
			session.close();
		}
		return userlist;
	}

	@Override
	public String find_id(String user_email) {
		SqlSession session = null;
		String result_id = null;
		UserDto dto = new UserDto(); 
		
		try {
			session = getSqlSessionFactory().openSession(true);
			result_id = session.selectOne(USER_NAMESPACE+"findId",user_email);
		} catch (Exception e) {
			System.out.println("find_id 오류 : " + e);
		}finally {
			session.close();
		}
		return result_id;
	}

	

	

	

}
