<%@page import="kr.borad.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

  String str = request.getParameter("index");
  int idx =0;
  if(str != null){
	  idx = Integer.parseInt(str);
  }
  int check = BoardDAO.getInstance().removeABoard(idx);
  
  if(str == null){
	  response.sendRedirect("_01_boardList.jsp");
  }else if(check != -1){
	  response.sendRedirect("_01_boardList.jsp");
  }else{
	  response.sendRedirect("_00_main.jsp");
  }



%>







