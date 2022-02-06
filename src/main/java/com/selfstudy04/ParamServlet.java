package com.selfstudy04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ParamServlet
 */
@WebServlet("/ParamServlet")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		
		PrintWriter out = resp.getWriter();
		out.print("<html><head></head><body>");
		out.print("����� �Է��� name �� "+ name + " �Դϴ�.<br>");
		out.println("����� �Է��� ���̴� " + age+ "�Դϴ�.<br>");
		
		// �ڹ� ��ũ��Ʈ�� ���� �������� �̵��ϴ� ��ũ�� �������
		out.println("<a href='javascript:history.go(-1)'>�ٽ�</a>");
		out.println("</body></html>");
		
		out.close();
	}
}
