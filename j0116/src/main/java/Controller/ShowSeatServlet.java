package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Common.ReservationVO;
import DB.ReservationDAO;


@WebServlet("/ShowSeatServlet")
public class ShowSeatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ReservationDAO resdao = new ReservationDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		
		ArrayList<ReservationVO> resList = resdao.select_res(id);
		out.print(resList);
	}
}
