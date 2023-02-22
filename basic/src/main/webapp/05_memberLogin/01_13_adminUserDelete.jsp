<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 

    String idx = request.getParameter("idx"); 
    List<String> idList = (ArrayList<String>) session.getAttribute("idList");
    List<String> pwList =(ArrayList<String>) session.getAttribute("pwList");
    List<String> nameList = (ArrayList<String>) session.getAttribute("nameList");
    List<String> genderList =(ArrayList<String>) session.getAttribute("genderList");
      
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
    	  idList.remove(index);
    	  pwList.remove(index);
    	  nameList.remove(index);
    	  genderList.remove(index);
    	  
    	  session.setAttribute("idList",idList );
    	  session.setAttribute("pwList",pwList );
    	  session.setAttribute("nameList",nameList );
    	  session.setAttribute("genderList",genderList );

      %>
    		  <script>
    	     alert("회원삭제 완료");
    	
    	     location.href="01_12_adminUserList.jsp";
    	  </script>

    <%} %>
</body>
</html>