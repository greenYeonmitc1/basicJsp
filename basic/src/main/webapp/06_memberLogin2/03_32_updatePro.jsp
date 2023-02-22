<%@page import="java.util.ArrayList"%>
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
ArrayList<String> pwList =(ArrayList<String>)session.getAttribute("pwList");
ArrayList<String> nameList = (ArrayList<String>)session.getAttribute("nameList");
ArrayList<String> genderList = (ArrayList<String>) session.getAttribute("genderList");

int idx = (int)session.getAttribute("idx");
String pw = request.getParameter("pw");

if(pwList.get(idx).equals(pw)){
	
	String name = request.getParameter("name");
	String gender =  request.getParameter("gender");
	
	nameList.set(idx, name);
	genderList.set(idx, gender);
	
	session.setAttribute("nameList", nameList );
	session.setAttribute("genderList",genderList );
	
	%>
	  <script> msgGo(" 회원 수정 성공" , "02_main.jsp")</script>
	<%
}else{
	%>
	  <script> msgGo(" 비밀번호 불일치 수정 실패" , "03_31_updateForm.jsp")</script>
	<%		
}
%>
</body>
</html>