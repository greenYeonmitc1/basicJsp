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
  // 파일 -> 큰 용량 url로 값전달하는 get 방식은 불가능 : post로만 값 전달 가능 
%>
<form name="frmName" method="post" enctype="multipart/form-data" 
action="inputFormPro.jsp">
    user<br/> 
    <input name="user"><br/>
    title<br/> 
    <input name="title"><br/>
    file<br/> 
    <input type="file" name="uploadFile"><br/><br/>
    <input type="submit" value="UPLOAD"><br/>
</form>

</body>
</html>