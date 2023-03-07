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
	<c:if test="${empty sessionScope.id}">
	  <p>로그인이 필요한 페이지입니다.</p>
	</c:if>
	
	<c:if test="${!empty sessionScope.id}">
	  	<h2>현황</h2>
	    <h3>회원 수 : ${memberCnt}명</h3>
	    <h3>등록된 상품 수 : ${itemCnt}개</h3>
	    <h3>누적 주문량 : ${buyCnt}건</h3>
	</c:if> 
</body>
</html>