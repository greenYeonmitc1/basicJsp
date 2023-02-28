<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%= request.getContextPath() %></h2>
	<h2>로그인</h2>
	<form method="post" action="<%= request.getContextPath() %>/joinPro.nhn">
		아이디 : <input type="text" name="id"> <br>
		패스워드 : <input type="text" name="pw"> <br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>