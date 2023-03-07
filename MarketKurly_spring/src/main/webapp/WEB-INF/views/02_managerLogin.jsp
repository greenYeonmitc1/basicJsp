<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%-- 외부의 자바스크립트 코드를 jsp파일로 불러오기 위한 명령어 --%>
	<script src="${contextPath}/resources/jq/jquery-1.11.0.min.js"></script>
	<script src="${contextPath}/resources/js/02_managerlogin.js"></script>
	<style>
		ul li{
			list-style: none;
		}
</style>
</head>
<body>
	<c:if test="${empty sessionScope.id}">
		<ul>
			<li>
				아이디 <input type="email" id="id" name="id" placeholder="marketkurly">
				비밀번호 <input type="password" id="pw" name="pw" placeholder="6~16자 숫자/문자">
				<button id="login">로그인</button>
			</li>
		</ul>
	</c:if>
	<c:if test="${!empty sessionScope.id}">
		<ul>
			<li>관리자님 접속 중
				<button id="logout">로그아웃</button>
			</li>
		</ul>
	</c:if>
</body>
</html>