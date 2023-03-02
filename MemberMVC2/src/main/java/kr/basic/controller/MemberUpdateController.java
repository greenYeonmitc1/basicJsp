package kr.basic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.model.MemberDAO;
import kr.basic.model.MemberVO;

@WebServlet("/memberUpdate.do")
public class MemberUpdateController extends HttpServlet {	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			                                   throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//파라메터 수집(VO)
		int num=Integer.parseInt(request.getParameter("num"));
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");

		MemberVO vo=new MemberVO();
		vo.setNum(num);
		vo.setAge(age);
		vo.setEmail(email);
		vo.setPhone(phone);
		String ctx=request.getContextPath();
		int cnt=MemberDAO.getInstance().memberUpdate(vo);
		if(cnt>0) {	        
			 response.sendRedirect(ctx+"/memberList.do");
		 }else {
		    	throw new ServletException("not update");	    	
		 }	
	}
}
