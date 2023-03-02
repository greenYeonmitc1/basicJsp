package kr.basic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.model.MemberDAO;
import kr.basic.model.MemberVO;


public class MemberContentController implements Controller{


	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    String ctx=request.getContextPath();
		  int num =-1;
		  if(request.getParameter("num")==null){
			  return "redirect:"+ctx+"/memberLogin.do";
		  }else{
			  num = Integer.parseInt(request.getParameter("num"));
		  }
		  MemberVO vo=MemberDAO.getInstance().memberContent(num);
		// 객체바인딩
		request.setAttribute("vo", vo);
		return "memberContent"; //뷰의 이름만 리턴
		//return "/WEB-INF/member/memberContent.jsp";
	}


}
