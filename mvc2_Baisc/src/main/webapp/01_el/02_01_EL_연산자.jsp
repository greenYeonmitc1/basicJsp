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
		// Servlet페이지에서 아래와 같은 변수명으로 저장되었을 때
		request.setAttribute("x", 10);
		request.setAttribute("y", 3);
	%>
	
<h2>사칙연산 </h2>

더하기	${ x + y }	<br>
빼기		${ x - y }	<br>
곱하기	${ x * y }	<br>
몫		${ x / y }	<br>
나머지	${ x % y }	<br>
나머지	${ x mod y } <br>	<!-- 나머지는 키워드도 제공한다. -->

<h2>비교연산 </h2>
	${x > y} 		
  	${x < y} 		
  	${x >= y} 		
  	${x <= y} 		
  	${x == y} 		
  	${x != y} 		
 
<br>
 
<h2>비교연산 키워드</h2>
	${x gt y} 		<%-- greater than --%>
	${x lt y} 		<%-- less than --%>  	
	${x ge y} 		<%-- greater or equal --%>
  	${x le y} 		<%-- less or equal --%>
  	${x eq y} 		<%-- equal --%>
  	${x ne y} 		<%-- not equal --%>

<br>

<h2>논리연산자 </h2>
  	${ x == x && y == y } 
  	${ x == x || x == y } 
  	${!(x == x)} 
<br>

<h2>논리연산자 키워드 </h2>  	
  	${ x == x and y == y } 
  	${x == x or x == y } 
  	${not(x == x)} 
<br>

<h2>삼항연산자</h2>
	${(x > y) ? x : y}  
  	

</body>
</html>