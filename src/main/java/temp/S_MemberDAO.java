package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.smhrd.model.S_MemberDTO;

public class S_MemberDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
// �ڵ� �߿��� ���� �ݺ��ؼ� ����ϴ� ���͵��� �ʵ�� �ø� �� �� ����. ���� �� sql���� ���� ����� ���,
	// sql ������ �ʵ�� �ä��� �� �� �ִ�.
	// �����ϴ� ���, �����ϴ� ��� �� ������ ���� �� �վ�� ��.

	// DB���� ���
	public void connect() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";
			// �ǽ� �߿��� �� �ٲ������, ������Ʈ �����ϸ� localhost:1521 �� id ,pw�� �ٲ� ��

			conn = DriverManager.getConnection(url, user, password); // add catch : sql ���� ���� ĳġ�� �߰�
			// Ŀ�ؼ� ���� null ���η� ����Ȯ�� ����

		} catch (ClassNotFoundException e) {
			// ����Ŭ ����̹� Ŭ������ �ش���ġ�� ���� ��쿡 �߻��ϴ� ����
			// 1. ojdbc6.jar ������ ���������� �ʾƼ�
			// -> ojdbc6.jar �����ؼ� web-inf> lib �� �������ָ� ��.
			// 2. ���� ������ �߸�
			// 3. ��Ÿ...
			// jdbc �� ���� �߻��� �ذ� ������ ����صθ� ����.�����Ե� �ٸ� ������Ե� .

			e.printStackTrace();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DB���� ����
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

	// ȸ������ ���
	public int memberJoin(S_MemberDTO member) {
		// DTO Ŭ������ �ϳ��� ��ü�� ������ ����. �ϳ��� �޾Ƶ� ������ �̷��Ե� ����...

		connect();

		String sql = "insert into s_member values(?,?,?)";
		int cnt = 0;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getM_id());
			psmt.setString(2, member.getM_pw());
			psmt.setString(3, member.getM_nick());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			// 1. sql �� ��Ÿ,
			// 2. psmt ��ü�� �߸��� �ε����� �ۼ����� ��,
			// 3. ���̺��� ���� ���
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

	public boolean idCheck(String id) {
		boolean check = false;
		connect();

		String sql = "select id from member where id = ? ";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			
			if (rs.next()) {
				check = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return check;
	}
	
	public boolean nickCheck(String nick) {
		boolean check = false;
		connect();

		String sql = "select id from member where nick = ? ";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);

			rs = psmt.executeQuery();
			
			if (rs.next()) {
				check = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return check;
	}

}
