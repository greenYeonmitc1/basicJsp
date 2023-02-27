<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객관리 시스템</title>
<link rel="stylesheet" type="text/css" href="./style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<header class="row">
	      <!-- with:50%  padding top bottom 3px-->
		<div class="col-4 py-3" onclick="location.href='01_12_adminUserList.jsp'"> 회원목록 </div>
		<%if(session.getAttribute("idx")==null) {%>

	    <div class="col-4 py-3"  onclick="location.href='03_11_joinForm.jsp'"> 회원가입 </div>
	    <div class="col-4 py-3"  onclick="location.href='03_21_loginForm.jsp'"> 로그인 </div>
	    <%}else{ %>
	    <div class="col-4 py-3" onclick="location.href='03_51_memberInfo.jsp'"> 내정보 </div>
	    <div class="col-4 py-3"  onclick="location.href='03_23_logoutPro.jsp"> 로그아웃 </div>	    
	    <%} %>
	</header>
