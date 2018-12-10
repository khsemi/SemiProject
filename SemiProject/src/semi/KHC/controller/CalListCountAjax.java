package semi.KHC.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import semi.KHC.calendarDao.CalDao;
import semi.KHC.userDto.UserDto;

/**
 * Servlet implementation class CalListCountAjax
 */
@WebServlet("/CalListCountAjax.do")
public class CalListCountAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		UserDto userdto = (UserDto) session.getAttribute("userDto");
		int user_seq = userdto.getUser_seq();
		String yyyyMMdd=request.getParameter("yyyyMMdd");
		System.out.println("전달된 param : " + user_seq +"," + yyyyMMdd);

		CalDao dao = new CalDao();
		
		int count = dao.getCalViewCount(user_seq, yyyyMMdd);
		System.out.println("일정객수" + count);
		Map<String,Integer>map = new HashMap<String,Integer>();
		map.put("calCount",count);
		JSONObject obj = JSONObject.fromObject(map);
		
		PrintWriter out = response.getWriter();
		obj.write(out);
		
	}

	

}
