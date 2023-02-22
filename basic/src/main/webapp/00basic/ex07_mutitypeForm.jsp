<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 /*
    라디오 버튼은 속성에 이름값이 같으면 한개만 선택 가능하다 
    라디오 버튼 이름이 다르면 다중 선택이 가능하다 => request.getPatarameter() : String 
    
    체크박스는 다중선택이 가능하다 => request.getPatarameterValues() : String[]로 값전달 받음
    
    textarea => input 태그 아닌데도 우리가 value 값을 전달 받을 수 있음 
 */
%>
	<div align="center">
		<h2>학번, 이름, 학년, 선택과목을 입력하는 폼</h2>
		    
	    <form method="post" action="ex07_mutitypeFormPro.jsp">
	    	<table border="1">
	    	<tr>
	    		<td>학번</td>
	    		<td><input type="number" name="num"></td>
	        </tr>
	        <tr>
	         	<td>이름</td>
	         	<td><input type="text" name="name"></td>
	        </tr>
	        <tr>
	        	<td>학년</td>
	        	<td>
		        	 <input type="radio" name="grade" value="1" checked>1학년&nbsp;
			         <input type="radio" name="grade" value="2">2학년&nbsp;
			         <input type="radio" name="grade" value="3">3학년&nbsp;
			         <input type="radio" name="grade" value="4">4학년
	        	</td>
	        </tr>
	        <tr>
	        	<td> 선택과목</td>
	        	<td>
			        <select name="subject">
			             <option value="JAVA">JAVA</option>
			             <option value="JSP" selected >JSP</option>
			             <option value="SPRING">SPRING</option>
			         </select>     	
	        	</td>
	        </tr>
	         <tr>
	        	<td>취미</td>
	        	<td>
		        	<input type="checkbox" name="hobbies" value="운동">운동
				   	<input type="checkbox" name="hobbies" value="독서">독서
				   	<input type="checkbox" name="hobbies" value="공부">공부  
				   	<input type="checkbox" name="hobbies" value="쇼핑">쇼핑        	
	        	</td>
	        </tr>
			<tr>
				<td>메모</td>
				<td><textarea rows="10" cols="50" name="memo">
				
				</textarea></td>
			</tr>
	         	<tr>
	         		<td colspan="2" align="center"><input type="submit" value="입력완료"></td>
	         	</tr>
	         </table>
	    </form>
	  </div>
</body>
</html>