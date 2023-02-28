<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberMVC1</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
  <header>
          <div class="row">  <!--py-3(y축으로) 높이 column row )-->
            <div class="w-50 py-3" onclick="location.href='01_memberlist.jsp'"> 회원목록 </div>
    
            
            <%if(%> ${log ne null } <%){ %>
            <div class="w-25 py-3" onclick="location.href='04_memberInsert.jsp'"> 회원가입 </div>
            <div class="w-25 py-3"  onclick="location.href='02_memberLogin.jsp'"> 로그인 </div>
            <%}else{ %>
     
                    <div class="w-25 py-3" onclick="location.href='05_memberContent.jsp?num=<%=(int)session.getAttribute("log") %>'"> 내정보 </div>
                    <div class="w-25 py-3" onclick="location.href='03_Memberlogout.jsp'"> 로그아웃 </div>
            <%} %>
        </div>
</header>
