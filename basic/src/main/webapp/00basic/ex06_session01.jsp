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
String names[]={"박연미","홍길동","하하","노홍철"};
int scores[] = {87,21,76,20};

session.setAttribute("names", names);
session.setAttribute("scores", scores);

// session에 유효기간을 줄수있다 
// 세션에 저장된 데이터가 5초간만 유지되고 삭제된다 
session.setMaxInactiveInterval(5); // 1 이 1초

%>

<a href="ex06_session01Pro.jsp">다음페이지</a>

</body>
</html>