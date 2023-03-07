<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<c:if test="${ null ne sessionScope.id }">
				${ id }님, 환영합니다.<br>
			<br>
			<a href="logout.do">로그아웃</a>
			<br>
			<br>
			<a href="update.do">회원정보수정</a>
			<br>
			<br>
			<a href="delete.do">탈퇴</a>
			<br>
			<br>
		</c:if>

		<c:if test="${ null eq sessionScope.id }">
			<a href="join.do">회원가입</a>
			<br>
			<br>
			<a href="login.do">로그인</a>
		</c:if>
		
		<a href="testAjax.jsp">ajax 테스트 </a>
		
	</div>

	
	
</body>
</html>



