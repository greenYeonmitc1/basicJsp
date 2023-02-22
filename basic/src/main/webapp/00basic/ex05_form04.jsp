<%@page import="java.util.Random"%>
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
	 [구구단 게임]
	  
	  1. 구구단 문제를 출제하기 위해, 숫자 2개를 랜덤저장한다.
	  2. 저장한숫자를 토대로 구구단 문제를 출력한다.
	 	 예)	3 x 7 = ?
	  3. 문제에 해당하는 정답을 입력받는다.
	  4. 정답을 비교 "정답" 또는 "땡"을 출력한다.
	 
 --%>
 
 <%
 	Random ran = new Random();
 	int num1 = ran.nextInt(8) + 2;
 	int num2 = ran.nextInt(9) + 1;
 %>
 
 <h2> 구구단 </h2>
 
 <form action="ex05_form04pro.jsp" method="post">
 
 	<%=num1 %> * <%=num2 %> = <input type="number" name="result" > <br><br>
 	
 	<input type="hidden" value=<%=num1 %> name="num1">
 	<input type="hidden" value=<%=num2 %> name="num2">
 	
 	<input type="submit" value="입력완료" /> 
 
 </form>
 
 
 

</body>
</html>