<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
 <h1> 회원가입</h1>
 <form action="03_12_joinPro.jsp" method="post">
 <table>
 	<tr>
 		<td>아이디</td>
 		<td><input type="text" name="id" /></td>
 	</tr>
 	 <tr>
 		<td>비밀번호</td>
 		<td><input type="text" name="pw" /></td>
 	</tr>
 	 <tr>
 		<td>이름</td>
 		<td><input type="text" name="name" /></td>
 	</tr>
 	 <tr>
 		<td>성별</td>
 		<td><input type="radio" name="gender" value="남성" /> 남성 &nbsp; <input type="radio" name="gender" value="여성"/> 여성 &nbsp;</td>
 	</tr>
 	 	<tr> <td colspan="2"><input type="submit" value="회원가입" /> </td></tr>
 </table>
</form>
</body>
</html>