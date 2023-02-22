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
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
    int idx = MemberDAO.getInstance().checkId(id);
    if(idx==-1){
		String pw =  request.getParameter("pw");
		String name =  request.getParameter("name");
		String gender =  request.getParameter("gender");
		MemberDAO.getInstance().addMember(id, pw, name, gender);
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