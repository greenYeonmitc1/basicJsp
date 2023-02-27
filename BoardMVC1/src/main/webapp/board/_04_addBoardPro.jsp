
<%@page import="kr.board.model.BoardDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
   request.setCharacterEncoding("utf-8"); // 한글 깨짐 방지 
   
   String writer = request.getParameter("writer");
   String subject = request.getParameter("subject");
   String contents = request.getParameter("contents");
   
   BoardDAO.getInstance().insertBoard(writer, subject, contents);
   
   response.sendRedirect("_01_boardList.jsp");


%>







