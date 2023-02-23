
<%@page import="kr.borad.model.BoardDAO"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    BoardDAO.getInstance().createSet10Dummies();
    response.sendRedirect("_01_boardList.jsp");
%>


























