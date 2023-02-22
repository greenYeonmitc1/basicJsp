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
	form 데이터의 값을 받아오는 객체 => request 받아서 저장 
*/

/*
 한글 깨짐을 방지할 수 있다 . => requset 값 불러오기전에 인코딩 셋팅을 해줘야한다
*/
request.setCharacterEncoding("utf-8");

String num1 = request.getParameter("su1");
String num2 = request.getParameter("su2");

boolean ch1 = true;
boolean ch2 = true;

for(int i =0 ; i < num1.length(); i++){
	if((char)num1.charAt(i)<'0' ||(char)num1.charAt(i) >'9' ){
		ch1 = false;
	}
}

for(int i =0 ; i < num2.length(); i++){
	if(!Character.isDigit(num2.charAt(i))){
		ch2 = false;
	}
}

int n1 = 0;
int n2 = 0;
if(ch2 && ch1){
    n1 = Integer.parseInt(request.getParameter("su1"));
    n2 = Integer.parseInt(request.getParameter("su2"));
    %>

	<h1>
		num1 =<%= num1 %></h1>
	<h1>
		num2 =<%= num2 %></h1>
	<h1>
		hap =<%= n1 + n2 %></h1>

	<% }else{%>
				<h1>숫자가 아닌값이 있어서 덧셈불가</h1>
	<% 
	}
    %>

   <h1> su1 : <%= num1 %></h1>
     <h1> su2 : <%= num2 %></h1>
</body>
</html>