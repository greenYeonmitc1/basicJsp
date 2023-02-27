<%@page import="java.util.ArrayList"%>
<%@page import="kr.basic.model.MemberDAO"%>
<%@page import="kr.basic.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    if(session.getAttribute("admin")== null){
    	response.sendRedirect("02_main.jsp");
    }
  
    ArrayList<MemberVO> list = MemberDAO.getInstance().getAllMemberList();
    
    %>


<%@ include file="header.jsp" %>

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
 	
 	<%
 	 int idx =0; 
 	 for(MemberVO member : list){
 	  
 		 %>
<tr>
 		<td><%= member.getId() %></td>
		<td><%= member.getPw() %></td>
		<td><%= member.getName() %></td> 
		<td><%= member.getGender() %></td>
		<td><button onclick="location.href='01_13_adminUserDelete.jsp?idx=<%=idx%>'"> 삭제 </button></td>
</tr>
 	<% idx++; } %>
 </table>
 


</body>
</html>