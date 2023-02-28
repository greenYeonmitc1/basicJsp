<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div align="center">
			<h2>가입정보</h2>
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>${ info[0] }</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>${ info[1] }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${ info[2] }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ info[3] }</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>${ info[4] }</td>
				</tr>
						
			</table>
		
		</div>	
</body>
</html>