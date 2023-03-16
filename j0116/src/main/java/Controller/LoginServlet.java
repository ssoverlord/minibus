package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Common.MemberVO;
import DB.MemberDAO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberDAO mdao = new MemberDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		String input_id = request.getParameter("id");
		String input_pw = request.getParameter("pw");
		int result_log = mdao.login(input_id, input_pw);

		if(result_log==1) {
			session.setAttribute("id", input_id);
			MemberVO m1 = mdao.selectOne(input_id);
			String memTel = m1.getTel();
			session.setAttribute("tel", memTel);
			writer.println(input_id+"님 로그인 성공"); 
			writer.close();
		}else {
			System.out.println("로그인 정보가 없습니다.");
			writer.println("회원가입을 하셔야 합니다."); 
			writer.close();
		}
	}
}
