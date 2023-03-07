<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	. session.removeAttribute(String.name)
	. 위 명령어를 JSTL태그로 변경한 것이 아래 문장이다.
 --%>
<c:remove var="id" scope="session" />