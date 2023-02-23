<%@page import="kr.borad.model.BoardVO"%>
<%@page import="kr.borad.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  String str = request.getParameter("index");
  int idx = 0;
  if(str != null){
	  idx = Integer.parseInt(str);
  }
  BoardVO board = BoardDAO.getInstance().getABoard(idx);
  
  if(str == null){
	  response.sendRedirect("_00_main.jsp");
  }else if(board == null ){
	  response.sendRedirect("_00_main.jsp");
  }
  

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>게시글 수정하기</h1>
	<form method="post" action="_05_updateBoardPro.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td colspan="3"><%=board.getNo() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= board.getWriter() %></td>
				<th>작성일</th>
				<td><%= board.getRegDate() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="subject" value="<%= board.getSubject() %>">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea rows="10" cols="20" name="contents"><%= board.getContents() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="hidden" name="index" value="<%= idx %>">
					
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>


















