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
		
		session = getSqlSessionFactory().openSession(true);
		pointlist = session.selectList(USER_NAMESPACE+"selectAll", user_seq);
		
		session.close();
		
		return pointlist;
	}
	
	@Override
	public int select(int user_seq, String point_state) {
		int point = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_seq", user_seq);
		map.put("point_state", point_state);
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		point = session.selectOne(USER_NAMESPACE+"select", map);
		
		session.close();
		
		return point;
	}
}
