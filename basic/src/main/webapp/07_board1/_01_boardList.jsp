
<%@page import="kr.borad.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.borad.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<BoardVO> list = BoardDAO.getInstance().getAllList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	전체 게시글 수 : <%= list.size()  %>개
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>제목</th>
			<th>내용</th>
			<th>삭제</th>
		</tr>
	<%
	    int idx = 0; 
		for(BoardVO vo : list) {
	%>
		<tr>
			<td><%= vo.getNo() %></td>
			<td><%= vo.getWriter() %></td>
			<td><%= vo.getRegDate() %></td>
			<td><a href="_05_updateBoard.jsp?index=<%= idx %>"><%= vo.getSubject() %></a></td>
			<td><%= vo.getContents() %></td>
			<td><button onClick="location.href='_06_deleteBoardPro.jsp?index=<%= idx %>'">삭제하기</button></td>
		</tr>
	<%
		idx++;
		}
	%>
		<tr>
			<td colspan="6">
				<button onclick="location.href='_00_main.jsp'">메인화면</button>
			</td>
		</tr>
	</table>
</body>
</html>




































