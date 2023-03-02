<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "header.jsp" %>
<body>
<h1 class="py-3"> 회원 가입</h1>
<form action="${ctx}/memberInsert.do" method="post">
<table class="table table-bordered">
  <tr>
    <td>아이디</td>
    <td><input class="col-12" type="text" name="id"/></td>
  </tr>
  <tr>
    <td>패스워드</td>
    <td><input class="col-12" type="password" name="pass"/></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><input class="col-12" type="text" name="name"/></td>
  </tr>
  <tr>
    <td>나이</td>
    <td><input class="col-12" type="text" name="age"/></td>
  </tr>
  <tr>
    <td>이메일</td>
    <td><input class="col-12" type="text" name="email"/></td>
  </tr>
  <tr>
    <td>전화번호</td>
    <td><input class="col-12" type="text" name="phone"/></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" value="가입" class="col-3 btn btn-primary"/>
      <input type="reset" value="취소" class="col-3 btn btn-warning"/>
    </td>
  </tr>
</table>
</form>


</body>
</html>