<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 회원가입 </h1>
<form method="post" action="joinPro.jsp">

 Name : <input type="text" name="name" /> <br><br>
 I  D : <input type="text" name="id" /> <br><br>
 P  W : <input type="text" name="pw" /> <br><br>
<input type="submit" value="회원가입" />
</form>
<br>

<button onclick="location.href='index.jsp'"> 홈으로 </button>

</body>
</html>