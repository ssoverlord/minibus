package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Common.ReservationVO;
import DB.ReservationDAO;
import DB.SeatDAO;

@WebServlet("/UpdateReserServlet")
public class UpdateReserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ReservationDAO resdao = new ReservationDAO();
	SeatDAO seatdao = new SeatDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		SimpleDateFormat dtFormat = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
		PrintWriter out = response.getWriter();
		int result=0;
		String strDate = request.getParameter("datepic");
		String today1 = resdao.today();
		String re_course = request.getParameter("course");
		String re_s_time = request.getParameter("s_time");
		String seatnos = request.getParameter("seat");
		
		try {
			Date formatDate = dtFormat.parse(strDate);
			String strNewDTFormat = newDtFormat.format(formatDate);
			String driveid2 = resdao.selectBusid(re_course, re_s_time, strNewDTFormat);
			String busnos = resdao.selectBusno(re_course, re_s_time, strNewDTFormat);

			ReservationVO res1 = new ReservationVO();		
			res1.setId(request.getParameter("id"));
			res1.setDriveid(driveid2);
			res1.setR_date(strNewDTFormat);
			res1.setP_date(today1);
			res1.setMany_ad(request.getParameter("many_ad"));
			res1.setMany_ch(request.getParameter("many_ch"));
			res1.setPrice_v(request.getParameter("price_v"));
			res1.setBusno(busnos);
			res1.setCourse(re_course);
			res1.setStart_st(request.getParameter("start_st"));
			res1.setS_time(re_s_time);
			res1.setSeatno(seatnos);
			result = resdao.insertRes(res1);
			
			String[] seat_num = seatnos.split(",");
			for(int i=0; i<seat_num.length; i++) {
				seatdao.updateSaet(re_course, re_s_time, strNewDTFormat, seat_num[i]);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(result==1) {
			out.print("금액은 총 "+request.getParameter("price_v")+"원, 예약이 완료되었습니다.");	
		}else {
			out.print("예약이 실패되었습니다. 다시 시도해 주세요.");
		}
	}
}
