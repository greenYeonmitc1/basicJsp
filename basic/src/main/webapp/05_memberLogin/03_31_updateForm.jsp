<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

List<String> ids=  (List<String>)session.getAttribute("idList" ); // Object 타입으로 업케스팅 저장
List<String> names= (List<String>)session.getAttribute("nameList" );
List<String>genders=(List<String>)session.getAttribute("genderList" );
int idx = (int)session.getAttribute("idx");
String id = ids.get(idx);
String name = names.get(idx);
String gender = genders.get(idx);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

 <h1> 회원 정보 수정 </h1>
 <form action="03_32_updatePro.jsp" method="post">

 <table>
 	<tr>
 		<td>아이디</td>
 		<!-- readonly 속성을 붙이면 수정 불가능  -->
 		<td><input type="text" name="id" value="<%=id%>" readonly/></td>
 	</tr>
 	 <tr>
 		<td>비밀번호</td>
 		<td><input type="text" name="pw" /></td>
 	</tr>
 	 	 <tr>
 		<td>이름</td>
 		<td><input type="text" name="name" value="<%=name%>" /></td>
 	</tr>
 	 <tr>
 		<td>성별</td>
 			<!-- 태그 안에서도 자바(여기서는 조건문) 사용가능   -->
 		<td><input type="radio" name="gender" value="남성"<%if(gender.equals("남성")){%> checked <%} %>  /> 남성
 		    <input type="radio" name="gender" value="여성"<%if(gender.equals("여성")){%> checked <%} %>  /> 여성
 		</td>
 	</tr>
 	 <tr>
 		<td colspan="2"><input type="submit" value="입력완료" /></td>
 	</tr>
 </table>
</form>
</body>
</html>