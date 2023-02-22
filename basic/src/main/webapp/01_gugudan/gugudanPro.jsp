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
		String str = request.getParameter("x");
		int x = Integer.parseInt(str);
		
		str = request.getParameter("y");
		int y = Integer.parseInt(str);
	
		str = request.getParameter("z");
		int z = Integer.parseInt(str);
		
		str = request.getParameter("gameCount");
		int gameCount = Integer.parseInt(str);
		
		str = request.getParameter("scoreCount");
		int scoreCount = Integer.parseInt(str);
		
		int state = 2;
		if(x * y == z){
			scoreCount += 1;
			state = 1;
		} 
		
		if(gameCount == 5) {
			state = 3;
		}
		int score = scoreCount * 20;
	%>
	
	<h2>[<%= gameCount %>]번째 게임 : [<%= score %>]점</h2>
	
	<%
		if(state == 1) {
	%>
			<h1>정답</h1>
			<a href="gugudan.jsp?gameCount=<%= gameCount + 1 %>&scoreCount=<%= scoreCount %>&play=gamePlaying">뒤로가기</a>
	<%
		} else if(state == 2) {
	%>
			<h1>오답</h1>
			<a href="gugudan.jsp?gameCount=<%= gameCount + 1 %>&scoreCount=<%= scoreCount %>&play=gamePlaying">뒤로가기</a>
	<%
		} else if(state == 3) {
	%>
			<h1>종료</h1>
			<a href="index.jsp">처음으로</a>
	<%
		}
	%>
</body>
</html>