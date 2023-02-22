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

<%
	Random rand = new Random();
	int rnum = rand.nextInt(10)+1;

%>

<%
/*
	form 데이터 -> action : 데이터를 이동할 페이지(경로)
	          -> mehtod : 데이터를 보내는 방법 

	사용자가 입력한 값들이 action 페이지로 넘어간다
	input -> value: 사용자가 입력한 값 저장 
    input -> name : 변수 이름 
    
    name = value;
    request.setParameter(name,value);
    
    // URL뒤에?su1=12&su2=34  queryString--> 값전달 : get 
    		
    		
       데이터를 다른 JSP 페이지로 전달하는 방법 3가지 
		
		(1) form   : action="next.jsp"과 submit버튼
		(2) a      : href="next.jsp"
		(3) button : onclick="window.location.href='next.jsp'"
*/

%>

	 <h2> 홀짝 게임  </h2>
 
   <form action="ex05_formBtnpro1.jsp" method="post">
 
	홀수 1 입력 짝수면 2입력 <br>
	<input type="hidden" name="rnum" value=<%= rnum %> />
	<input type="number" name="result" />
 	
 	<input type="submit" value="입력완료" /> 
 	<input type="button" value="전송" onclick="goNextPage(<%=rnum %>)" /> 
 
   <a href="ex01_basic.jsp"> ex01로 이동</a>
 </form>
 <script>
 
 // 아직 입력값이 입력이 되지 않았음으로 input의 value가 만들어지지않아서 이렇게 함수로 
 // sumbit를 누를때 input에 있는 value 를 받아서 get 방식으로 queryString으로 값 전달은 해준것이다
 function goNextPage(num){
	 let value = document.querySelector("input[name='result']").value;
	 location.href="ex05_formBtnpro2.jsp?rnum="+num+"&result="+value;
 }
 
 </script>

</body>
</html>