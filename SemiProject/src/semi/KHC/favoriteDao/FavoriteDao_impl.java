package semi.KHC.favoriteDao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDao.SqlMapConfig;

public class FavoriteDao_impl extends SqlMapConfig implements FavoriteDao{

	/*
	@Override
	public boolean favorite_check(int board_seq_id, int user_seq) {
		SqlSession session = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_seq_id", board_seq_id);
		map.put("user_seq", user_seq);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			//result 가 null이면, 추천/비추천을 한적이 없다는 뜻이다
			String result = session.selectOne(FAVORITE_NAMESPACE+"favoriteCheck",map);
			System.out.println("FavoriteDao check : "+result);
			//null이 아니면 추천/비추천을 한적이 있다는 것임.
			if(result != null) {
				System.out.println("추천/비추천을 이미 한 user");
				//return false를 해주어 추천/비추천을 할 수 없도록 해야한다.
				return false;
			}
		} catch (Exception e) {
			System.out.println("favorite_check 오류 : "+e);
			return false;
		} finally {
			session.close();
		}
		System.out.println("추천/비추천을 할 수 있는 user");
		return true;
	}
	*/

	@Override
	public boolean favorite_insert_up(int board_seq_id, int user_seq) {
		SqlSession session = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_seq_id", board_seq_id);
		map.put("user_seq", user_seq);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.insert(FAVORITE_NAMESPACE+"favoriteInsert_up",map);
			System.out.println("추천 성공!");
		} catch (Exception e) {
			System.out.println("favorite_insert_up 오류 : "+e);
			return false;
		}finally {
			session.close();
		}
		return true;
	}
	
	@Override
	public boolean favorite_insert_down(int board_seq_id, int user_seq) {
		SqlSession session = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_seq_id", board_seq_id);
		map.put("user_seq", user_seq);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.insert(FAVORITE_NAMESPACE+"favoriteInsert_down",map);
			System.out.println("비추천 성공!");
		} catch (Exception e) {
			System.out.println("favorite_insert_down 오류 : "+e);
			return false;
		}finally {
			session.close();
		}
		return true;
	}

	@Override
	public int favorite_select(int board_seq_id, int user_seq) {
		SqlSession session = null;
		int result = 0;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_seq_id", board_seq_id);
		map.put("user_seq", user_seq);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			//result 가 null이면, 추천/비추천을 한적이 없다는 뜻이다
			result = session.selectOne(FAVORITE_NAMESPACE+"favoriteSelect",map);
			System.out.println("Favorite_select : "+result);
			//null이 아니면 추천/비추천을 한적이 있다는 것임.
			
		} catch (Exception e) {
			System.out.println("favorite_select 오류 : 값이 없어서여 "+e);
			System.out.println("이 게시글(board_seq_id)"+board_seq_id+" 추천/비추천을 할 수 있는 user");
			return (Integer)result;
		} finally {
			session.close();
		}
		System.out.println("이미 추천을 한 user입니다. 추천/비추천 값을 리턴 합니다.");
		return result;
	}
	
	@Override
	public boolean favorite_delete(int board_seq_id, int user_seq) {
		SqlSession session = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_seq_id", board_seq_id);
		map.put("user_seq", user_seq);
		try {
			session = getSqlSessionFactory().openSession(true);
			session.delete(FAVORITE_NAMESPACE+"favoriteDelete",map);
			System.out.println("추천/비추천 삭제 성공!");
		} catch (Exception e) {
			System.out.println("favorite_delete 오류 : "+e);
			return false;
		}finally {
			session.close();
		}
		return true;
	}

	@Override
	public boolean favorite_mul_delete(int board_seq_id) {
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.delete(FAVORITE_NAMESPACE+"favoriteMulDelete",board_seq_id);
			System.out.println("FavoriteDao_impl mul_delete 성공!");
		} catch (Exception e) {
			System.out.println("FavoriteDao_mul_delete 오류 : "+e);
			return false;
		}finally {
			session.close();
		}
		return true;
	}
}
