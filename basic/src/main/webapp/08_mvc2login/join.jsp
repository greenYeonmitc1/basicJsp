<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
			<h2>회원가입</h2>
			<form method="post" action="${ctx}/join.do">
				<table border="1">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email"></td>
					</tr>
					<tr>
						<th>취미</th>
						<td>
							<input type="checkbox" name="hobby" value="sports">스포츠
							<input type="checkbox" name="hobby" value="reading">독서
							<input type="checkbox" name="hobby" value="drawing">그림
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="회원가입">
						</td>
					</tr>
				</table>
			</form>
</body>
</html>