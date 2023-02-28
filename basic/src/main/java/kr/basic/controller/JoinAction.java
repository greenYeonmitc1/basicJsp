package kr.basic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/join.do")
public class JoinAction extends HttpServlet {

	// get, post, put... 모든 요청값 처리해주는 메서드 service 
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String[] arr = request.getParameterValues("hobby");
		String hobby ="";
		for(int i=0; i<arr.length; i++) {
			hobby += arr[i];
			if(i != arr.length - 1) {
				hobby += ",";
			}
		}
		
		String info[] = { id, pw, name, email, hobby};
		
		request.setAttribute("info", info);
		
		RequestDispatcher dis = request.getRequestDispatcher("/08_mvc2login/joinPro.jsp");
		dis.forward(request, response);
		
		
		
	}


}
