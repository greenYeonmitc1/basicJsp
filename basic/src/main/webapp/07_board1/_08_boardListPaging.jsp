
<%@page import="kr.borad.model.BoardVO"%>
<%@page import="kr.borad.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>

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
	    String curPage = request.getParameter("start");
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardVO> list = dao.getPageData(curPage);

	%>
	
	전체 게시글 수 : <%= dao.getAllList().size() %>개
	
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
	  int idx =0;
		for(BoardVO vo : list) {
			
	%>	
		<tr>
			<td><%= vo.getNo() %></td>
			<td><%= vo.getWriter() %></td>
			<td><%= vo.getRegDate() %></td>
			<td><%= vo.getSubject() %></td>
			<td><%= vo.getContents() %></td>
			<td>
				<button onclick="window.location.href='_06_deleteBoardPro.jsp?index=<%=idx %>'">삭제하기</button>
			</td>
		</tr>
	
	<%	idx++;} %>
		<tr>
			<td colspan="6">
				<button onclick="window.location.href='_00_main.jsp'">메인화면</button>
			</td>
		</tr>
	</table>
	
	<%
  
		String endPage = request.getParameter("end");
		int[] nums = dao.addPageNextBefore(endPage);
	    int start = nums[0];
	    int end = nums[1];
	    int pageLimit = nums[2];
	    int totalPageNum = nums[3];
	%>
	
	<%  if(start > pageLimit) { %>             <!--  4-1 : 3   -->  <!-- 계속 3으로 유지 4-3 1   -->
		[<a href="_07_boardListPaging.jsp?start=<%= start - 1 %>&end=<%= start - pageLimit %>">이전</a>]
	<%	} %>
	<!-- 1 2 3 -->  <!-- 4 5 6  -->  <!-- end는 페이지 끝 번호  -->
	<%  for(int i=start; i<=end; i++) { %>
			[<a href="_07_boardListPaging.jsp?start=<%= i %>&end=<%= start %>"><%= i %></a>]
	<%	} %>
	
	<%  if(end < totalPageNum) { %>
		[<a href="_07_boardListPaging.jsp?start=<%= start + pageLimit %>&end=<%= start + pageLimit%>">이후</a>]
	<%	} %>
</body>
</html>












