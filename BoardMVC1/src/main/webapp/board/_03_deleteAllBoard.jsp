<%@page import="kr.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   int cnt = BoardDAO.getInstance().removeAllList();
if(cnt >0){
    response.sendRedirect("_01_boardList.jsp");
}else{
	throw new ServletException("fail to delete all board");
}

%>   