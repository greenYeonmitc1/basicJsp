<%@page import="kr.basic.model.MemberVO"%>
<%@page import="kr.basic.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "header.jsp" %>
<%
  int num =-1;
  if(request.getParameter("num")==null){
	  response.sendRedirect("01_memberlist.jsp");
  }else{
	  num = Integer.parseInt(request.getParameter("num"));
  }
  MemberVO vo=MemberDAO.getInstance().memberContent(num);
%>    


<body>
<%  if(vo==null){ %>
  <h1 class="py-3"> 일치하는 회원이 없습니다 </h1>
<%}else{ %>
<h1 class="py-3" > <%=vo.getName()%> 회원의 상세보기 </h1>
<form action="07_memberUpdatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=vo.getNum()%>"/>
<table class='table table-bordered'>
  <tr>
    <td>번호</td>
    <td class="left"> <%=vo.getNum()%></td>
  </tr>
   <tr>
    <td>아이디</td>
    <td class="left"><%=vo.getId()%></td>
  </tr>
   <tr>
    <td>비밀번호</td>
    <td class="left"><%=vo.getPass()%></td>
  </tr>  
    <tr>
    <td>이름</td>
    <td class="left"><%=vo.getName()%></td>
  </tr> 
  <tr>
    <td>나이</td>
    <td><input class="col-12"  type="text" name="age" value="<%=vo.getAge()%>"/></td>
  </tr> 
     <tr>
    <td>이메일</td>
    <td><input class="col-12"  type="text" name="email" value="<%=vo.getEmail()%>"/></td>
  </tr>
  <tr>
    <td>전화번호</td>
    <td><input class="col-12"  type="text" name="phone" value="<%=vo.getPhone()%>"/></td>
  </tr> 

  <tr>
    <td colspan="2" align="center">
       <input type="submit" value="수정하기" class='col-5 btn btn-primary'/>
    </td>
  </tr>
</table>
</form>
  <% } %>

</body>
</html>