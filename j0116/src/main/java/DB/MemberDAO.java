package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Common.MemberVO;

public class MemberDAO {
	
	Connection conn = DBCon.getCon();
	public void insertMem(MemberVO member) {
		String query_insertMem = "INSERT INTO member (id,pw,name,tel) VALUES (?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_insertMem);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getTel());
			pstmt.executeUpdate();
			} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
	
	public MemberVO selectOne(String id) {
		String query_selsctOne = "SELECT * FROM member WHERE id = ?";
		MemberVO member = new MemberVO();
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_selsctOne);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				member.setId(id);
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public ArrayList<MemberVO> selectAll(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String query_selectAll = "SELECT * FROM member ORDER BY id";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_selectAll);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO m1 = new MemberVO();
				m1.setId(rs.getString("id"));
				m1.setPw(rs.getString("pw"));
				m1.setName(rs.getString("name"));
				m1.setTel(rs.getString("tel"));
				list.add(m1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void update_Member(MemberVO member) {
		String query_update_M = "UPDATE member SET pw = ?, name = ?, tel = ? WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_update_M);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getTel());
			pstmt.setString(4, member.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String id) {
		String query_delete = "DELETE FROM member WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_delete);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int login(String id, String pw) {
		int result=0;
		String query_login = "SELECT COUNT(*) FROM member WHERE id = ? AND pw = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_login);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
			result= rs.getInt(1);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int idCheck(String id) {
		int result=0;
		String query_idCheck = "SELECT COUNT(id) FROM member WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query_idCheck);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
			result= rs.getInt(1);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
