package semi.KHC.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import semi.KHC.sevice.Service;
import semi.KHC.sevice.Service_impl;

@WebServlet("/ajax.do")
public class Ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("text/html; charset=UTF-8");
		
		Service service = new Service_impl();
		
		//category 값을 받아온다.
		String category = request.getParameter("category");
				
		System.out.println("카테고리 : [ " + category + " ]");
		
		if(category.equals("favorite_up")) {
			//추천 버튼이 눌리면 서비스에서 select를 하여 해당 테이블에
			//해당 유저가 좋아요를 누른적이있는지 체크 후 있다면,
			//그 반환값가지고 ajax에서 처리
			//없다면, favorite 테이블에 insert해주고 ajax 처리
			int board_seq_id = Integer.parseInt(request.getParameter("board_seq_id"));
			int user_seq = Integer.parseInt(request.getParameter("user_seq"));
			System.out.println("favorite_up 성공 여부 : " + service.favorite_up(board_seq_id, user_seq));
			
		}else if(category.equals("favorite_down")) {
			int board_seq_id = Integer.parseInt(request.getParameter("board_seq_id"));
			int user_seq = Integer.parseInt(request.getParameter("user_seq"));
			System.out.println("favorite_down 성공 여부 : " + service.favorite_down(board_seq_id, user_seq));
			
		}else if(category.equals("favorite_delete")) {
			int board_seq_id = Integer.parseInt(request.getParameter("board_seq_id"));
			int user_seq = Integer.parseInt(request.getParameter("user_seq"));
			System.out.println("favorite_delete 성공 여부 : " + service.favorite_delete(board_seq_id, user_seq));
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
