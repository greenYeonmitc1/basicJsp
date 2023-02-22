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

session.invalidate(); // session의 전체 값 초기화 

// 각각 세션의 값을 삭제하고 싶으면 
 //session.removeAttribute("name");
// session.removeAttribute("id");
 //session.removeAttribute("pw");
 
 response.sendRedirect("index.jsp");
%>

</body>
</html>