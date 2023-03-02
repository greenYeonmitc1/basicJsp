package kr.basic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.basic.model.MemberDAO;
import kr.basic.model.MemberVO;

@WebServlet("/memberContent.do")
public class MemberContentController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			                                     throws ServletException, IOException {


		String ctx=request.getContextPath();
		  int num =-1;
		  if(request.getParameter("num")==null){
			  response.sendRedirect(ctx+"/memberList.do");
		  }else{
			  num = Integer.parseInt(request.getParameter("num"));
			 // HttpSession session = request.getSession();
			 // num = Integer.parseInt((String)session.getAttribute("log"));
		  }
		  MemberVO vo=MemberDAO.getInstance().memberContent(num);
		// 객체바인딩
		  
		request.setAttribute("vo", vo);
		
		RequestDispatcher rd=request.getRequestDispatcher("member/memberContent.jsp");
		rd.forward(request, response); //-----------------------------------▲
	}
}
