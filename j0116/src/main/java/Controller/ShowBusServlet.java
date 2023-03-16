package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import DB.SeatDAO;

@WebServlet("/ShowBusServlet")
public class ShowBusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SeatDAO seatdao = new SeatDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		ArrayList<JSONObject> busList = new ArrayList<JSONObject>();
		busList = seatdao.show_bus();
	
		response.setContentType("application/json;charset=utf-8");
		out.print(busList.toString());
	}
}
