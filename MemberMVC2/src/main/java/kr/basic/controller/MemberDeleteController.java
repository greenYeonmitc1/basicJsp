package kr.basic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.model.MemberDAO;

@WebServlet("/memberDelete.do")
public class MemberDeleteController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			                             throws ServletException, IOException {
		
		  String ctx=request.getContextPath();
		int cnt=MemberDAO.getInstance().memberDelete(request.getParameter("id"));
		
		if(cnt>0) {
			  response.sendRedirect(ctx+"/memberList.do");
		}else {
			throw new ServletException("not delete");	
		}
	}
}
