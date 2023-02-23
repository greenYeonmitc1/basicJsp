
<%@page import="kr.borad.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.borad.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<BoardVO> list = BoardDAO.getInstance().getAllList();

int 전체게시글수 = list.size();
int 한페이지에보여줄게시글수 = 5;
int 현재페이지번호 = 1; // 무조건 시작 페이지는 1페이지 

// null 값을 integer로 변경해주면 에러발생해서 조건처리 해주는 것 
if(request.getParameter("start")!= null){
	현재페이지번호 = Integer.parseInt(request.getParameter("start"));
}

int 현재게시글시작번호 = (현재페이지번호 -1)* 한페이지에보여줄게시글수; // 1페이지면 0부터 2페이지 5
int 현재게시글마지막번호 = 현재게시글시작번호 + 한페이지에보여줄게시글수; // 0+5
if(현재게시글마지막번호 > 전체게시글수){
	현재게시글마지막번호 = 전체게시글수;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
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
	 for(int i =현재게시글시작번호; i < 현재게시글마지막번호 ; i++){
		 BoardVO vo = list.get(i);
	%>
		<tr>
			<td><%= vo.getNo() %></td>
			<td><%= vo.getWriter() %></td>
			<td><%= vo.getRegDate() %></td>
			<td><a href="_05_updateBoard.jsp?index=<%= i %>"><%= vo.getSubject() %></a></td>
			<td><%= vo.getContents() %></td>
			<td><button onClick="location.href='_06_deleteBoardPro.jsp?index=<%= i %>'">삭제하기</button></td>
		</tr>
	<%
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




































