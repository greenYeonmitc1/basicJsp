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
// session은 무조건 Object 타입으로 저장이 되기때문에 값을 가져올때 항상 다운케스팅 해줘야한다

   String names[] = (String[])session.getAttribute("names");
   int scores[] = (int[])session.getAttribute("scores");
   
   
   
%>

<table border="1">
<tr> <th> 이름 </th><th> 나이 </th></tr>
<% for(int i =0; i < names.length;i++){ %>

<tr> <td><%=names[i] %></td> <td><%=scores[i] %></td></tr>

<%} %>
</table>

</body>
</html>