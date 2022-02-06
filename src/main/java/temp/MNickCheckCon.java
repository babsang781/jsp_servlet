package temp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kittypuppy.model.MemberDAO;
import com.kittypuppy.service.iCommand;

public class MNickCheckCon implements iCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nick = request.getParameter("nick");

		MemberDAO dao = new MemberDAO();
		boolean check = dao.idCheck(nick);

		// ajax �� ��� ���� �������� ���: out.print()
		PrintWriter out = response.getWriter();
		out.print(check);
	}
}
