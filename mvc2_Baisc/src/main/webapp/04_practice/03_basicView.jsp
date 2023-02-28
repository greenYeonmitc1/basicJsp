<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check}">
		<h2>로그인 성공</h2>
	</c:if>
	
	<c:if test="${not check}">
		<h2>로그인 실패</h2>
	</c:if>
</body>
</html>