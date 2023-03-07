<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="${contextPath}/resources/jq/jquery-1.11.0.min.js"></script>
	<script src="${contextPath}/resources/js/11_itemlistformanager.js"></script>
</head>
<body>
	<c:if test="${empty sessionScope.id}">
		<%--
			. <meta http-equiv="refresh" content="시간(초 단위);url=이동하고자 하는 웹페이지 주소">
			. refresh 태그는 새로고침을 해주는 태그이다.
			. 즉 로그아웃 상태일 경우, 1초 뒤에 자동으로 managerMain.do 페이지로 이동한다는 의미이다.
		 --%>
		<meta http-equiv="refresh" content="0;url=${ contextPath }/managerMain.do">
	</c:if>

	<c:if test="${cnt == 0}">
		<p>등록된 상품이 없습니다.</p>
	</c:if>
	<c:if test="${cnt > 0}">
		<table border="1" style="border-collapse: collapse;">
			<tr height="50">
				<th width="50" align="center">번호</th>
				<th width="100" align="center">카테고리</th>
				<th width="100" align="center">상품명</th>
				<th width="100" align="center">가격</th>
				<th width="50" align="center">재고</th>
				<th width="50" align="center">이미지</th>
				<th width="200" align="center">상품정보</th>
				<th width="50" align="center">할인률</th>
				<th width="100" align="center">등록일</th>
				<th width="50" align="center">판매량</th>
				<th width="100" align="center" colspan="2">수정/삭제</th>
			</tr>
			<c:set var="number" value="0" />
			<c:forEach var="item" items="${registeredItemList}">
				<tr height="50">
					<td width="50" align="center">
						<c:set var="number" value="${number+1}" /> 
						${number}
					</td>
					<td width="100" align="center">
						<c:if test="${item.item_category == '100'}">채소</c:if> 
						<c:if test="${item.item_category == '200'}">해산물</c:if> 
						<c:if test="${item.item_category == '300'}">육류</c:if> 
						<c:if test="${item.item_category == '400'}">전자제품</c:if>
					</td>
					<td width="100" align="center">${item.item_name}</td>
					<td width="100" align="center">${item.item_price}</td>
					<td width="50" align="center">${item.item_stock}</td>
					<td width="50" align="center">
						<img src="${contextPath}/resources/img/${item.item_image}" height="50">
					</td>
					<td width="200" align="center">${item.item_info}</td>
					<td width="50" align="center">${item.discount_rate}</td>
					<td width="100" align="center">${item.reg_date}</td>
					<td width="50" align="center">${item.sold}</td>
					<td width="50" align="center">
						<button id="edit" name="${item.item_number}" onclick="edit(this)">수정</button>
					<td width="50" align="center">
						<button id="del" name="${item.item_number}" onclick="del(this)">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>