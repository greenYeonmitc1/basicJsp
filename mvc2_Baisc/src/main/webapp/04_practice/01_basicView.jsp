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
	<h2>국어 성적 = ${ kor }점</h2>
	<h2>영어 성적 = ${ eng }점</h2>
	<h2>수학 성적 = ${ math }점</h2>

	<c:if test="${ check }">
		<h2>합격입니다.</h2>
	</c:if>
	<c:if test="${ not check }">
		<h2>불합격입니다.</h2>
	</c:if>
</body>
</html>