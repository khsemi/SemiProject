package semi.KHC.mapDao;



import semi.KHC.mapDto.MapDto;

public interface MapDao {
	String MAP_NAMESPACE = "kh_map.";

	public int insertMap(MapDto mapdto);
	public MapDto detailMap(int map_seq_id);
	public int updateMap(MapDto dto);
	public int deleteMap (int maps_seq_id);
	
}
