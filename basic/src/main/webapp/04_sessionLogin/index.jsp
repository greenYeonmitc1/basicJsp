<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  회원가입 -> 로그인 -> 홈화면(~님 안녕하세요) -->
  <h1> 홈화면 </h1>
  
<%
   // request 한번 페이지에 값 전달 => 사라진다 : request 값 저장 String 으로만 저장 
   // session 브라우저가 종료될까지 값 저장 => Object 로 저장 : 배열, 리스트, 객체 ... 
	String name = (String)session.getAttribute("name");
   if(name== null){
%>
 <a href="join.jsp"> 회원가입</a>
   <a href="login.jsp"> 로그인</a>
<%}else{ %>
     <h1><%=name %> 님 어서오세요 </h1>
   <a href="logout.jsp"> 로그아웃 </a>
<%} %>



</body>
</html>