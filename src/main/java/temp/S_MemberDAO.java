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
// 코드 중에서 자주 반복해서 사용하느 ㄴ것들은 필드로 올릴 수 도 있음. 예를 들어서 sql문을 많이 사용한 경우,
	// sql 변수를 필드로 올ㄹ릴 수 도 있다.
	// 연결하는 기능, 종료하는 기능 두 가지는 무조 건 잇어야 함.

	// DB연결 기능
	public void connect() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";
			// 실습 중에는 안 바뀌겠지만, 프로젝트 진행하면 localhost:1521 과 id ,pw가 바뀔 것

			conn = DriverManager.getConnection(url, user, password); // add catch : sql 관련 오류 캐치문 추가
			// 커넥션 변수 null 여부로 연결확인 가능

		} catch (ClassNotFoundException e) {
			// 오라클 드라이버 클래스가 해당위치에 없는 경우에 발생하는 에러
			// 1. ojdbc6.jar 파일을 복사해주지 않아서
			// -> ojdbc6.jar 복사해서 web-inf> lib 에 저장해주면 됨.
			// 2. 파일 저장경로 잘못
			// 3. 오타...
			// jdbc 등 에러 발생과 해결 경험을 기록해두면 좋음.나에게도 다른 사람에게도 .

			e.printStackTrace();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DB연결 종료
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

	// 회원가입 기능
	public int memberJoin(S_MemberDTO member) {
		// DTO 클래스를 하나의 객체로 받으면 편함. 하나씩 받아도 되지만 이렇게도 가능...

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
			// 1. sql 문 오타,
			// 2. psmt 객체로 잘못된 인덱스를 작성했을 때,
			// 3. 테이블이 없는 경우
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
