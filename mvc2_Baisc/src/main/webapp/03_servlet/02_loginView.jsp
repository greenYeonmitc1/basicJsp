<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%--
	. <meta http-equiv="refresh" content="시간(초 단위);url=이동하고자 하는 웹페이지 주소">
	. refresh 태그는 새로고침을 해주는 태그이다.
	. 즉 로그인 후, 3초 뒤에 자동으로 02_login.jsp페이지로 이동한다는 의미이다.
 --%>    
<meta http-equiv="refresh" content="3; url=03_servlet/02_login.jsp">

<title>Insert title here</title>
</head>
<body>
	<%--
		String id = request.getParameter("id");
		session.setAttribute("id", id);
		
		위 문법이 아래와 같이 변경되었다.
	--%>
	<c:set var="id" value="${ id }" scope="session" />
	
	<%--
		session.getAttribute("id");
		위 문법이 아래와 같이 변경되었다.
	--%>
	<h2>  ${ sessionScope.id } </h2>
	3초 뒤에 메인 화면으로 이동합니다.
	
</body>
</html>