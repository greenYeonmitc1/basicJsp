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
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<String> idList = (ArrayList<String>) session.getAttribute("idList");
	ArrayList<String> pwList = (ArrayList<String>) session.getAttribute("pwList");
	ArrayList<String> nameList = (ArrayList<String>) session.getAttribute("nameList");
	ArrayList<String> genderList = (ArrayList<String>) session.getAttribute("genderList");
     boolean check = true;
	String id = request.getParameter("id");
     
     for(String dbid : idList){
    	 if(dbid.equals(id)){
    		 check = false;
    		 break;
    	 }
     }
     
    if(check){
		String pw =  request.getParameter("pw");
		String name =  request.getParameter("name");
		String gender =  request.getParameter("gender");
		idList.add(id);
		pwList.add(pw);
		nameList.add(name);
		genderList.add(gender);
	 	  session.setAttribute("idList",idList );
    	  session.setAttribute("pwList",pwList );
    	  session.setAttribute("nameList",nameList );
    	  session.setAttribute("genderList",genderList );
		
	  	%>
    	<script>
    		alert("회원가입 완료");
    		location.href="01_12_adminUserList.jsp";
    	</script>
    	
    	<%
    }else{
    	%>
    	<script>
    		alert("이미 존재하는 아이디입니다");
    		history.go(-1);
    	</script>
    	
    	<%
    }
%>
</body>
</html>