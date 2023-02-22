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
	List<String> idList = new ArrayList<>((List<String>) session.getAttribute("idList"));
	List<String> pwList = new ArrayList<>((List<String>) session.getAttribute("pwList"));
	List<String> nameList = new ArrayList<>((List<String>) session.getAttribute("nameList"));
	List<String> genderList = new ArrayList<>((List<String>) session.getAttribute("genderList"));

	String pw = request.getParameter("pw");
	int idx = (int)session.getAttribute("idx");
	if(pwList.get(idx).equals(pw)){
		session.removeAttribute("idx");
  	  idList.remove(idx);
  	  pwList.remove(idx);
  	  nameList.remove(idx);
  	  genderList.remove(idx);
  	  
  	  session.setAttribute("idList",idList );
  	  session.setAttribute("pwList",pwList );
  	  session.setAttribute("nameList",nameList );
  	  session.setAttribute("genderList",genderList );
		
		
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