<%@page import="basic.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
 Util myUtil = new Util();
 
 String str1 = request.getParameter("num1");
 String str2 = request.getParameter("num2");
 
 String msg ="";
 int maxNum =0;
 if(myUtil.isNumValue(str1) &&myUtil.isNumValue(str2)){

	 int num1 = Integer.parseInt(str1);
	 int num2 = Integer.parseInt(str2);
	 maxNum = num1;
	 if(maxNum < num2){
		 maxNum = num2;
	 }
	 if(num1 == num2){
		 msg="두 숫자가 같습니다";
	 }else{
		 msg = maxNum +"이 더 큰 숫자입니다";
	 }
	 
	 
 }else{
	 msg="숫자가 아닌값이 있습니다";
 }
 
 

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1><%=msg %></h1>
</body>
</html>