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
  //  int (null) --> 500에러 
	int me = Integer.parseInt(request.getParameter("me"));
	int com = Integer.parseInt(request.getParameter("com"));

	String msg ="";
	if(me > com){
		msg="DOWN! 내가 크다";
	}else if(com > me){
		msg="UP! 내가 작다";
	}else{
		msg="BINGO! 정답입니다! " + com +" ";
	}
%>

 <h1><%=msg %></h1>
<% 
	if(com == me){
		%>
		<a href="index.jsp"> 처음 으로</a>
		<%
	}else{
		%>
			<a href="updownGamePlay.jsp?com=<%=com%>"> 뒤로가기 </a>
		<%
	}
%>




</body>
</html>