package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FeedCommentDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	String sql;

	public void connect() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";

			conn = DriverManager.getConnection(url, user, password); 

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
//	public int update_like(int bn, String id) {
//		int cnt = 0;
//		connect();
//		sql = "insert into feed_like values ( ?, ? )";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, bn);
//			psmt.setString(2, id);
//
//			cnt = psmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//
//		return cnt;
//	}
//	
//	public int deleteComment(int fcno, String id) {
//		int cnt = 0;
//		connect();
//		sql = "delete from feed_like where feedno = ? and id = ?";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, bn);
//			psmt.setString(2, id);
//
//			cnt = psmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//
//		return cnt;
//	}
//	
//	public int select_like(int bn) {
//		int cnt = 0;
//		ArrayList<String> arl = new ArrayList<String>();
//		connect();
//
//		sql = "select * from feed_like where feedno = ? ";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, bn);
//
//			rs = psmt.executeQuery();
//			
//			while (rs.next()) {
//				arl.add(rs.getString(1));
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		cnt = arl.size();
//		return cnt;
//	}
//	

	
}
