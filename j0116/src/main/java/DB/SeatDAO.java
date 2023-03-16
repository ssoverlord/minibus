package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import Common.SeatVO;

public class SeatDAO {
	
	Connection conn = DBCon.getCon();
	public void insertSeat(SeatVO seat) {
		String query_insertS = "INSERT INTO seat (seatnum,busid,seatyn) VALUES(?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_insertS);
			pstmt.setInt(1, seat.getSeatnum());
			pstmt.setString(2, seat.getBusid());
			pstmt.setString(3, seat.getSeatyn());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<String> selectSeat(String course, String s_time, String r_date) { // 등록된 좌석번호
		ArrayList<String> arrSeated = new ArrayList<String>();
		String seated=null;
		String query_selectS = "SELECT seatnum\r\n"
				+ "FROM seat s, drive d, minibus m\r\n"
				+ "WHERE s.busid = m.busid AND d.busid = m.busid \r\n"
				+ "AND d.course = ? AND d.s_time = ? AND d.r_date = ? AND s.seatyn = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_selectS);
			pstmt.setString(1, course);
			pstmt.setString(2, s_time);
			pstmt.setString(3, r_date);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				seated = rs.getString("seatnum");
				arrSeated.add(seated);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arrSeated;
	}
	
	public void updateSaet(String course, String s_time, String s_date, String seatnum) { // 빈좌석을 등록된 좌석으로 바꿈
		String query_updateS = "UPDATE seat s, drive d, minibus m\r\n"
				+ "SET s.seatyn = 1\r\n"
				+ "WHERE s.busid = m.busid AND d.busid = m.busid \r\n"
				+ "AND d.course = ? AND d.s_time = ? AND d.r_date = ? AND s.seatyn = 0 AND seatnum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_updateS);
			pstmt.setString(1, course);
			pstmt.setString(2, s_time);
			pstmt.setString(3, s_date);
			pstmt.setInt(4, Integer.parseInt(seatnum));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<JSONObject> show_bus(){
		ArrayList<JSONObject> dbusList = new ArrayList<>();
		String query_dbus = "SELECT d.driveid, d.r_date, d.course, m.busno, d.start_st, d.s_time \r\n"
				+ "FROM seat s, drive d, minibus m\r\n"
				+ "WHERE s.busid = m.busid AND d.busid = m.busid  \r\n"
				+ "AND d.r_date >= CURDATE() AND d.r_date <= ADDDATE(CURDATE(), 10)\r\n"
				+ "GROUP BY r_date, d.driveid";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_dbus);
			ResultSet rs = pstmt.executeQuery();
			JSONArray jbus = new JSONArray();
			while(rs.next()) {
				JSONObject json = new JSONObject();
				json.put("driveid", rs.getString("driveid"));
				json.put("r_date", rs.getString("r_date"));
				json.put("course", rs.getString("course"));
				json.put("busno", rs.getString("busno"));
				json.put("start_st", rs.getString("start_st"));
				json.put("s_time", rs.getString("s_time"));
				jbus.put(json);
			}
			for(int i = 0; i < jbus.length(); i++) {
				JSONObject temp = jbus.getJSONObject(i);
				dbusList.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbusList;
	}
}
