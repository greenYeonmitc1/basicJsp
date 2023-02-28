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
		# JSTL(JSP Standard Tag Library)
		. EL태그와 마찬가지로 더 이상 JSP 페이지 내에서 자바 코드를 사용하지 않기 위한 도구로서
		. 조건문이나 반복문을 태그 형태로 지원
		. EL과 함께 사용하면 편리하다.
		 
		# JSTL 태그를 사용하기 위한 조건 2가지
		(1) WebContent > WEB-INF > lib > jstl-1.2.jar  파일 추가 
		(2) 상단에 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 태그 명령어 추가  
	
		
	--%>
	
	<h3>JSTL core 태그예제 - set, out, remove</h3>
	<%-- data변수 저장 후 출력 --%>
	<c:set var="data" value="10" />		<br> <!--  request.setAttibute("data" , 10) -->
											 <!--  data = 10;   -->
	data = <c:out value="${data}" />	<br> <%--  data = <%= data %>    -->
	<br><br>
	
	<%-- data변수 삭제 후 출력 --%>	
	<c:remove var="data" />				<br> <!-- request.setAttibute("data" , "") -->
	data = <c:out value="${data}" />	<br>
</body>
</html>
