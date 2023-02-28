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
	<%--
		session.removeAttribute("id");
		위 문법이 아래와 같이 변경되었다.
	--%>
	<c:remove var="id" scope="session" />
	
	<%--
		response.sendRedirect("02_login.jsp");
		위 문법이 아래와 같이 변경되었다.
	--%>
	<c:redirect url="02_login.jsp" />
	
</body>
</html>