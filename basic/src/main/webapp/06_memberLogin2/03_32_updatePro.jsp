<%@page import="kr.basic.model.MemberDAO"%>
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
MemberDAO dao = MemberDAO.getInstance();
int idx = (int)session.getAttribute("idx");
String pw = request.getParameter("pw");

if(dao.checkPw(pw, idx)){
	
	String name = request.getParameter("name");
	String gender =  request.getParameter("gender");
	
	dao.updateMember(idx, name,gender);
	
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