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
 String id = request.getParameter("id");
 String pw = request.getParameter("pw");

 System.out.println("name=" + name +" \t" +id +"\t" + pw);
%>


<script>

alert("회원가입 완료!");
location.href="login.jsp?name=<%=name%>&joinId=<%=id%>&joinPw=<%=pw%>";

</script>

</body>
</html>