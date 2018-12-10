package semi.KHC.noteDao;

import java.util.List;

import semi.KHC.noteDto.NoteDto;

public interface NoteDao {
	String NOTE_NAMESPACE = "kh_note.";
	public List<NoteDto> selectAll(String user_id);
	public NoteDto selectOne(int note_seq_id);
	public int insert(NoteDto notedto);
}
