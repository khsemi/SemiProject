package semi.KHC.sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import semi.KHC.boardDao.BoardDao;
import semi.KHC.boardDao.BoardDao_impl;
import semi.KHC.boardDto.BoardDto;
import semi.KHC.commentDao.CommentDao;
import semi.KHC.commentDao.CommentDao_impl;
import semi.KHC.commentDto.CommentDto;
import semi.KHC.pointDao.PointDao;
import semi.KHC.pointDao.PointDao_impl;
import semi.KHC.pointDto.PointDto;
import semi.KHC.userDao.UserDao;
import semi.KHC.userDao.UserDao_impl;
import semi.KHC.userDto.UserDto;
import util.Gmail;
import util.SHA256;

public class Service_impl implements Service{
	
	@Override
	public Map<String, Object> board(String category, int page) {
		BoardDao boardDao = new BoardDao_impl();
		Map<String, Object> result = new HashMap<String, Object>();
		int totalCount = boardDao.totalCount(category);
		result.put("totalCount", totalCount);
		List<BoardDto> boardList = boardDao.selectPage(category, page);
		result.put("boardList", boardList);
		
		return result;
	}
	
	@Override
	public Map<String, Object> board(int user_seq, int page) {
		BoardDao boardDao = new BoardDao_impl();
		Map<String, Object> result = new HashMap<String, Object>();
		int totalCount = boardDao.totalCount(user_seq);
		result.put("totalCount", totalCount);
		List<BoardDto> boardList = boardDao.selectPage(user_seq, page);
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
	public UserDto user_login(String user_id, String user_pw) {
		UserDao dao = new UserDao_impl();
		UserDto dto = dao.login(user_id);
		if(dto.getUser_pw().equals(user_pw)) {
			return dto;
		}
		return null;
	}
	
	@Override
	public Map<String, Object> board_detail(int board_seq_id) {
		BoardDao board = new BoardDao_impl();
		CommentDao commentDao = new CommentDao_impl();
		Map<String, Object> detailMap = new HashMap<String, Object>();
		
		BoardDto boardDto = board.detail(board_seq_id);
		detailMap.put("boardDto", boardDto);
		List<CommentDto> commentList = commentDao.selectList(board_seq_id);
		detailMap.put("commentList", commentList);
		return detailMap;
	}
	@Override
	public BoardDto board_selectOne(int board_seq_id) {
		BoardDao board = new BoardDao_impl();
		BoardDto boardDto = board.detail(board_seq_id);
		return boardDto;
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
	
	@Override
	public List<PointDto> point_selectAll(int user_seq) {
		PointDao dao = new PointDao_impl();
		List<PointDto> pointlist = dao.selectAll(user_seq);
		
		return pointlist;
	}
	@Override
	public int point(int user_seq, String point_state) {
		PointDao dao = new PointDao_impl();
		int point = dao.select(user_seq, point_state);
		
		return point;
	}

	@Override
	public boolean user_join(String user_id, String user_pw, String user_name, String user_nickname, String user_address, String user_email, String user_phone) {
		UserDao userDao = new UserDao_impl();
		boolean result = userDao.join(new UserDto(user_id, user_pw, user_name, user_nickname, user_address, user_email, user_phone));
	
		return result;
	}

	@Override
	public boolean user_sendEmail(String user_id) {
		UserDao userDao = new UserDao_impl();
		String host = "http://localhost:8787/SemiProject/controller.do";
		String from = "ggjs9812@gmail.com";
		String to = userDao.getUser_email(user_id);
		String subject = "KH Comunity 회원가입 이메일 인증 서비스 입니다.";
		String content = "다음 링크에 접속하여 이메일 인증을 완료하세요!"+
			"<a href='"+host+"?category=emailCheck&user_id="+user_id+"&code="+new SHA256().getSHA256(to)+"'>Click Here!</a>";
		
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable","true");
		p.put("mail.smtp.auth","true");
		p.put("mail.smtp.debug","true");
		p.put("mail.smtp.socketFactory.port","465");
		p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback","false");
		
		
		try{
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO,toAddr);
			msg.setContent(content,"text/html;charset=UTF8");
			Transport.send(msg);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean user_setEmailCheck(String user_id, String code) {
		UserDao userDao = new UserDao_impl();
		String userEmail= userDao.getUser_email(user_id);
		boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
		
		if(isRight == true){
			userDao.setUser_email(user_id);
			//인증 성공시
			return true;
		}
		//인증 실패시(코드 유효 시간 오버)
		return false;
	}
	
}
