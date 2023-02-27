<%@page import="kr.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int num =BoardDAO.getInstance().getMaxNo();%>    
<%@ include file= "header.jsp" %>
	<!-- padding top dottom 4px -->
	<h1 class="py-4">게시글 추가하기</h1>
	<form method="post" action="_04_addBoardPro.jsp">
	
		<table class="table" border="1">
			<tr>
				<th>번호</th>
				<td class="left"><%= num %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input class="col-12" type="text" name="writer"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input class="col-12" type="text" id="subject" name="subject"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="col-12" rows="10" cols="20" name="contents"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input class=" col-5 btn btn-outline-success" type="button" value="작성완료" onclick="checkForm(form)">
				</td>
			</tr>
		</table>
	</form>
	
	<script>
		
		function checkForm(form){
			let writer = document.querySelector('input[name="writer"]'); // form.writer
			let subject = document.querySelector('#subject'); // form.subject
			let contents = form.contents; // 외부에서 넘어온 form 태그안에 이름이 contents 태그 객체 가져옴 
			if(checkValue(writer)) return;
			if(checkValue(subject)) return;
			if(checkValue(contents)) return;
			
			form.submit();
			
			
			/*
			if(writer.value.trim().length == 0){
				alert('값이 비워져있으면 안됩니다');
				writer.focus();
				return;
			}
			if(subject.value.trim().length == 0){
				alert('값이 비워져있으면 안됩니다');
				subject.focus();
				return;
			}
			*/
		}
		
		function checkValue(tag){
			let value = tag.value.trim();
			if(value.length==0){
				alert('값이 비워져있으면 안됩니다');
				tag.focus();
				return true;
			}
			return false;
		}
	</script>
</body>
</html>












