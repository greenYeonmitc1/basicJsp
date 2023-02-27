<%@page import="kr.board.model.BoardDAO"%>
<%@page import="kr.board.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "header.jsp" %> 
<%
  String str = request.getParameter("no");
  int no = 0;
  if(str != null){
	  no = Integer.parseInt(str);
  }
  BoardVO board = BoardDAO.getInstance().getABoard(no);
  
  
  if(str == null || board == null){
	  response.sendRedirect("_01_boardList.jsp");
  }else{

%>    
    
	<h1 class="py-3">게시글 수정하기</h1>
	<form method="post" action="_05_updateBoardPro.jsp">
		<table class="table" >
			<tr  >
				<th class="col-2">번호</th>
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
				<td  colspan="3">
					<input class="w-100" type="text" name="subject" value="<%= board.getSubject() %>">
				</td>
			</tr>
			<tr >
				<th>내용</th>
				<td colspan="3">
					<textarea class="w-100" rows="10" cols="20" name="contents"><%= board.getContents() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" >
					<input type="hidden" name="no" value="<%= no %>">
					
					<input  class=" col-5 btn btn-outline-success" type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
	<%} %>
</body>
</html>


















