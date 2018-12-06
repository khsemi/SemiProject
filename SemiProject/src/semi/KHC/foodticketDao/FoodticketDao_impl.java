package semi.KHC.foodticketDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDao.SqlMapConfig;
import semi.KHC.foodticketDto.FoodticketDto;

public class FoodticketDao_impl extends SqlMapConfig implements FoodticketDao {

	@Override
	public int insert(FoodticketDto foodticketDto) {
		
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			session.insert(FOODTICKET_NAMESPACE + "insert", foodticketDto);
			res = foodticketDto.getFoodticket_seq_id();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
}

	@Override
	public int update(int foodticket_seq_id, String qrcode) {
		SqlSession session = null;
		Map<String, Object> FT_map = new HashMap<String, Object>();
		FT_map.put("foodticket_qrcode", qrcode);
		FT_map.put("foodticket_seq_id", foodticket_seq_id);
		
		int res = 0;
				
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(FOODTICKET_NAMESPACE+"update", FT_map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public List<FoodticketDto> selectAll(int user_seq) {
		List<FoodticketDto> list = new ArrayList<FoodticketDto>();
		
		SqlSession session = null;		
		try {
			session=getSqlSessionFactory().openSession(true);
			list = session.selectList(FOODTICKET_NAMESPACE+"selectAll", user_seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	
//
//	@Override
//	public int Num() {
//		SqlSession session = null;
//		int res = 0;
//		try {	
//		session=getSqlSessionFactory().openSession(true);
//		res = session.selectOne(FOODTICKET_NAMESPACE +"num");
//		} catch (Exception e) {
//		e.printStackTrace();
//		} finally {
//		session.close();
//		}
//		return res;
//	}

}
