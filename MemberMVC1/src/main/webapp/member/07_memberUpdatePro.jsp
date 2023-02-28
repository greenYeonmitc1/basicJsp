<%@page import="kr.basic.model.MemberDAO"%>
<%@page import="kr.basic.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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

int cnt=MemberDAO.getInstance().memberUpdate(vo);
if(cnt>0) {        
    	response.sendRedirect("01_memberlist.jsp");
 }else {
    	throw new ServletException("not update");	    	
 }	
%>