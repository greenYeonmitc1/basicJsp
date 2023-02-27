<%@page import="kr.board.model.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

  request.setCharacterEncoding("utf-8");

   int no =Integer.parseInt(request.getParameter("no"));
   String subject = request.getParameter("subject");
   String contents = request.getParameter("contents");
   
   int cnt = BoardDAO.getInstance().updateBoard(no, subject, contents);
   if(cnt >0){
   		response.sendRedirect("_01_boardList.jsp");
   }else{
	   // 톰켓에러 띄운다 
	   throw new ServletException("fail to update mysql data");
   }
   
%>



