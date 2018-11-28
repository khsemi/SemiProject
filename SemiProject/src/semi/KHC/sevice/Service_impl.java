package semi.KHC.sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import semi.KHC.boardDao.BoardDao;
import semi.KHC.boardDto.BoardDto;
import semi.KHC.userDao.UserDao;
import semi.KHC.userDao.UserDao_impl;
import semi.KHC.userDto.UserDto;
import semi.KHC.boardDao.BoardDao_impl;

public class Service_impl implements Service{
	
	@Override
	public Map<String, Object> board(String category, int page) {
		BoardDao board = new BoardDao_impl();
		Map<String, Object> result = new HashMap<String, Object>();
		int totalCount = board.totalCount(category);
		result.put("totalCount", totalCount);
		List<BoardDto> boardList = board.selectPage(category, page);
		result.put("boardList", boardList);
		
		return result;
	}
	
	@Override
	public Map<String, Object> board_search(String category, int page, String keyword) {
		BoardDao board = new BoardDao_impl();
		Map<String, Object> result = new HashMap<String, Object>();
		
		int totalCount_search = board.totalCount_search(category, keyword);
		result.put("totalCount", totalCount_search);
		
		List<BoardDto> boardList= board.selectPage_search(category,page, keyword);
		result.put("boardList", boardList);
		return result;
	}
	
	@Override
	public UserDto login(String user_id, String user_pw) {
		UserDao dao = new UserDao_impl();
		UserDto dto = dao.login(user_id);
		System.out.println(dto.getUser_pw());
		System.out.println(user_pw);
		if(dto.getUser_pw().equals(user_pw)) {
			//로그인 성공
			System.out.println("성공");
			return dto;
		}
		return null;
	}
	
	@Override
	public BoardDto board_detail(int board_seq_id) {
		BoardDao board = new BoardDao_impl();
		BoardDto dto = board.detail(board_seq_id);
		return dto;
	}
	@Override
	public int board_insert(String board_category, String board_title, String board_content, int user_seq) {
		BoardDao board = new BoardDao_impl();
		BoardDto dto = new BoardDto(board_category, board_title, board_content, user_seq);
		return board.insert(dto);
	}
	@Override
	public int board_update(int board_seq_id, String board_title, String board_content) {
		BoardDao board = new BoardDao_impl();
		BoardDto dto = new BoardDto(board_seq_id, board_title, board_content);
		return board.update(dto);
	}
	@Override
	public boolean board_delete(int board_seq_id) {
		BoardDao board = new BoardDao_impl();
		int result = board.delete(board_seq_id);
		
		if(result > 0) {
			return true;
		}
		return false;		
	}
}
