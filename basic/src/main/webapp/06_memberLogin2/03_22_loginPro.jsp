<%@page import="kr.basic.model.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>

 function msgGo(msg, url){
	 alert(msg);
	 location.href=url;
 }

</script>

	<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
  
   int index = MemberDAO.getInstance().checkId(id);
   
   
   if(MemberDAO.getInstance().checkPw(pw, index)==false){ %>

	<script> msgGo("로그인 실패" , "03_21_loginForm.jsp")</script>

	<% }else if(id.equals("admin")){  
		   session.setAttribute("admin", "admin");  
		   %>

	<script> msgGo("관리자님이 로그인하셨습니다" , "01_11_adminMain.jsp")</script>

	<%}else{ 
		session.setAttribute("idx", index);
  %>
	<script> msgGo("<%=id %>님이 로그인하셨습니다" , "02_main.jsp")</script>

	<%} %>
</body>
</html>