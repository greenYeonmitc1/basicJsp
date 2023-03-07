package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
@SuppressWarnings("serial")
@WebServlet("/loginPro.do")
public class _03_LoginPro extends HttpServlet {
  
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자가 입력한 아이디와 비밀번호
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		MemberDAO manager = MemberDAO.getInstance();
		int check = manager.userCheck(id, passwd);// 사용자인증처리 메소드

		System.out.println("_03_LoginPro() : check : " + check);
		
		if(check==1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}
		response.getWriter().print(check);
		
	}
	
}
