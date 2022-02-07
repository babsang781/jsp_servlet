package temp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dislikeService")
public class dislikeService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int likenum = 1;

		int bn = Integer.parseInt(request.getParameter("board_num"));

//		HttpSession session = request.getSession();
//		MemberDTO member = (MemberDTO) session.getAttribute("member");

		boardDAO dao = new boardDAO();
//		int cnt = dao.update_like(bn, member.getNick());
		int cnt = dao.update_dislike(bn, "2");

		if (cnt > 0) {
			likenum = dao.select_like(bn);
			
			PrintWriter out = response.getWriter();
			out.print(likenum);
		}

	}

}
