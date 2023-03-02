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

public class MemberInsertController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        // 파라메터수집(VO)
        request.setCharacterEncoding("utf-8");
        if(request.getParameter("id") == null) {
        	return "memberInsert"; // WEB-INF/member/memberInsert.jsp
        }
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");

		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPass(pass);
		vo.setName(name);
		vo.setAge(age);
		vo.setEmail(email);
		vo.setPhone(phone);
		 String ctx=request.getContextPath();
		int cnt=MemberDAO.getInstance().memberInsert(vo);
			if(cnt>0) {
		    	// 가입성공
		        //out.println("insert success");	
		    	return "redirect:"+ctx+"/memberList.do";
		}else {
		    	throw new ServletException("not insert");	    	
		}
	}
}
