<%@page import="kr.borad.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   BoardDAO.getInstance().removeAllList();

    response.sendRedirect("_00_main.jsp");

%>   