<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#status a{
			font-size:0.8em;
			text-decoration: none;
		}
	</style>
</head>
<body>
	<c:if test="${empty sessionScope.id}">
		<div id="status">
			<a href="${ contextPath }/join.do">회원가입</a>&nbsp;
			<img alt="top" src="${contextPath}/resources/img/top.jpg"> &nbsp; 
			<a href="${ contextPath }/login.do">로그인</a>&nbsp;
		</div>
	</c:if>
	<c:if test="${!empty sessionScope.id}">
		<div id="status">
			<a href="#"> ${sessionScope.id}님</a> &nbsp; 
			<img alt="top" src="${contextPath}/resources/img/top.jpg"> &nbsp; 
			<a href="${ contextPath }/logout.do">로그아웃</a>&nbsp;
			<img alt="top" src="${contextPath}/resources/img/top.jpg"> &nbsp; 
			<a href="${ contextPath }/cartInfo.do">장바구니</a>&nbsp; 
			<img alt="top" src="${contextPath}/resources/img/top.jpg"> &nbsp; 
			<a href="${ contextPath }/checkMyOrderList.do">구매내역</a>&nbsp; 
			<img alt="top" src="${contextPath}/resources/img/top.jpg"> &nbsp; 
			<a href="${ contextPath }/showBoardListForCustomer.do">고객센터</a>&nbsp;
		</div>
	</c:if>
</body>
</html>