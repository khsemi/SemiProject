package semi.KHC.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.KHC.boardDto.BoardDto;
import semi.KHC.foodticketDto.FoodticketDto;
import semi.KHC.mapDto.MapDto;
import semi.KHC.noteDto.NoteDto;
import semi.KHC.pointDto.PointDto;
import semi.KHC.sevice.Service;
import semi.KHC.sevice.Service_impl;
import semi.KHC.userDto.UserDto;
import semi.KHC.calendarDao.*;
import semi.KHC.calendarDto.CalDto;

@WebServlet("/controller.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html; charset=UTF-8");
		
		Service service = new Service_impl();
		 semi.KHC.calendarDao.CalDao dao = new semi.KHC.calendarDao.CalDao();
		
		HttpSession session = request.getSession(false);
		//command 값을 받아온다.
		String category = request.getParameter("category");
		
		System.out.println("카테고리 : [ " + category + " ]");
		
		//command 값을 비교후에 각각의 if문을 실행하게 한다.
		if(category.equals("QA") || category.equals("TIPS") || category.equals("STUDY") || category.equals("NOTICE") || category.equals("COMMUNITY")
				 || category.equals("TRADE") || category.equals("JOBS") || category.equals("FOODINFO")) {
			//View 에서 받아오는 값 
			int page = Integer.parseInt(request.getParameter("page"));
			String sortType = request.getParameter("sortType");
			//service를 통해 값을 전달받아 boardMap에 저장한다.
			Map<String, Object> boardMap = service.board(category, page, sortType);
			
			//다시 View에 넘겨주기위해 필요한 값들을 request에 setAttribute 해준다.
			request.setAttribute("sortType", sortType);
			request.setAttribute("page", page);
			request.setAttribute("category", category);
			request.setAttribute("totalCount",boardMap.get("totalCount"));
			request.setAttribute("boardList", boardMap.get("boardList"));
			
			//request,responce에 들어있는 값을 가지고 dispatch를 통해 "board.jsp" 로 보내준다.
			dispatch("board.jsp", request, response);
		}else if(category.equals("QA_search") || category.equals("TIPS_search") || category.equals("STUDY_search")) {
			//category.equlas(category+"_search") 얘는 왜 안됨?
			
			//View에서 받아온 값들을 재사용하기위해(검색 한 후 페이징을 되게하려면) 저장
			int page = Integer.parseInt(request.getParameter("page"));
			//String searchType = request.getParameter("searchType");
			String keyword = request.getParameter("keyword");
			String sortType = request.getParameter("sortType");
			
			//service를 통해 값을 전달받아 boardMap에 저장한다.
			Map<String, Object> boardMap = service.board_search(category, page, keyword, sortType);
			
			//다시 View에 넘겨주기위해 필요한 값들을 request에 setAttribute 해준다.
			request.setAttribute("sortType", sortType);
			request.setAttribute("page", page);
			request.setAttribute("category", category);
			request.setAttribute("totalCount", boardMap.get("totalCount"));
			request.setAttribute("boardList", boardMap.get("boardList"));
			// request.setAttribute("searchType", searchType);
			request.setAttribute("keyword", keyword);

			// request,responce에 들어있는 값을 가지고 dispatch를 통해 "board.jsp" 로 보내준다.
			dispatch("board.jsp", request, response);
		} else if (category.equals("board_detail")) {
			BoardDto dto = service.board_selectOne(Integer.parseInt(request.getParameter("board_seq_id")));
			int board_seq_id = Integer.parseInt(request.getParameter("board_seq_id"));
			System.out.println("board_seq_id : " + board_seq_id);
			System.out.println("detail로 maps_id 전달됬는지 확인" +dto.getMaps_id());
			
			System.out.println(session != null);
			
			if(dto.getMaps_id()>0) {
				MapDto mapdto = service.map_detail(dto.getMaps_id());
				
				//내가 해야할 곳
				request.setAttribute("mapdto", mapdto);
			}
			
			if(session != null) {
				int user_seq = Integer.parseInt(request.getParameter("user_seq"));
				//System.out.println("Controller.board_detail.favorite_select : "+service.favorite_select(board_seq_id, user_seq));
				System.out.println("user_seq : "+user_seq);
				request.setAttribute("favorite", service.favorite_select(board_seq_id, user_seq));
			}
			
			Map<String, Object> detailMap = service.board_detail(board_seq_id);
			
			request.setAttribute("boardDto", detailMap.get("boardDto"));
			request.setAttribute("commentList", detailMap.get("commentList"));
			
			dispatch("board_detail.jsp", request, response);
		} else if (category.equals("TIPS_insertForm") || category.equals("QA_insertForm") || category.equals("STUDY_insertForm") || category.equals("NOTICE_insertForm") || category.equals("COMMUNITY_insertForm")
				 || category.equals("TRADE_insertForm") || category.equals("JOBS_insertForm") || category.equals("FOODINFO_insertForm")) {
			//로그인을 하지않았다면 글을 쓸수없다.(조건 추가)
			if(session != null) {
				// category 값을 request에 담는다
				request.setAttribute("category", category);
				// board_insert.jsp 에 실어서 보낸다.
				dispatch("board_insertForm.jsp", request, response);
			}else {
				System.out.println("로그인이 되어있지 않은 상태");
				response.sendRedirect("khc_login.jsp");
			}
		} else if (category.equals("board_insert")) {
			System.out.println(Integer.parseInt(request.getParameter("user_seq")));
			int maps_id = 0;
			int board_seq_id = 0;
			System.out.println("컨트롤러로 값 전달(장소,위도,경도)");
			System.out.println(request.getParameter("location"));
			System.out.println(request.getParameter("latitude"));
			System.out.println(request.getParameter("longtitude"));
			System.out.println("------------------------------------------------------");
			
			maps_id = service.maps_insert(request.getParameter("location"), request.getParameter("latitude"), request.getParameter("longtitude") );
            //request 한 데이터의 순서가 중요!!!
			System.out.println("maps_id : "+maps_id +" | 일단 맵테이블 저장 성공 후 맵 시퀀스 번호 리턴받음");
			// service.board_insert 는 글입력이 성공하면 입력한 글의 board_seq_id를 리턴한다.
			
			if(maps_id > 0) {
				//2
				board_seq_id = service.board_insert_map(request.getParameter("categoryType"), request.getParameter("title"), request.getParameter("content"), Integer.parseInt(request.getParameter("user_seq")),maps_id);
				System.out.println(board_seq_id);
			} else {
				board_seq_id = service.board_insert(request.getParameter("categoryType"), request.getParameter("title"), request.getParameter("content"), Integer.parseInt(request.getParameter("user_seq")));
			}
			request.setAttribute("maps_id",maps_id);
			//board_seq_id = service.board_insert(request.getParameter("categoryType"), request.getParameter("title"), request.getParameter("content"), Integer.parseInt(request.getParameter("user_seq")));
			// 리턴된 board_seq_id를 controller detail에 보내어 글을 입력하자마자 내가 쓴글을 보게 한다.
			request.setAttribute("user_seq", Integer.parseInt(request.getParameter("user_seq")));
			dispatch("controller.do?category=board_detail&board_seq_id=" + board_seq_id, request, response);
		} else if (category.equals("board_updateForm")) { 
			BoardDto dto = service.board_selectOne(Integer.parseInt(request.getParameter("board_seq_id")));
			if(dto.getMaps_id()>0) {
				MapDto mapdto = service.map_detail(dto.getMaps_id());
				request.setAttribute("mapdto", mapdto);

			}
			
			request.setAttribute("dto", dto);
			dispatch("board_updateForm.jsp", request, response);
		} else if (category.equals("board_update")) {
			int maps_id = 0;
			int board_seq_id = 0;
			String location = request.getParameter("location");
			System.out.println("board_seq_id : " +Integer.parseInt(request.getParameter("board_seq_id")));
			System.out.println("업데이트------------------------------------------------------");
			// service.board_update 는 글입력이 성공하면 입력한 글의 board_seq_id를 리턴한다.
			System.out.println(location);
			if(location != null) {
				System.out.println(request.getParameter("latitude"));
				System.out.println(request.getParameter("longtitude"));
				System.out.println(Integer.parseInt(request.getParameter("maps_seq_id")));
				System.out.println("------------------------------------------------------");
				maps_id = service.maps_update(Integer.parseInt(request.getParameter("maps_seq_id")), request.getParameter("location"), request.getParameter("latitude"), request.getParameter("longtitude"));
				//int maps_id = service.maps_name
				// service.board_update 는 글입력이 성공하면 입력한 글의 board_seq_id를 리턴한다.
				System.out.println("maps_id : "+maps_id +" | 일단 맵테이블 저장 성공 후 맵 시퀀스 번호 리턴받음");
				if(maps_id > 0) {
					System.out.println("여기까지 넘어옴 : borad_seq_id : "+Integer.parseInt(request.getParameter("board_seq_id")));
					 board_seq_id = service.board_update_map(Integer.parseInt(request.getParameter("board_seq_id")),request.getParameter("title"), request.getParameter("content"),maps_id);
				}
			} else {
				 board_seq_id = service.board_update(Integer.parseInt(request.getParameter("board_seq_id")),request.getParameter("title"), request.getParameter("content"));
			}// 리턴된 board_seq_id를 controller detail에 보내어 글을 입력하자마자 내가 쓴글을 보게 한다.
			System.out.println(board_seq_id);
			request.setAttribute("maps_id", maps_id);
			
			//board_seq_id = service.board_update(Integer.parseInt(request.getParameter("board_seq_id")),request.getParameter("title"), request.getParameter("content"));
			// 리턴된 board_seq_id를 controller detail에 보내어 글을 입력하자마자 내가 쓴글을 보게 한다.
			response.sendRedirect("controller.do?category=board_detail&board_seq_id=" + board_seq_id+"&user_seq="+Integer.parseInt(request.getParameter("user_seq")));
		} else if (category.equals("board_delete")) {
			int maps_seq_id = Integer.parseInt(request.getParameter("maps_id"));
			System.out.println("delete Maps_seq_id : " + maps_seq_id);
			int board_seq_id = Integer.parseInt(request.getParameter("board_seq_id"));
			System.out.println(board_seq_id);
			if(service.maps_delete(Integer.parseInt(request.getParameter("maps_id")))) {
				System.out.println("map 삭제완료");
			}
			//if(service -> dao.delete 의 결과가 true 라면, 
			if (service.board_delete(Integer.parseInt(request.getParameter("board_seq_id")))) {
				//response를 이용하여 controller에 category와 page를 보내주어 내가 지운 글의 category의 1page를 보여준다.
				response.sendRedirect("controller.do?category=" + request.getParameter("categoryType") + "&page=1&sortType=BOARD_REGDATE");
				// dispatch("controller.do?category="+request.getParameter("categoryType")+"&page=1",request, response);
			}
		} else if (category.equals("LOGIN")) {
			request.setAttribute("category", category);
			dispatch("khc_login.jsp", request, response);
			
		} else if (category.equals("LOGIN_CHECK")) {
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			UserDto userDto = service.user_login(user_id, user_pw);
			if(userDto!=null) {
				if(userDto.getUser_emailchecked().equals("TRUE")) {
					session = request.getSession();
					//로그인 정보를 세션에 담아준다.
					session.setAttribute("userDto", userDto);
					request.setAttribute("category", category);
					dispatch("controller.do?category=MAIN", request, response);
				}else {
					request.setAttribute("user_id", user_id);
					dispatch("khc_sendEmailForm.jsp", request, response);
				}
			} else {
				
				dispatch("khc_login.jsp", request, response);
			}
			
			

		} else if (category.equals("MAIN")) {
			List<BoardDto> boardlist = new ArrayList<BoardDto>();
			boardlist = service.boardAll();
			request.setAttribute("boardlist", boardlist);
			
			dispatch("KHC.jsp", request, response);
		} else if (category.equals("MYPAGE")) {
			UserDto userDto = (UserDto)session.getAttribute("userDto");
			int page = Integer.parseInt(request.getParameter("page"));
			int user_seq = userDto.getUser_seq();
			
			Map<String, Object> boardMap = service.board(user_seq, page);
//			내가 쓴 글 보이기 
			request.setAttribute("page", page);
			request.setAttribute("category", request.getParameter("category"));
			request.setAttribute("totalCount", boardMap.get("totalCount"));
			request.setAttribute("boardList", boardMap.get("boardList"));
			dispatch("myboard.jsp", request, response);
		} else if (category.equals("JOIN")) {
			dispatch("khc_join.jsp", request, response);
		} else if (category.equals("LOGOUT")) {
			//세션을 해지시켜준다.
			if(session != null) {
				session.invalidate(); //invalidate()를 하면 session안에 값들이 삭제되는데,
									//null값이 되진 않아서 
				session = null;    //다시 null로 만들어줬음 다른방법을 찾아서 적용하는게 좋아보임
			}
			
			dispatch("controller.do?category=MAIN", request, response);
		} else if (category.equals("POINT")) {
			UserDto userdto = (UserDto)session.getAttribute("userDto");
			
			int point_val = 0;
			//포인트 충전 성공시
			if(request.getParameter("point_val") != null) {
				point_val=Integer.parseInt(request.getParameter("point_val"));
				service.point_insert(userdto.getUser_seq(), point_val, "충전");
			}		
			
			List<PointDto> list = service.point_selectAll(userdto.getUser_seq());
			int point_charge = 0;
			int point_use = 0;
			point_charge = service.point(userdto.getUser_seq(), "충전");
			point_use = service.point(userdto.getUser_seq(), "사용");
			
			request.setAttribute("pointlist", list);
			request.setAttribute("point", point_charge-point_use);
			dispatch("point.jsp", request, response);

		} else if(category.equals("POINT_CHARGE")) {
			int point_val = Integer.parseInt(request.getParameter("point_val"));
			request.setAttribute("point_val", point_val);
			dispatch("paymentAction.jsp", request, response);
		} else if(category.equals("user_insert")) {
			String user_id = request.getParameter("user_id");
			if(service.user_join(user_id, request.getParameter("user_pw"), request.getParameter("user_name"), request.getParameter("user_nickname"), request.getParameter("user_address"), request.getParameter("user_email"), request.getParameter("user_phone"))) {
				request.setAttribute("user_id", user_id);
				request.setAttribute("category", category);
				//이메일 인증을 보냈고 이메일 링크를 클릭하라는 jsp 페이지로 보내준다.
				dispatch("khc_sendEmailForm.jsp", request, response);
			}else {
				response.sendRedirect("khc_join.jsp");
				System.out.println("회원가입 실패! 중복된 값들이 있습니다.");
			}
		}else if(category.equals("sendEmail")) {
			String user_id = request.getParameter("user_id");
			//여기서 이메일을 보내준다.
			if(service.user_sendEmail(user_id)) {
				dispatch("khc_sendEmail_resultForm.jsp", request, response);
			}else {
				System.out.println("이메일 보내기 오류");
			}
		}else if(category.equals("emailCheck")) {
			System.out.println(request.getParameter("user_id"));
			boolean result = service.user_setEmailCheck(request.getParameter("user_id"), request.getParameter("code"));
			
			if(result) {
				response.sendRedirect("khc_login.jsp");
			}else {
				System.out.println("실패!");
			}
		}else if (category.equals("NOTE")) {
			UserDto userdto = (UserDto)session.getAttribute("userDto");
			String user_nickname = userdto.getUser_nickname();
			List<NoteDto> notelist = service.note_selectAll(user_nickname);
			
			request.setAttribute("notelist", notelist);
			dispatch("note.jsp", request, response);
			
		}else if (category.equals("USER_INFO")) {
			//회원정보 페이지로 이동
			dispatch("user_info.jsp", request, response);
			
		}else if (category.equals("USER_UPDATEFORM")) {
			//정보 수정 페이지로 이동
			
			dispatch("user_update.jsp", request, response);
			
		}else if (category.equals("USER_UPDATE")) {
			//정보수정 완료 할것
			//	UserDto U_Dto = new UserDto(request.getParameter("id"), request.getParameter("pw"), request.getParameter("name"), request.getParameter("nickname"), request.getParameter("address"), request.getParameter("phone"));
			UserDto update_userdto = new UserDto(Integer.parseInt(request.getParameter("user_seq")),request.getParameter("pw"), request.getParameter("nickname"), request.getParameter("address"), request.getParameter("phone"));
			int res = 0;
			res=service.user_update(update_userdto);
			if(res != 0) {
				session.invalidate(); 
				session = null; 
			}
			dispatch("KHC.jsp", request, response);
			
		}else if (category.equals("USER_DELETE")) {
			service.user_delete(Integer.parseInt(request.getParameter("user_seq")));
			session.invalidate(); 
			session = null; 
			dispatch("KHC.jsp", request, response);
		}else if (category.equals("FOODTICKET")) {
			UserDto userdto = (UserDto)session.getAttribute("userDto");
			int point_charge = 0;
			int point_use = 0;
			point_charge = service.point(userdto.getUser_seq(), "충전");
			point_use = service.point(userdto.getUser_seq(), "사용");
			
			List<FoodticketDto> foodlist = service.foodticket_selectAll(userdto.getUser_seq());
			
			request.setAttribute("foodlist", foodlist);
			request.setAttribute("point", point_charge-point_use);
			dispatch("foodticket.jsp", request, response);
		} else if (category.equals("FOODTICKET_INSERT")) {
			
			UserDto userdto = (UserDto)session.getAttribute("userDto");
			String foodticket_name = request.getParameter("foodticket_name").split("_")[0];
			int foodticket_pay = Integer.parseInt(request.getParameter("foodticket_name").split("_")[1]);
			
			if(Integer.parseInt(request.getParameter("point")) < foodticket_pay) {
				response.sendRedirect("controller.do?category=FOODTICKET");
			}else {
				Map<String, Object> FT_map = service.foodticket_insert(userdto.getUser_seq(), foodticket_name, foodticket_pay);

				int foodticket_seq_id = (int)FT_map.get("foodticket_seq_id");
				int point_val = (int)FT_map.get("foodticket_pay");
				
				String qrcode = ""+foodticket_seq_id+"_"+foodticket_name+"_"+foodticket_pay;
				
				service.foodticket_update(foodticket_seq_id, qrcode);
				if(point_val > 0) {
						service.point_insert(userdto.getUser_seq(), point_val, "사용");
				}
				response.sendRedirect("controller.do?category=FOODTICKET");
			}
		} else if(category.equals("PROFILESEARCH")) {
			List<UserDto> list = service.userList();
			request.setAttribute("userlist", list);
			dispatch("profileSearch.jsp", request, response);
		} else if(category.equals("PROFILESEARCH_KEYWORD")) {
			String keyword = request.getParameter("keyword");
			List<UserDto> list = service.userSearchList(keyword);
			request.setAttribute("userlist", list);
			dispatch("profileSearch.jsp", request, response);
		} else if(category.equals("NOTEDETAIL")) {
			int note_seq_id = Integer.parseInt(request.getParameter("note_seq_id"));
			NoteDto notedto = null;
			notedto = service.noteDetail(note_seq_id);
			request.setAttribute("notedto", notedto);
			
			dispatch("noteDetail.jsp", request, response);
		} else if(category.equals("NOTESENDINGFORM")) {
			String recive_user_id = request.getParameter("recive_user_id");
			request.setAttribute("recive_user_id", recive_user_id);
			dispatch("noteSendingForm.jsp", request, response);
		} else if(category.equals("NOTESEND")) {
			String send_user_id = request.getParameter("user_nickname");
			String recive_user_id = request.getParameter("recive_user_id");
			String note_title = request.getParameter("note_title");
			String note_content = request.getParameter("note_content");
			
			NoteDto notedto = new NoteDto(note_title, note_content, send_user_id, recive_user_id);
			service.noteInsert(notedto);
			response.setContentType("text/html; charset=utf-8");

			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('쪽지를 보냈습니다.');");
			out.println("window.close();");
			out.println("</script>");
		}else if(category.equals("CALENDAR")) {
			dispatch("calendar.jsp", request, response);

		}else if(category.equals("insertcal")) {
			String year=request.getParameter("year");
	         String month=request.getParameter("month");
	         String date= request.getParameter("date");
	         String hour = request.getParameter("hour");
	         String min = request.getParameter("min");
	         
	         String title=request.getParameter("title");
	         String content=request.getParameter("content");
	          
	         UserDto userdto = (UserDto)session.getAttribute("userDto");
	         String mdate = year+Util.istwo(month)+Util.istwo(date)+Util.istwo(hour)+Util.istwo(min);

	         int res = dao.insert(new CalDto(userdto.getUser_seq(),title,content,mdate,"USER")); 
	         
	         if(res>0) {
	             response.sendRedirect("controller.do?category=CALENDAR");
	          }else {
	         	 request.setAttribute("msg", "일정등록 실패");
	         	 dispatch("error.jsp",request,response); 
	       }
		}else if(category.equals("callist")) {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String date = request.getParameter("date");
			UserDto userdto = (UserDto) session.getAttribute("userDto");

			String yyyyMMdd = year + Util.istwo(month) + Util.istwo(date);

			session.setAttribute("ymd", yyyyMMdd);

			List<CalDto> list = dao.selectAll(userdto.getUser_seq(), yyyyMMdd);
			request.setAttribute("list", list);
			dispatch("callist.jsp",request,response);
		} else if(category.equals("muldel")) {
			String[] CAL_SEQ_ID = request.getParameterValues("chk");
			int res = dao.multiDelete(CAL_SEQ_ID);
			if(res>0) {
				response.sendRedirect("controller.do?category=CALENDAR");
			}else {
				request.setAttribute("msg", "일정등록 실패");
				dispatch("error.jsp", request, response);
			}
		}else if(category.equals("FINDID")) {
			dispatch("khc_findId.jsp", request, response);
			
		}else if(category.equals("FIND_ID")) {
			String user_email = request.getParameter("user_email");
			
			request.setAttribute("user_id", service.find_id(user_email));
			
			dispatch("khc_findResult_id.jsp", request, response);

			System.out.println();
		}else if(category.equals("comment_insert")) {
			int board_seq_id = Integer.parseInt(request.getParameter("board_seq_id"));
			int user_seq = Integer.parseInt(request.getParameter("user_seq"));
			String comment_content = request.getParameter("comment_content");
			
			//댓글 입력이 성공하면,
			if(service.comment_insert(board_seq_id, user_seq, comment_content)) {
				dispatch("controller.do?category=board_detail&board_seq_id="+board_seq_id, request, response);
			}else {
				//실패하면,
				dispatch("controller.do?category=board_detail&board_seq_id="+board_seq_id, request, response);
			}
		//} else if(category.equals("comment_update")) {
			//System.out.println("comment_seq_id : " + Integer.parseInt(request.getParameter("comment_seq_id")));
		} else if(category.equals("comment_delete")) {
			int board_seq_id = Integer.parseInt(request.getParameter("board_seq_id"));
			if(service.comment_delete(Integer.parseInt(request.getParameter("comment_seq_id")))) {
				dispatch("controller.do?category=board_detail&board_seq_id="+board_seq_id, request, response);
			}
			System.out.println("comment_seq_id : " + Integer.parseInt(request.getParameter("comment_seq_id")));

		}else if(category.equals("FINDPW")) { //khc_login.jsp에서 비밀번호 찾기 눌렀을 때
			response.sendRedirect("khc_sendEmail.jsp");
		}else if(category.equals("sendEmail_PW")) { //khc_updatePw.jsp에서 비밀번호 변경눌렀을 때
			String user_email = request.getParameter("user_email");
			
			if(service.find_email(user_email)) { //이메일을 찾아서 이메일이 user테이블에 있으면,
				//이메일을 저장하고, sendEmail 호출 한다.
				if(service.user_sendEmail_pw(user_email)) { //이메일이 성공적으로 보내지면 이메일이 보내졌다는 페이지로 이동시킨다.
					response.sendRedirect("khc_sendEmailForm.jsp");
				}else {
					System.out.println("비밀번호 찾기 이메일 발송 실패");
					//response.sendRedirect("khc_sendEmailerror.jsp");
				}
			}else {
				System.out.println("해당 이메일을 사용하는 계정없음.");
				response.sendRedirect("khc_findEmailerror.jsp"); //email을 찾을 수 없다는 페이지 만드셈
			}
		}else if(category.equals("check_email_pw")) { 
			String user_email = request.getParameter("user_email");
			String code = request.getParameter("code");
			if(service.user_checkEmail_pw(user_email, code)) { //이메일인증이 완료되면
				//비밀번호 변경 페이지로 넘어간다.
				//비밀번호 변경 페이지에서 새로운 비밀번호 값을 입력할 수 있다
				request.setAttribute("user_email", user_email);
				dispatch("khc_updatePw_form.jsp", request, response);
			}else {
				System.out.println("이메일 인증에 실패하였습니다.");
			}
			
		}else if(category.equals("update_pw")) {
			String user_email = request.getParameter("user_email");
			String user_pw = request.getParameter("user_pw");
			
			if(service.user_updatePw(user_pw, user_email)) {
				response.sendRedirect("khc_updatePw_result.jsp"); //비밀번호 변경이 완료 되었습니다. 로그인을 해주세요(여기다가 로그인 페이지로 넘어가는 버튼만드셈)
			}else {
				System.out.println("비밀번호 변경 실패(오류) ");
				response.sendRedirect("_khc_updatePw_error.jsp"); //비밀번호 변경 실패 됨
			}
		}

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html; charset=UTF-8");
		doGet(request, response);
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
