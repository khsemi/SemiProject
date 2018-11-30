package semi.KHC.pointDao;

import java.util.ArrayList;
import java.util.List;

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

}
