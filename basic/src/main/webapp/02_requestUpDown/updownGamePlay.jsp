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

	String str = request.getParameter("com"); // 파라미터값이 없으면 null을 리턴한다 
	int com =0;
if(str == null){
	Random rd = new Random();
	com = rd.nextInt(100)+1;
}else{
	com = Integer.parseInt(str);
}
%>

치트키 : <%=com %>
<h1> 업다운 게임 </h1>
<form action="updownGamePlayPro.jsp" method="get" >

<input type="number" name="me" value="0" >
<input type="hidden" name="com" value="<%=com %>" >
<input type="submit" value="전송">
</form>



</body>
</html>