<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    if(session.getAttribute("admin")==null){
    	response.sendRedirect("02_main.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1> 관리자페이지</h1>

<a href="03_23_logoutPro.jsp"> 로그아웃 </a>
<a href="01_12_adminUserList.jsp"> 회원관리</a>
</body>
</html>