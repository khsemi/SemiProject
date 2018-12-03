package semi.KHC.pointDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDao.SqlMapConfig;
import semi.KHC.pointDto.PointDto;

public class PointDao_impl extends SqlMapConfig implements PointDao {

	@Override
	public List<PointDto> selectAll(int user_seq) {
		List<PointDto> pointlist = new ArrayList<PointDto>();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			pointlist = session.selectList(POINT_NAMESPACE+"selectAll", user_seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return pointlist;
	}
	
	@Override
	public int select(int user_seq, String point_state) {
		int point = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_seq", user_seq);
		map.put("point_state", point_state);
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			point = session.selectOne(POINT_NAMESPACE+"select", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return point;
	}
	
	@Override
	public int pointInsert(int user_seq, int point_balance) {
		int res = 0;
		Map<String, Object> pointMap = new HashMap<String, Object>();
		
		pointMap.put("user_seq", user_seq);
		pointMap.put("point_balance", point_balance);
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(POINT_NAMESPACE+"pointInsert", pointMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
}
