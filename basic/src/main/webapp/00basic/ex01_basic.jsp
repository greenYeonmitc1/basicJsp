<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	[1] JSP는 자바 서버 페이지의 약자이다.
	
	[2] JSP의 역할
		HTML 페이지에서 아래 4개의 태그를 추가로 사용할 수 있다.
	
		(1) 지시자(Directive) 태그			<%@ %>
		(2) 표현식(Expression) 태그		<%= %>
		(3) 스크립트릿(Scriptlet) 태그		<%  %>
		(4) 선언자(Declaration) 태그		<%! %>		(사용하지 않음)
 --%>
 <%--
	[1] 스크립트릿 태그
		(1) 사용법 : <% %>
		(2) 자바 변수를 사용할 수 있다.
	
	[2] 익스프레션 태그
		(1) 사용법 : <%= %>
		(2) 자바 변수를 출력할 수 있다.
--%>

<%--
	  [문제1] 10부터 50까지 arr 배열에 저장후 배열안의 모든값을 출력한다.
		[정답1] 10 20 30 40 50             <h1> </h1>
	
		[문제2] array 배열안의 모든값의 합을 출력한다.
		[정답2] 150
--%> 
<%
   int[] arr = {10,20,30,40,50};

for(int i =0; i < arr.length; i++){
	// 자바에서 html 태그를 생성하는 방식 
  //out.println("<h1>" + arr[i]+"</h1>"); 
 
}
%>

<% 
for(int i =0; i < arr.length; i++){
%>

<h1> <%=arr[i] %></h1>

<%
}
 %>

 
 
 
</body>
</html>