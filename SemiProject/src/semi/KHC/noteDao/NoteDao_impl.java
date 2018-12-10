package semi.KHC.noteDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi.KHC.boardDao.SqlMapConfig;
import semi.KHC.noteDto.NoteDto;

public class NoteDao_impl extends SqlMapConfig implements NoteDao {
	
	@Override
	public List<NoteDto> selectAll(String user_id) {
		List<NoteDto> notelist = new ArrayList<NoteDto>();
		Map<String, Object> userIdmap = new HashMap<String, Object>();
		userIdmap.put("send_user_id", user_id);
		userIdmap.put("recive_user_id", user_id);
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			notelist = session.selectList(NOTE_NAMESPACE+"selectAll", userIdmap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return notelist;
	}
	@Override
	public NoteDto selectOne(int note_seq_id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insert(NoteDto notedto) {
		// TODO Auto-generated method stub
		return 0;
	}
}
