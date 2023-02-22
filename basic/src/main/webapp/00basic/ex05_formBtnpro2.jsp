<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

  int num = Integer.parseInt(request.getParameter("rnum"));
 int result = Integer.parseInt(request.getParameter("result"));

%>

<h1> formBtnPro2 페이지 </h1>
<h2> num = <%= num %></h2>
<h2> result = <%= result %></h2>


</body>
</html>