<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		// request 와 session 의 키값이 다를경우는 키값만 사용해도되지만
		// request 와 session 의 키값이 같은경우는 request먼저 적용된다.
		//그래서 session의 값을 사용하고싶으면 키값앞에 sessionScope. 을 써줘야한다.
		// 일반적으로 session 은 sessionScope. 을 무조건 사용하는것이 오류를 줄일수있다. 
		request.setAttribute("name1" ,"이만수");
		session.setAttribute("name1", "홍길동");
		session.setAttribute("name2", "이순신");
	%>  	
  	${name1 } <!-- request 것이 우선순위로 적용된다. -->
  	${sessionScope.name1 }
  	${name2 }
  	
  	
</body>
</html>