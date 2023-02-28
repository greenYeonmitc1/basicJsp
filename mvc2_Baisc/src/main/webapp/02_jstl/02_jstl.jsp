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
	<h3>JSTL core 태그예제 - if </h3>
	<!-- request.setAttribute("country","korea") -->
	<c:set var="country" value="korea" /> <!-- country = korea -->
	<!-- c:if 태그는 else 문이 없다 , test안에 el 형태로 조건문이 들어온다  -->
	<c:if test="${ country ne null }" >
		국가명: <c:out value="${country}" /> 		<br>
	</c:if>
	
	<c:out value="${country}" />의 겨울은 춥다.		<br>
</body>
</html>



