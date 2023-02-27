<%@page import="kr.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

  String str = request.getParameter("no");
  int no =0;
  if(str != null){
	  no = Integer.parseInt(str);
  }
  int check = BoardDAO.getInstance().removeABoard(no);
  
  if(str == null){
	  response.sendRedirect("_01_boardList.jsp");
  }else if(check > 0){
	  response.sendRedirect("_01_boardList.jsp");
  }else{
	  throw new ServletException("fail to delete a board");
  }



%>







