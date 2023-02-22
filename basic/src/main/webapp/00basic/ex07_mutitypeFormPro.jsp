
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
 request.setCharacterEncoding("utf-8");

int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String grade =  request.getParameter("grade");
String subject =  request.getParameter("subject");

String[] hobbies = request.getParameterValues("hobbies");
String data ="";
for(int i =0; i < hobbies.length;i++){
	data+= hobbies[i] +" ";
}
String memo =  request.getParameter("memo");


%>

<div align="center">
 <table border="1">
 
 <tr>
 	<td>학번</td>
 	<td>이름</td>
 	<td>학년</td>
 	<td>과목</td>
 	<td>취미</td>
 	<td>메모</td>
 </tr>
 
  <tr>
 	<td><%=num %></td>
 	<td><%=name %></td>
 	 <td><%=grade %></td>
 	<td><%=subject %></td>
 	<td><%=data %></td>
 	<td><%=memo %></td>
 </tr>
 
 </table>

</div>

</body>
</html>
</body>
</html>