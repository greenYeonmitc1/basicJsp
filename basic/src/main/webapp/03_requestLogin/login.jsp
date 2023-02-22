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
 request.setCharacterEncoding("utf-8");
 String name = request.getParameter("name");
 String joinId = request.getParameter("joinId");
 String joinPw = request.getParameter("joinPw");

%>

<form method="post" action="loginPro.jsp">
 ID : <input type="text" name="id" /> <br><br>
 PW : <input type="text" name="pw" /> <br><br>
 <input type="hidden" name="name" value="<%=name %>" /> 
<input type="hidden" name="joinId" value="<%=joinId %>" /> 
<input type="hidden" name="joinPw" value="<%=joinPw %>"/>
<input type="submit" value="로그인" />

</form>

</body>
</html>