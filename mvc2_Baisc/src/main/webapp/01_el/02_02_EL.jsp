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
	<%-- 숫자와 문자, null 비교 : eq, ne --%>
	<%
		request.setAttribute("name1", "홍길동");
		request.setAttribute("name2", "이순신");
	%>  	
  	${name1 ne name2}
  	
  	${null ne name1}
  	<%-- list, map등 객체가 비어있는지 확인 : empty, !empty --%>
  	<%
  		ArrayList<Integer> list = new ArrayList<Integer>();
  		list.add(10);
  		
		request.setAttribute("list", list);
  	%>
  	${!empty list}
  	${empty list }
</body>
</html>