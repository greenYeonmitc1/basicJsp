package kr.basic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.basic.model.MemberDAO;

@WebServlet("/memberLogin.do")
public class memberLoginController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		String dbPw = MemberDAO.getInstance().checkMemberId(id);
		                  // MIME Type 
		response.setContentType("text/html; charset=UTF-8"); // response 바디의 내용 어떤 데이터로 보낼꺼야 : 데이터 준비  
		String ctx=request.getContextPath();
		
		// response body에 내용을 넣을려면 printWriter 해서 writer.println()
		
		PrintWriter out = response.getWriter();
		if (dbPw == null || dbPw.equals(pw) == false) {
			out.println("<script>alert('로그인 실패'); location.href='member/memberLogin.jsp;</script>");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("log", MemberDAO.getInstance().getMemberNo(id));
			out.println("<script>alert('" + id + "님이 로그인하셨습니다'); location.href='"+ctx+"/memberList.do';</script>");
		}
		
		out.close();

	}

}
