<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>날짜 포맷</title>
</head>
<body>
<ul>
    <li>
        <!-- 날짜 객체생성 방법 -->
        <%request.setAttribute("toDay_A", new java.util.Date());%> ${toDay_A}, 
        <jsp:useBean id="toDay_B" class="java.util.Date" /> ${toDay_B}, 
        <c:set var="toDay_C" value="<%=new java.util.Date()%>"/> ${toDay_C},
        <fmt:parseDate var="toDay_D" value="2018-11-28 16:42:00" pattern="yyyy-MM-dd HH:mm:ss" />
        <%
            // 데이터베이스 값이 Timestamp 경우 문자열 변환 필요
        %>
    </li>
    <li>
        <!-- 날짜 포맷 방법 -->
        <fmt:formatDate value="${toDay_A}" pattern="yyyy.MM.dd HH:mm:ss" />, 
        <fmt:formatDate value="${toDay_B}" pattern="yyyy-MM-dd HH:mm:ss"/>, 
        <fmt:formatDate value="${toDay_C}" pattern="E"/> 요일, 
        <fmt:formatDate value="${toDay_D}" pattern="yyyy-MM-dd"/>
        <%
            // 값이 Date 경우 parseDate 과정 필요 없음
        %>
    </li>
    <li>
        <!-- 날짜 계산 -->
        <fmt:parseDate var="sDate" value="20180101" pattern="yyyyMMdd" />
        <fmt:parseNumber value="${sDate.time / (1000*60*60*24)}" integerOnly="true" var="isDate" scope="request" />
        <fmt:parseDate var="tDate" value="20180301" pattern="yyyyMMdd" />
        <fmt:parseNumber value="${tDate.time / (1000*60*60*24)}" integerOnly="true" var="itDate" scope="request" />
        ${itDate - isDate} 일 지남
    </li>
</ul>
</body>
</html>