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

                   // 변수(key) 이름(value) 
 session.setAttribute("name" , name);
 session.setAttribute("joinId" , id);
 session.setAttribute("joinPw" , pw);
 
%>


<script>

alert("회원가입 완료!");
location.href="login.jsp";

</script>

</body>
</html>