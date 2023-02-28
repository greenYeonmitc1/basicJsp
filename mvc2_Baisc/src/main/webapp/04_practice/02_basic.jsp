<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	
 	<h3>가위 바위 보 게임</h3> 

	<c:set var="com" value="바위" />
	
	<form action="${ contextPath }/test02.do">
		(가위) (바위) (보)  중에 한개의 값을 입력 : 
		<input type="text" name="me"> 
		
		<%-- 입력받지 않은 데이터는 hidden으로 반드시 값을 넘겨줘야 한다. --%>
		<input type="hidden" name="com" value="${ com }">
		
		<input type="submit" value="확인">
	</form>
</body>
</html>