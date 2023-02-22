<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 순수 자바 코드영역 
// java8 만들어진 날짜 객체 
LocalDate now = LocalDate.now(); 
System.out.println(now); // 2023-02-21
String today = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--주석 jsp 태그 주석 --%>
<!-- html 태그 주석  -->
 <h1>test.jsp </h1>
 <h1><%= 10 + 3 %> </h1>
  <h1> 오늘은 <%= today %>이야 </h1>

</body>
</html>