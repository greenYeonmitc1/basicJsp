<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#correct{
	color: blue;
}
#wrong{
color : red;
}
</style>
</head>
<body>
<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
    int num2 = Integer.parseInt(request.getParameter("num2"));
    int result = Integer.parseInt(request.getParameter("result"));
%>

<h1> 정답은 <%= num1* num2 %></h1>

<%if(result == num1*num2) {%>

<h1 id="correct"> 정답 입니다 </h1>

<%}else {%>

<h1 id="wrong"> 오답 입니다 </h1>

<%} %>
</body>
</html>