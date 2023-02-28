<%@page import="kr.basic.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.basic.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "header.jsp" %>
<%
  ArrayList<MemberVO> list= MemberDAO.getInstance().memberList();	
%>    

<body>
<h1 class="py-3"> 회원 목록</h1>

<table class=" py-10 table table-bordered">
  <tr>
    <td>번호</td>
    <td>아이디</td>
    <td>비밀번호</td>
    <td>이름</td>
    <td>나이</td>
    <td>이메일</td>
    <td>전화번호</td>
    <td>삭제</td>
  </tr>
  <% for(MemberVO vo : list){ %>
    	  <tr>
    	    <td><%=vo.getNum()%></td>
    	    <td><a href="05_memberContent.jsp?num=<%=vo.getNum()%>"><%=vo.getId()%></a></td>
    	    <td><%=vo.getPass()%></td>
    	    <td><%=vo.getName()%></td>
    	    <td><%=vo.getAge()%></td>
    	    <td><%=vo.getEmail()%></td>
    	    <td><%=vo.getPhone()%></td>
    	    <td><input type="button" value="삭제" class="btn btn-outline-dark" onclick="location.href='06_memberDeletePro.jsp?id=<%=vo.getId()%>'"></td>
    	  </tr>    	 
  <% } %>

</table>


</body>
</html>