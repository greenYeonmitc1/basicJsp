
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

	<%@ include file= "header.jsp" %>
	<div align="center">
	<table>
		<tr height="60">
		<td align="center" colspan="3">
			<font size="6" color="gray">최신형 자동차</font>
		</td>
		</tr>
		<tr height="240">
      <c:forEach var="vo" items="${list}">
	
			<td width="333" align="center">
			<a href="main.do?center=carReserveInfo.do">
				<img alt="" src="img/${vo.img}" width="300" height="220">
			</a><p>
			차량명 :${vo.name}
			</td>
	  </c:forEach>
		</tr>
	</table>
	
	<!-- ================================================== -->
	
	<hr size="3" color="red">
	<p>
	<font size="4" color="gray"><b>차량 검색 하기</b></font>
	
	<form action="01_carMain.jsp?center=13_carCategoryList.jsp" method="post">
		<font size="3" color="gray"><b>차량 검색 하기</b></font>&nbsp;&nbsp;
		<select name="category">
			<option value="1">소형</option>
			<option value="2">중형</option>
			<option value="3">대형</option>
		</select>
		<input type="submit" value="검색" />&nbsp;&nbsp;
	</form>
	<%-- button은 form 밖에 위치시키기 --%>
	<button onclick="location.href='01_carMain.jsp?center=09_carAllList.jsp'">전체 검색</button>
	
	
	</div>
	<%@ include file= "footer.jsp" %>
