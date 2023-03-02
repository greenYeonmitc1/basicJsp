package kr.basic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/memberLogout.do")
public class memberLogoutController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// java 에서는 session 객체를 만들어서 사용 
		
		HttpSession session = request.getSession();
		session.removeAttribute("log");
		
		String ctx=request.getContextPath();
		  response.sendRedirect(ctx+"/memberList.do");
	}

	}
