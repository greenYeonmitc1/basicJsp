<%@page import="kr.borad.model.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

  request.setCharacterEncoding("utf-8");

   int idx =Integer.parseInt(request.getParameter("index"));
   String subject = request.getParameter("subject");
   String contents = request.getParameter("contents");
   
   BoardDAO.getInstance().updateBoard(idx, subject, contents);
   
   response.sendRedirect("_01_boardList.jsp");
   
%>



