<%@page import="kr.basic.model.MemberDAO"%>
<%@page import="kr.basic.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
        // 파라메터수집(VO)
        request.setCharacterEncoding("utf-8");
		// 1. 파라메터수집(VO)
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age")); // "40"->40
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		//파라메터수집(VO)
		//MemberVO vo=new MemberVO(id, pass, name, age, email, phone);
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPass(pass);
		vo.setName(name);
		vo.setAge(age);
		vo.setEmail(email);
		vo.setPhone(phone);
		
		// db값 추가 명령 
		int cnt=MemberDAO.getInstance().memberInsert(vo);
		
		
		if(cnt>0) {
		    	// 가입성공		  
		    	response.sendRedirect("01_memberlist.jsp");
		}else {
		    	// 가입실패-> 예외객체를 만들어서  WAS에게 던지자.
		    	throw new ServletException("not insert");	    	
		}
%>    
