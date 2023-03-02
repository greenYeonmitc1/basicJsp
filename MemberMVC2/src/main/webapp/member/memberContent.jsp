<%@page import="kr.basic.model.MemberVO"%>
<%@page import="kr.basic.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "header.jsp" %>

<body>
<c:if test="${vo==null}">
  <h1 class="py-3"> 일치하는 회원이 없습니다 </h1>
</c:if>
<c:if test="${vo ne null}">
<h1 class="py-3" > ${vo.name}  회원의 상세보기 </h1>
<form action="${ctx}/memberUpdate.do" method="post">
<input type="hidden" name="num" value="${vo.num}"/>
<table class='table table-bordered'>
  <tr>
    <td>번호</td>
    <td class="left"> ${vo.num}</td>
  </tr>
   <tr>
    <td>아이디</td>
    <td class="left">${vo.id}</td>
  </tr>
   <tr>
    <td>비밀번호</td>
    <td class="left">${vo.pass}</td>
  </tr>  
    <tr>
    <td>이름</td>
    <td class="left">${vo.name}</td>
  </tr> 
  <tr>
    <td>나이</td>
    <td><input class="col-12"  type="text" name="age" value="${vo.age}"/></td>
  </tr> 
     <tr>
    <td>이메일</td>
    <td><input class="col-12"  type="text" name="email" value="${vo.email}"/></td>
  </tr>
  <tr>
    <td>전화번호</td>
    <td><input class="col-12"  type="text" name="phone" value="${vo.phone}"/></td>
  </tr> 

  <tr>
    <td colspan="2" align="center">
       <input type="submit" value="수정하기" class='col-5 btn btn-primary'/>
    </td>
  </tr>
</table>
</c:if>

</body>
</html>