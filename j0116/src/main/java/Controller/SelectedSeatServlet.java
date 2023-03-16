package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ReservationDAO;
import DB.SeatDAO;

@WebServlet("/SelectedSeatServlet")
public class SelectedSeatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ReservationDAO resdao = new ReservationDAO();
	SeatDAO seatdao = new SeatDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		SimpleDateFormat dtFormat = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
		PrintWriter out = response.getWriter();
		String strDate = request.getParameter("datepic");
		String re_course = request.getParameter("course");
		String re_s_time = request.getParameter("s_time");
		ArrayList<String> seatList = new ArrayList<String>();
		boolean check;
		try {
			Date formatDate = dtFormat.parse(strDate);
			String strNewDTFormat = newDtFormat.format(formatDate);
			seatList = seatdao.selectSeat(re_course, re_s_time, strNewDTFormat);
			check = resdao.check_drive(re_course, re_s_time, strNewDTFormat);
			if(check) {
				out.print(seatList);	
			}else {
				out.print("false");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
