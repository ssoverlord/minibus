package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Common.MemberVO;
import DB.MemberDAO;


@WebServlet("/regMember.do")
public class RegMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberDAO mdao = new MemberDAO();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();

		MemberVO m1 = new MemberVO();
		m1.setId(request.getParameter("id"));
		m1.setPw(request.getParameter("pw"));
		m1.setName(request.getParameter("name"));
		m1.setTel(request.getParameter("tel"));
		mdao.insertMem(m1);

		writer.println("회원가입 성공!! 로그인을 해주세요."); 
		writer.close();
	}
}
