package semi.KHC.sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import semi.KHC.boardDao.BoardDao;
import semi.KHC.boardDto.BoardDto;
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
}
