package semi.KHC.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.KHC.sevice.Service;
import semi.KHC.sevice.Service_impl;
import semi.KHC.userDto.UserDto;

@WebServlet("/controller.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html; charset=UTF-8");
		
		Service service = new Service_impl();
		
		//command 값을 받아온다.
		String category = request.getParameter("category");
		
		System.out.println("카테고리 : [ " + category + " ]");
		
		//command 값을 비교후에 각각의 if문을 실행하게 한다.
		if(category.equals("QA") || category.equals("TIPS") || category.equals("STUDY") || category.equals("NOTICE") || category.equals("COMMUNITY")
				 || category.equals("TRADE") || category.equals("JOBS") || category.equals("FOODINFO")) {
			//View 에서 받아오는 값 
			int page = Integer.parseInt(request.getParameter("page"));
			
			//service를 통해 값을 전달받아 boardMap에 저장한다.
			Map<String, Object> boardMap = service.board(category, page);
			
			//다시 View에 넘겨주기위해 필요한 값들을 request에 setAttribute 해준다.
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
			
			//service를 통해 값을 전달받아 boardMap에 저장한다.
			Map<String, Object> boardMap = service.board_search(category, page, keyword);
			
			//다시 View에 넘겨주기위해 필요한 값들을 request에 setAttribute 해준다.
			request.setAttribute("page", page);
			request.setAttribute("category", category);
			request.setAttribute("totalCount", boardMap.get("totalCount"));
			request.setAttribute("boardList", boardMap.get("boardList"));
			// request.setAttribute("searchType", searchType);
			request.setAttribute("keyword", keyword);

			// request,responce에 들어있는 값을 가지고 dispatch를 통해 "board.jsp" 로 보내준다.
			dispatch("board.jsp", request, response);
		} else if (category.equals("LOGIN")) {
			dispatch("khc_login.jsp", request, response);
		} else if (category.equals("LOGIN_CHECK")) {
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			UserDto dto = service.login(user_id, user_pw);

			request.setAttribute("userdto", dto);
			dispatch("KHC.jsp", request, response);

		} else if (category.equals("MAIN")) {
			dispatch("KHC.jsp", request, response);
		} else if (category.equals("MYPAGE")) {
			dispatch("khc_mypage.jsp", request, response);
		} else if (category.equals("JOIN")) {
			dispatch("khc_join.jsp", request, response);
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
