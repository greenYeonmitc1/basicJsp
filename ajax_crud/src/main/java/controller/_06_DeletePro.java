package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
@SuppressWarnings("serial")
@WebServlet("/deletePro.do")
public class _06_DeletePro extends HttpServlet {



	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String passwd  = request.getParameter("passwd");
		MemberDAO manager = MemberDAO.getInstance();
		// 회원탈퇴처리 메소드 수행 후 탈퇴 상황 값 반환
		int check = manager.deleteMember(id, passwd);
		System.out.println("check = " + check);
		if(check == 1) {
			session.removeAttribute("id");
		}
		response.getWriter().print(check);

	}

}
