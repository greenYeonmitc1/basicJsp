
<%@page import="kr.borad.model.BoardDAO"%>
<%@page import="kr.borad.model.BoardVO"%>
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
		ArrayList<BoardVO> list = BoardDAO.getInstance().getAllList();
		
		int 전체게시글수 = list.size();
		
		int 한페이지에보여줄게시글수 = 5;
		int 현재페이지번호 = 1;  // 무조건 시작 페이지는 1 페이지 
		if(request.getParameter("start") != null) {
			현재페이지번호 = Integer.parseInt(request.getParameter("start"));
		}
		
		
		int 현재페이지의게시글시작번호 = (현재페이지번호 - 1) * 한페이지에보여줄게시글수;
		int 현재페이지의게시글마지막번호 = 현재페이지의게시글시작번호 + 한페이지에보여줄게시글수;
		if(현재페이지의게시글마지막번호 > 전체게시글수) { 
			현재페이지의게시글마지막번호 = 전체게시글수;
		}
	%>
	
	전체 게시글 수 : <%= 전체게시글수 %>개
	
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
		for(int i=현재페이지의게시글시작번호; i<현재페이지의게시글마지막번호; i++) {
			BoardVO vo = list.get(i);
	%>	
		<tr>
			<td><%= vo.getNo() %></td>
			<td><%= vo.getWriter() %></td>
			<td><%= vo.getRegDate() %></td>
			<td><%= vo.getSubject() %></td>
			<td><%= vo.getContents() %></td>
			<td>
				<button onclick="window.location.href=''">삭제하기</button>
			</td>
		</tr>
	
	<%	} %>
		<tr>
			<td colspan="6">
				<button onclick="window.location.href='_00_main.jsp'">메인화면</button>
			</td>
		</tr>
	</table>
	
	<%
		int 전체페이지수 = 전체게시글수 / 한페이지에보여줄게시글수;
		if(전체게시글수 % 한페이지에보여줄게시글수 > 0) {
			전체페이지수 += 1;
		}
		int 한페이지에보여줄페이지번호개수 = 3;
		int 한페이지에보여줄페이지시작번호 = 1;
		//if(request.getParameter("한페이지에보여줄페이지시작번호") != null){
		if(request.getParameter("end") != null){
			한페이지에보여줄페이지시작번호 = Integer.parseInt(request.getParameter("end"));
		}
		                                                // 배열이 아니니깐 1 빼서 시작 
		int 한페이지에보여줄페이지마침번호 = 한페이지에보여줄페이지시작번호 + 한페이지에보여줄페이지번호개수 - 1;
		if(한페이지에보여줄페이지마침번호 > 전체페이지수) {
			한페이지에보여줄페이지마침번호 = 전체페이지수;
		}
	%>
	
	<%  if(한페이지에보여줄페이지시작번호 > 한페이지에보여줄페이지번호개수) { %>
		[<a href="_07_boardListPaging.jsp?start=<%= 한페이지에보여줄페이지시작번호 - 1 %>&end=<%= 한페이지에보여줄페이지시작번호 - 한페이지에보여줄페이지번호개수 %>">이전</a>]
	<%	} %>
	
	<%  for(int i=한페이지에보여줄페이지시작번호; i<=한페이지에보여줄페이지마침번호; i++) { %>
			[<a href="_07_boardListPaging.jsp?start=<%= i %>&end=<%= 한페이지에보여줄페이지시작번호 %>"><%= i %></a>]
	<%	} %>
	
	<%  if(한페이지에보여줄페이지마침번호 < 전체페이지수) { %>
		[<a href="_07_boardListPaging.jsp?start=<%= 한페이지에보여줄페이지시작번호 + 한페이지에보여줄페이지번호개수 %>&end=<%= 한페이지에보여줄페이지시작번호 + 한페이지에보여줄페이지번호개수 %>">이후</a>]
	<%	} %>
</body>
</html>












