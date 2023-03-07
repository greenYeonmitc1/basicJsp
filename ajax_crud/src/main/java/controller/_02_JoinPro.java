package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;
@SuppressWarnings("serial")
@WebServlet("/joinPro.do")
public class _02_JoinPro extends HttpServlet {
       
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO member = new MemberVO();
		String id = request.getParameter("id");
		String passwd  = request.getParameter("passwd");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		member.setId(id);
		member.setPasswd(passwd);
		member.setName(name);
		member.setAddress(address);
		member.setTel(tel);
		MemberDAO manager = MemberDAO.getInstance();
		int check = manager.insertMember(member);
		response.getWriter().print(check);
		
	  
		
	}
	
}
