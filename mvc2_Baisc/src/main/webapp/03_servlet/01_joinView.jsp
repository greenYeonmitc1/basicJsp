<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>서블릿</title>
	</head>
	<body>
		<div align="center">
			<h2>가입정보</h2>
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>${ member.id }</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>${ member.pw }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${ member.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ member.email }</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>${ member.hobby }</td>
				</tr>
						
			</table>
		
		</div>	
	</body>
</html>









