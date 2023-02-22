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
/*
	form 데이터 -> action : 데이터를 이동할 페이지(경로)
	          -> mehtod : 데이터를 보내는 방법 

	사용자가 입력한 값들이 action 페이지로 넘어간다
	input -> value: 사용자가 입력한 값 저장 
    input -> name : 변수 이름 
    
    name = value;
    request.setParameter(name,value);
    
    // URL뒤에?su1=12&su2=34  queryString--> 값전달 : get 
*/

%>
<form action="ex03_form02.jsp" method="get">
	<table border="1">
	<tr>
		<td>첫번째 수 : </td>
		<td> <input type="text" name="su1" /></td>
	</tr>
	<tr>
	<td>첫번째 수 : </td>
	<td> <input type="text" name="su2" /></td>
	</tr>
		<tr>
	<td colspan="2">
	<!-- 버튼 태그가 form태그 안에있으면  <input type="submit" /> 로 자동인식 
	 <button> 전송 </button> </td>
	</tr>
	<tr>
	<td colspan="2"> <input type="reset" value=" 리셋"/> </td>
	</tr>
	-->
	<tr>
	<td colspan="2">  <input type="submit" value="전송 submit"/></td>
	
	</tr>
	</table>
</form>
</body>
</html>