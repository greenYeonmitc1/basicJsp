package kr.basic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.model.MemberDAO;

public class MemberDeleteController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String ctx=request.getContextPath(); //MemberMVC3
		int cnt=MemberDAO.getInstance().memberDelete(request.getParameter("id"));
		
		if(cnt>0) {
			return "redirect:"+ctx+"/memberList.do";
	
		}else {
			throw new ServletException("not delete");	
		}
	}
}
