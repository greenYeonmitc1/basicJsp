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
	MemberDAO dao = MemberDAO.getInstance();
	String pw = request.getParameter("pw");
	int idx = (int)session.getAttribute("idx");
	if(dao.checkPw(pw, idx)){
		session.removeAttribute("idx");
		dao.deleteMember(idx);
		
		%>
	  <script> msgGo("회원탈퇴 성공" , "02_main.jsp")</script>
<% 
	}else{
		%>
		<script> msgGo("비밀번호 불일치 회원탈퇴 실패" , "03_41_deleteForm.jsp")</script>
		
		<%
	}
%>


</body>
</html>