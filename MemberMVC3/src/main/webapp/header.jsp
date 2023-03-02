<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberMVC1</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
</head>

<body>
  <header>
          <div class="row">  <!--py-3 높이 (56) (수직정렬)-->
              <!-- 한줄이 col 12로 분리 할 수 있다  -->
            <div class="w-50 py-3" onclick="location.href='${ctx}/memberList.do'"> 회원목록 </div>
    
            
         <c:if test="${log eq null}">
            <div class="w-25 py-3" onclick="location.href='${ctx}/memberInsert.do'"> 회원가입 </div>
            <div class="w-25 py-3"  onclick="location.href='${ctx}/memberLogin.do'"> 로그인 </div>
          </c:if>
       <c:if test="${log ne null}">
                    <div class="w-25 py-3" onclick="location.href='${ctx}/memberContent.do?num=${log}'"> 내정보 </div>
                    <div class="w-25 py-3" onclick="location.href='${ctx}/memberLogout.do'"> 로그아웃 </div>
        </c:if>
        </div>
</header>
