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
   
   List<String> idList = (List<String>)session.getAttribute("idList");
   List<String> pwList = (List<String>)session.getAttribute("pwList");
   
   int idx = -1;
   for(int i =0; i < idList.size(); i++){
	   if(id.equals(idList.get(i)) &&pw.equals(pwList.get(i))){
		   idx = i;
		   break;
	   }
   }
   
   if(idx == -1){ %>
   
	   <script> msgGo("로그인 실패" , "03_21_loginForm.jsp")</script>
	   
	   <% }else if(id.equals("admin")){  
		   session.setAttribute("admin", "admin");
		   
		   %>
	   
	   <script> msgGo("관리자님이 로그인하셨습니다" , "01_11_adminMain.jsp")</script>

<%}else{ 
	session.setAttribute("idx", idx);
  %>
	  <script> msgGo("<%=id %>님이 로그인하셨습니다" , "02_main.jsp")</script>

<%} %>
</body>
</html>