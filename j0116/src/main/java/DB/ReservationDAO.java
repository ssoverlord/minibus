package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Common.ReservationVO;

public class ReservationDAO {
	
	Connection conn = DBCon.getCon();
	public int insertRes(ReservationVO res) {
		int result = 0;
		String query_insertR = "INSERT INTO reservation (id,driveid,r_date,p_date,many_ad,many_ch,price_v,busno,course,start_st,s_time,seatno) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_insertR);
			pstmt.setString(1, res.getId());
			pstmt.setString(2, res.getDriveid());
			pstmt.setString(3, res.getR_date());
			pstmt.setString(4, res.getP_date());
			pstmt.setString(5, res.getMany_ad());
			pstmt.setString(6, res.getMany_ch());
			pstmt.setString(7, res.getPrice_v());
			pstmt.setString(8, res.getBusno());
			pstmt.setString(9, res.getCourse());
			pstmt.setString(10, res.getStart_st());
			pstmt.setString(11, res.getS_time());
			pstmt.setString(12, res.getSeatno());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<ReservationVO> select_res(String id){
		ArrayList<ReservationVO> resList = new ArrayList<ReservationVO>();
		String query_res = "SELECT * FROM reservation WHERE id = ? ORDER BY p_date DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_res);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ReservationVO res1 = new ReservationVO();
				res1.setResno(Integer.parseInt(rs.getString("resno")));
				res1.setId(rs.getString("id"));
				res1.setDriveid(rs.getString("driveid"));
				res1.setR_date(rs.getString("r_date"));
				res1.setP_date(rs.getString("p_date"));
				res1.setMany_ad(rs.getString("many_ad"));
				res1.setMany_ch(rs.getString("many_ch"));
				res1.setPrice_v(rs.getString("price_v"));
				res1.setBusno(rs.getString("busno"));
				res1.setCourse(rs.getString("course"));
				res1.setStart_st(rs.getString("start_st"));
				res1.setS_time(rs.getString("s_time"));
				res1.setSeatno(rs.getString("seatno"));
				resList.add(res1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resList;
	}
	
	public String selectBusid(String course, String s_time, String r_date) {
		String busids = null;
		String query_busid = "SELECT MAX(d.driveid) driveid\r\n"
				+ "FROM seat s, drive d, minibus m\r\n"
				+ "WHERE s.busid = m.busid AND d.busid = m.busid \r\n"
				+ "AND d.course = ? AND d.s_time = ? AND d.r_date = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_busid);
			pstmt.setString(1, course);
			pstmt.setString(2, s_time);
			pstmt.setString(3, r_date);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			busids = rs.getString("driveid");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return busids;
	}
	
	public String selectBusno(String course, String s_time, String r_date) {
		String busno = null;
		String query_busno = "SELECT max(m.busno) busno\r\n"
				+ "FROM seat s, drive d, minibus m\r\n"
				+ "WHERE s.busid = m.busid AND d.busid = m.busid \r\n"
				+ "AND d.course = ? AND d.s_time = ? AND d.r_date = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_busno);
			pstmt.setString(1, course);
			pstmt.setString(2, s_time);
			pstmt.setString(3, r_date);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			busno = rs.getString("busno");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return busno;
	}
	
	public boolean check_drive(String course, String s_time, String r_date) {
		String result = null;
		String query_cbusCk = "SELECT COUNT(d.driveid) cnt\r\n"
				+ "FROM seat s, drive d, minibus m\r\n"
				+ "WHERE s.busid = m.busid AND d.busid = m.busid \r\n"
				+ "AND d.course = ? AND d.s_time = ? AND d.r_date = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_cbusCk);
			pstmt.setString(1, course);
			pstmt.setString(2, s_time);
			pstmt.setString(3, r_date);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = rs.getString("cnt");
			if(result.equals("0")) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	public String today() {
		String today = "";
		String query_today = "SELECT NOW()";
		Statement stmt;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query_today);
			while(rs.next()){
				   today = rs.getString(1);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return today;
	}
}
