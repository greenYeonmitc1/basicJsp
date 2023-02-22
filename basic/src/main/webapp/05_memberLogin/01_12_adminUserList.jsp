<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    if(session.getAttribute("admin")== null){
    	response.sendRedirect("02_main.jsp");
    }
   
    
    List<String> ids=  (List<String>)session.getAttribute("idList" ); 
	List<String> pws=  (List<String>)session.getAttribute("pwList" );
	List<String> names= (List<String>)session.getAttribute("nameList" );
	List<String>genders=(List<String>)session.getAttribute("genderList" );
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
 <h1> 관리자 페이지(회원정보 확인하기)</h1>
  <div> <a href="02_main.jsp"> 메인 화면 가기 </a></div>
  <br>
 <table>
 	<tr>
 		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>성별</td>
		<td>삭제</td>
 	</tr>
 	
 	<%for(int i =0; i < ids.size();i++){ %>
<tr>
 		<td><%= ids.get(i) %></td>
		<td><%= pws.get(i) %></td>
		<td><%= names.get(i) %></td> 
		<td><%= genders.get(i) %></td>
		<td><button onclick="location.href='01_13_adminUserDelete.jsp?idx=<%=i%>'"> 삭제 </button></td>
</tr>
 	<% } %>
 </table>
 


</body>
</html>