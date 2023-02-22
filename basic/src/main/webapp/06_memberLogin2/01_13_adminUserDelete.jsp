<%@page import="kr.basic.model.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 

    String idx = request.getParameter("idx"); 
    
    %>

    <%
      if(idx == null || session.getAttribute("admin")==null){
    	  %>
    	  <script>
    	     alert("잘못된 접근입니다");
    	     location.href="02_main.jsp";
    	  </script>
    	  
    	  <%
      }else{

    	  int index = Integer.parseInt(idx);
          MemberDAO.getInstance().deleteMember(index);
    	

      %>
    		  <script>
    	     alert("회원삭제 완료");
    	
    	     location.href="01_12_adminUserList.jsp";
    	  </script>

    <%} %>
</body>
</html>