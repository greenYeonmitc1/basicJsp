<%@page import="kr.basic.model.MemberDAO"%>
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
function msgGo(msg,url){
	alert(msg);
	location.href=url;
}
</script>

	<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
  
   String dbPw = MemberDAO.getInstance().checkMemberId(id);
   System.out.println("pw=" + pw);
   System.out.println("dbPw=" + dbPw);
   
   if(dbPw == null || dbPw.equals(pw)==false){ %>
	   <script> msgGo("로그인 실패" , "02_memberLogin.jsp")</script>
   <% }else{   
	   
      session.setAttribute("log", MemberDAO.getInstance().getMemberNo(id) );
   %>
	<script> msgGo("<%=id %>님이 로그인하셨습니다" , "01_memberlist.jsp")</script>
	<%} %>
</body>
</html>