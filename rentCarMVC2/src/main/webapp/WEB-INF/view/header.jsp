<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연미 렌트카</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>

<body>
   <header>
	<table>
		<tr height="70" class="right">
		
			<td colspan="5" class="right" >
			<c:if test="${id ne null}">
				${id}님
				<button onclick="location.href='${ctx}/memberLogout.do'"> 로그아웃 </button> 
	    	</c:if>
			<c:if test="${id eq null}">
			<button onclick="location.href='main.do?center=memberLogin'"> 로그인 </button>
			</c:if>
			</td>
	
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="${ctx}/carMain.do" 
				style="text-decoration: none">예 약 하 기</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="main.do?center=carReserveInfo" 
				style="text-decoration: none">예 약 확 인</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="#" style="text-decoration: none">자유게시판</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="#" style="text-decoration: none">이  벤  트</a></font>
			</td>
			<td align="center" width="200" bgcolor="pink">
				<font color="white" size="5"><a href="#" style="text-decoration: none">고 객 센 터</a></font>
			</td>
		</tr>
	</table>
	</header>
	<section>
