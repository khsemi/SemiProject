package semi.KHC.pointDao;

import java.util.List;

import semi.KHC.pointDto.PointDto;

public interface PointDao {
	String USER_NAMESPACE = "kh_point.";

	public List<PointDto> selectAll(int user_seq);
	public int select(int user_seq, String point_state);
}
