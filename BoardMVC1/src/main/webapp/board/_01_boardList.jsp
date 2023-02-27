
<%@page import="kr.board.model.BoardDAO"%>
<%@page import="kr.board.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "header.jsp" %>
<%
ArrayList<BoardVO> list = BoardDAO.getInstance().getAllList();
%>
	
	<div class="nav justify-content-end py-3"> 전체 게시글 수 : <%= list.size()  %>개 </div>
	
	<table class="table" >
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>제목</th>
			<th>내용</th>
			<th>삭제</th>
		</tr>
	<%
		for(BoardVO vo : list) {
	%>
		<tr>
			<td><%= vo.getNo() %></td>
			<td><%= vo.getWriter() %></td>
			<td><%= vo.getRegDate() %></td>
			<td><a href="_05_updateBoard.jsp?no=<%= vo.getNo() %>"><%= vo.getSubject() %></a></td>
			<td><%= vo.getContents() %></td>
			<td><button class="btn btn-outline-danger" onClick="location.href='_06_deleteBoardPro.jsp?no=<%=  vo.getNo() %>'">삭제</button></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>




































