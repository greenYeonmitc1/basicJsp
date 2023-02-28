<%@page import="_02_jstl.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
Member mem1 = new Member("qwer", "1111", "홍길동", "qwer@naver.com", "sports");
	Member mem2 = new Member("abcd", "2222", "박민철", "abcd@naver.com", "drawing");
	Member mem3 = new Member("java", "3333", "김상수", "java@naver.com", "reading");
	
	ArrayList<Member> list = new ArrayList<Member>();
	list.add(mem1);
	list.add(mem2);
	list.add(mem3);
	
	request.setAttribute("memberList", list);
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>JSTL 태그</title>
	</head>
	<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>이메일</th>
			<th>취미</th>
		</tr>
		<%-- 확장for문과 기능이 똑같다. --%>
		
		
		<c:forEach var="mem" items="${ memberList }"> <!-- for(MemberDTO mem : memberList){} -->
		<tr>
			<%-- mem.getId()와 동일 문장 --%>
			<td>${ mem.id }</td>
			<td>${ mem.pw }</td>
			<td>${ mem.name }</td>
			<td>${ mem.email }</td>
			<td>${ mem.hobby }</td>
		</tr>
		</c:forEach>
	</table>

	
	
	
	</body>
</html>