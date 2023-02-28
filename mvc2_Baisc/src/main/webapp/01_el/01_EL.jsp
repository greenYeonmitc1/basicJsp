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
 		EL(Expression Language)
 		- 더 이상 JSP 페이지 내에서 자바 코드를 사용하지 않고 좀 더 간편하게 태그 형태의 출력을 위한 도구
 		- request의 저장되어있는 값을 바로 사용할수있다. 
 	 --%>
 	 
 	 <%
 	 	int age = 10;
	%>

	<h2> 기존방법 </h2>
	나이 = <%= age + 1 %>	
	<br>
	
	<hr>
	
	<h2> el사용후 </h2>	
	<%
 	 	// 기존에는 request 안의 값을 다시 자바 변수로 변환해서 사용했다면,
 	 	// el 은 request 안의 값을 바로 사용할수있다. 
		request.setAttribute("age2", 50);		
	int age3 = (int)request.getAttribute("age2");
	%>
 	 
	나이 = ${ age2 }살 		
	<br>
	
   	
	
</body>
</html>

