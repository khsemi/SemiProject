package semi.KHC.mapDao;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDao.SqlMapConfig;
import semi.KHC.mapDto.MapDto;

public class MapDao_impl extends SqlMapConfig implements MapDao {

	@Override
	public int insertMap(MapDto mapdto) { 
		SqlSession session = null;
		int map_seq_id = 0;
		System.out.println("insertMap mapdto x : " + mapdto.getMaps_x());
		System.out.println("insertMap mapdto x : " + mapdto.getMaps_y());
		
		try {
			session = getSqlSessionFactory().openSession(true);
			session.insert(MAP_NAMESPACE +"insertmap",mapdto);
			                       //kh_map.       // ?
			map_seq_id = mapdto.getMaps_seq_id();

		} catch(Exception e) {
			System.out.println("insert 오류 : " + e);
		
		} finally {
			session.close();
			
		}
		
		return map_seq_id;//맵아이디 리턴
	}
	
	@Override
	public MapDto detailMap(int map_seq_id) {
		MapDto mapdto = new MapDto();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			mapdto = session.selectOne(MAP_NAMESPACE+ "detailmap", map_seq_id);
														//??
			
		} catch (Exception e) {
			System.out.println("detailMap 오류 : "+ e);
		} finally {
			session.close();
		}
		return mapdto;
	}
	
	@Override
	public int updateMap(MapDto mapdto) {
		SqlSession session = null;
		int maps_seq_id = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(MAP_NAMESPACE + "updatemap", mapdto);
			maps_seq_id = mapdto.getMaps_seq_id();
		} catch (Exception e) {
			System.out.println("updateMap 오류 : "+e);
		} finally {
			session.close();
		}
		return maps_seq_id;
	}
	
	@Override
	public int deleteMap(int maps_seq_id) {
		SqlSession session = null;
		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			result = session.delete(MAP_NAMESPACE + "deletemap", maps_seq_id);
		} catch (Exception e) {
			System.out.println("deleteMap 오류 : "+e);
		} finally {
			session.close();
		}
		return result;
	}
}
