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
	<c:if test="${ com eq me }">
		<h2>비겼다</h2>
	</c:if>
	
	<c:if test="${ me eq '가위' }">
		<h2>졌다</h2>
	</c:if>
	
	<c:if test="${ me eq '보' }">
		<h2>이겼다</h2>
	</c:if>
	
</body>
</html>