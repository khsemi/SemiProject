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
		NoteDto notedto = new NoteDto();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			notedto = session.selectOne(NOTE_NAMESPACE+"selectOne", note_seq_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return notedto;
	}
	@Override
	public int insert(NoteDto notedto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(NOTE_NAMESPACE+"insert", notedto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
}
