<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		table {
			border-collapse: collapse;
			border: 1px solid ligthgray;
		}
	</style>
</head>
<body>
	<%
		int[] sampleNumberList = {1, 2, 3, 4, 5};
		String[] sampleImageList = {"1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"};
		String[] sampleNameList = {"대파입니다", "상추입니다", "당근입니다", "깻잎입니다", "애호박입니다"};
		int[] samplePriceList = {1000, 1200, 700, 4200, 9400};
		int[] sampleCountList = {2, 1, 1, 4, 3};
		
		int[] numberList = new int[100];
		String[] imageList = new String[100];
		String[] nameList = new String[100];
		int[] priceList = new int[100];
		int[] countList = new int[100];
		
		for(int i=0; i<5; i++){
			numberList[i] = sampleNumberList[i];
			imageList[i] = sampleImageList[i];
			nameList[i] = sampleNameList[i];
			priceList[i] = samplePriceList[i];
			countList[i] = sampleCountList[i];
		}
		
		int count = 5;
		
		session.setAttribute("numberList", numberList);
		session.setAttribute("imageList", imageList);
		session.setAttribute("nameList", nameList);
		session.setAttribute("priceList", priceList);
		session.setAttribute("countList", countList);
		session.setAttribute("count", count);
	%>
	<div align="center">
		<h2>상품 목록</h2>
		<table border="1">
			<tr>
			<% for(int i=0; i<5; i++) { %>
					<td style="padding: 10px;">
						<a href="itemInfo.jsp?index=<%=i %>">
							<input type="image" src="img/<%= imageList[i] %>" width="150px">
						</a>
					</td>
			<% } %>
			</tr>
			<tr>
			<% for(int i=0; i<5; i++) { %>
				<td><%= nameList[i] %></td>
			<% } %>
			</tr>
		</table>
	</div>
</body>
</html>