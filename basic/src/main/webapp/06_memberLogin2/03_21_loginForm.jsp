<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

 <h1 class="py-3"> 로그인 페이지</h1>
 <form class="w-100" action="03_22_loginPro.jsp" method="post" >
 <table class="table">
 	<tr>
 		<td class="table-primary" >아이디</td>
 		<td><input type="text" name="id" /></td>
 	</tr>
 	 	<tr>
 		<td class="table-primary">비밀번호</td>
 		<td><input type="text" name="pw" /></td>
 	</tr>
 	<tr> <td colspan="2"><input type="submit" class="btn btn-primary w-100"  value="로그인" /> </td></tr>
 </table>
 </form>
</body>
</html>